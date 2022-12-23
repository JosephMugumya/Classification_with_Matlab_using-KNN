function normtestdata = pre(testdata)
    normtestdata = zeros(1, 222*3);
    meandata = mean(testdata);
    std_data = std(testdata,1);
    testdata = normalizedata(testdata,meandata,std_data);
    testdata = reshape(testdata.',1,[]);
    normtestdata(1, 1:size(testdata, 2)) = testdata;
end