numBins = 256;
treeNum = [10,150];
splitNum = [3,5,7,10,12,14,16,18,20,25,30,35,40,50,100,150];
learner_t = {'axis-aligned', 'two-pixel'};

accuracy_rf_all=zeros(numel(treeNum), numel(splitNum), numel(learner_t));
buildCodebookTime_all=zeros(numel(treeNum), numel(splitNum), numel(learner_t));
buildRfClassifierTime_all=zeros(numel(treeNum), numel(splitNum), numel(learner_t));

for index=1:numel(treeNum)
    for jindex=1:numel(splitNum)
        for kindex=1:numel(learner_t)
            learner_type = learner_t{kindex};
            numTrees = treeNum(index);
            split = splitNum(jindex);
            filename =  sprintf('data_collection/learner_split/numbins_%d/%d_splitnum_%d_learner_%d_treenum.mat', numBins,split,kindex,numTrees);
            load(filename);
            accuracy_rf_all(index, jindex, kindex)=accuracy_rf;
            buildCodebookTime_all(index, jindex, kindex)=buildCodebookTime;      
            buildRfClassifierTime_all(index, jindex, kindex)=buildRFTime; 
        end
    end
end

clearvars -except buildCodebookTime_all accuracy_rf_all splitNum treeNum numBins learner_t buildRfClassifierTime_all