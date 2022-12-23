function predict = knntrain(data,class)

%Create empty set for assign accuracy value per each simulation
accuracy = [];
%We will run the model 10 simulations to observe the average and find
%optimal k value for our model
for sim = 1:10
%Divide the data to train and test data => 70-30%
[m,n] = size(data);
index = randperm(m);
traindata = data(index(1:round(0.70*m)),:); %train data => 70% of data
test_data = data(index(round(0.70*m)+1:end),:); % test data => 30% of data
trainclass = class(index(1:round(0.70*m))); %train class => 70%
testclass = class(index(round(0.70*m)+1:end)); %test class => 30%

%We set k=3,5 and 7 to compare accuracy
k = 3;

%Calculate distance between 2 points by using Euclidean distance
[p,~] = size(test_data);
[q,~] = size(traindata);
trainclass = reshape(trainclass, [length(trainclass) 1]);

    matchclass = 0;
    for i = 1:p
        distance = [];
        for j = 1:q
            distance = [distance sqrt(sum((test_data(i,:)-traindata(j,:)).^2))];
        end
        %Sort the distance of data to find k-nearest and use mode(class) to 
        %predict class
        [~,idx] = sort(distance);
        idxclass = trainclass(idx);
        for l=1:k
            knearest(l) = trainclass(idx(l),1);
        end
        predict(i) = mode(knearest);

   
    %Test our predicted class with test class and calculate accuracy
        if predict(i) == testclass(i)
            matchclass = matchclass+1;
        end
    end

acc = matchclass/length(testclass)*100;
accuracy = [accuracy acc];
sim = sim+1;
end
fprintf('accuracy = %4.2f\n',accuracy)

%Visualize test data with predicted class
xyz = reshape(test_data,[],3); %Reshape test data to N*3 matrix
cc = repmat(predict',222,1); %Repmat predicted class matrix to N*1 matrix 
figure
scatter3(xyz(:,1),xyz(:,2),xyz(:,3), 30, cc, 'filled')
colorbar