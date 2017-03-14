%% get results for impact on RF tree number with kmeans codebook
numBins = 256;
treeNum = [5,10,20,50,100,150,200];
depthtree = 5;
split = 3;
rf_codebook=1;
numTrees_cb = [5, 10 , 20, 30];
learner_type = 'two-pixel';
for index=1:numel(treeNum)
        for jindex=1:numel(numTrees_cb)
            numTrees = treeNum(index)
            numTrees_codebook = numTrees_cb(jindex)
            filename =  sprintf('data_collection/rf_numtreesvary/%d_codebooktrees_%d_classifiertrees.mat', numTrees_codebook,numTrees);
            filename_fig = sprintf('data_collection/rf_numtreesvary/%d_codebooktrees_%d_classifiertrees.fig', numTrees_codebook,numTrees);
            main_guideline;
        end
end


%%