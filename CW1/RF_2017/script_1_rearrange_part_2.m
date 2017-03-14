numBins = [64,128,256];
treeNum = [5,10,15,20,25,30,35,40,45,50,75,100,125,150,175,200];
accuracy_rf_all=zeros(numel(numBins), numel(treeNum));
buildRfClassifierTime_all=zeros(numel(numBins), numel(treeNum));

for jindex=1:numel(numBins)
    for index=1:numel(treeNum)
        numTrees = treeNum(index);
        numBin=numBins(jindex);
        filename =  sprintf('data_collection/kmean_treedepth_accuracy_2/numbin_%d/%d.mat', numBin, treeNum(index));
        load(filename);
        accuracy_rf_all(jindex,index)=accuracy_rf;
        buildRfClassifierTime_all(jindex,index)=buildRFTime;
    end
end

clearvars -except accuracy_rf_all buildRfClassifierTime_all treeNum numBins