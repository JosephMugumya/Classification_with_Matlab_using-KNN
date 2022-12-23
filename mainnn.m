clear all
clc

[normdata class] = training_samples(1);
predictclass = knntrain(normdata,class);

samples = load('stroke_6_0091.mat');
testdata = samples.pos;

C = digit_classify(testdata)

