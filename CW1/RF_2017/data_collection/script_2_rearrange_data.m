numBins = 256;
treeNum = [10,50,150];
splitNum = [3,5,7,9,11];
learner_t = {'axis-aligned', 'two-pixel', 'quad-features-x-axis-only', 'linear', 'cube-features-x-axis-only'};

accuracy_rf_all=zeros(numel(treeNum), numel(splitNum), numel(learner_t));
buildCodebookTime_all=zeros(numel(treeNum), numel(splitNum), numel(learner_t));

for index=1:numel(treeNum)
    for jindex=1:numel(splitNum)
        for kindex=1:numel(learner_t)
            learner_type = learner_t{kindex};
            numTrees = treeNum(index);
            split = splitNum(jindex);
            filename =  sprintf('data_collection/kmean_learner_split_accuracy_3/numbins_%d/%d_splitnum_%d_learner_%d_treenum.mat', numBins,split,kindex,numTrees);
            load(filename);
            accuracy_rf_all(index, jindex, kindex)=accuracy_rf;
            buildCodebookTime_all(index, jindex, kindex)=buildCodebookTime;        
        end
    end
end

clearvars -except buildCodebookTime_all accuracy_rf_all splitNum treeNum numBins learner_t