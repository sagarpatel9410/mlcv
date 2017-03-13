%% get results for impact on RF tree number with kmeans codebook
numBins = 256;
treeNum = [10,50,150];
splitNum = [3,5,7,9,11];
learner_t = {'axis-aligned', 'two-pixel', 'quad-features-x-axis-only', 'linear', 'cube-features-x-axis-only'};
for index=1:numel(treeNum)
    for jindex=1:numel(splitNum)
        for kindex=1:numel(learner_t)
            learner_type = learner_t{kindex}
            numTrees = treeNum(index)
            split = splitNum(jindex)
            filename =  sprintf('data_collection/kmean_learner_split_accuracy_3/numbins_256/%d_splitnum_%d_learner_%d_treenum.mat', split,kindex,numTrees);
            filename_fig = sprintf('data_collection/kmean_learner_split_accuracy_3/numbins_256/%d_splitnum_%d_learner_%d_treenum.fig', split,kindex,numTrees);
            main_guideline;
        end
    end
end
%%
numBins = 128
treeNum = [10,50,150];
splitNum = [3,5,7,9,11];
depthtree = 5;
learner_t = {'axis-aligned', 'two-pixel', 'quad-features-x-axis-only', 'linear', 'cube-features-x-axis-only'};

for index=1:numel(treeNum)
    for jindex=1:numel(splitNum)
        for kindex=1:numel(learner_t)
            learner_type = learner_t{kindex}
            numTrees = treeNum(index)
            split = splitNum(jindex)
            filename =  sprintf('data_collection/kmean_learner_split_accuracy_3/numbins_128/%d_splitnum_%d_learner_%d_treenum.mat', split,kindex,numTrees);
            filename_fig = sprintf('data_collection/kmean_learner_split_accuracy_3/numbins_128/%d_splitnum_%d_learner_%d_treenum.fig', split,kindex,numTrees);
            main_guideline;
        end
    end
end

numBins = 64
treeNum = [10,50,150];
splitNum = [3,5,7,9,11];
learner_t = {'axis-aligned', 'two-pixel', 'quad-features-x-axis-only', 'linear', 'cube-features-x-axis-only'};

for index=1:numel(treeNum)
    for jindex=1:numel(splitNum)
        for kindex=1:numel(learner_t)
            learner_type = learner_t{kindex}
            numTrees = treeNum(index)
            split = splitNum(jindex)
            filename =  sprintf('data_collection/kmean_learner_split_accuracy_3/numbins_64/%d_splitnum_%d_learner_%d_treenum.mat', split,kindex,numTrees);
            filename_fig = sprintf('data_collection/kmean_learner_split_accuracy_3/numbins_64/%d_splitnum_%d_learner_%d_treenum.fig', split,kindex,numTrees);
            main_guideline;
        end
    end
end
