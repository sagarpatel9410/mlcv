treeNum = [10,50,150]; % specifies the number of trees for RF classifier
numBin = [10,20,32,40,50,60,70,80,90,100,110,120,128,140,150,160,170,180,190,200,256,512,1024];

accuracy_rf_all=zeros(numel(treeNum), numel(numBin));
buildCodebookTime_all=zeros(numel(treeNum), numel(numBin));


for index=1:numel(numBin)
    for jindex = 1:numel(treeNum)
    numBins = numBin(index);
    numTrees = treeNum(jindex);
    filename =  sprintf('data_collection/kmean_codebook_accuracy_1/%d_num_trees_%d.mat', numTrees, numBins);
    load(filename);
    buildCodebookTime_all(jindex, index)=buildCodebookTime;
    accuracy_rf_all(jindex, index)=accuracy_rf;
    end
end
