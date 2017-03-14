numBins = 256;
treeNum = [10];
depth = [3,4,5,6,7,8,9,10,11,12,13,14,15];
split = 3;
learner_t = {'axis-aligned', 'two-pixel'};

accuracy_rf_all=zeros(numel(treeNum), numel(depth), numel(learner_t));
buildCodebookTime_all=zeros(numel(treeNum), numel(depth), numel(learner_t));
buildRfClassifierime_all=zeros(numel(treeNum), numel(depth), numel(learner_t));


for index=1:numel(treeNum)
    for kindex=1:numel(learner_t)
        for jindex=1:numel(depth)
            learner_type = learner_t{kindex};
            numTrees = treeNum(index);
            depthtree = depth(jindex);
            filename =  sprintf('data_collection/kmean_depthtree_accuracy_4/numbins_%d/%d_tree num_%d_learner_%d_depth.mat',numBins,numTrees,kindex,depthtree);
            load(filename);
            accuracy_rf_all(index, jindex, kindex)=accuracy_rf;
            buildCodebookTime_all(index, jindex, kindex)=buildCodebookTime;
            buildRfClassifierime_all(index, jindex, kindex)=buildRFTime;
        end
    end
end

clearvars -except buildCodebookTime_all buildRfClassifierime_all accuracy_rf_all depth treeNum numBins split
