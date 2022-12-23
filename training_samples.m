function [normdata class] = training_samples(savefile)
%Import data : There are 1000 files, which is 100 samples of each
%digit(0-9)
name = './training_data/';
path = fullfile(name);
import = dir(append(path, "*.mat"));
filelength = length(import);
    
%Create empty matrix (1000,666) row is 1000 because there are 1000 files
%and 666 is the maximum of rows among all the files multiple with 3
%columns(x,y,z)
normdata = zeros(filelength,666);
%Create empty matrix to attend class
class = zeros(filelength, 1);

%Using name of each file to assign class into matrix
for i = 1:filelength
    fileidx = import(i).name;    
    data = load(append(path, fileidx));
    data = data.pos;
    class(i) = floor(i/101);
   
    %Normalized data before classifying
    mean_data = mean(data);
    std_data = std(data,1);
    data = normalizedata(data, std_data, mean_data);

    %Reshape data from (N,3) to (1,N*3)
    data = reshape(data.', 1, []);
    %Adding data to  
    normdata(i, 1:length(data)) = data;
end
class = class';

if savefile == 1
        save('alldata.mat', 'normdata', 'class')
end

