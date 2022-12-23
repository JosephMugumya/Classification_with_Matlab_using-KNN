function C = digit_classify(testdata)

alldata = load('alldata.mat');
traindata = alldata.normdata;
trainclass = alldata.class;

normtestdata = pre(testdata);

k = 3;

%Calculate distance between 2 points by using Euclidean distance
distance = [];
[p,~] = size(normtestdata);
[q,~] = size(traindata);
trainclass = reshape(trainclass, [length(trainclass) 1]);
    for i = 1:p
        distance = [];
        for j = 1:q
            x = traindata(j,:);
            distance = [distance sqrt(sum((normtestdata-x).^2))];
        end
        %Sort the distance of data to find k-nearest and use mode(class) to 
        %predict class
        [~,idx] = sort(distance);
        idxclass = trainclass(idx);
        for l=1:k
            knearest(l) = trainclass(idx(l),1);
        end
        C(i) = mode(knearest);

    end

