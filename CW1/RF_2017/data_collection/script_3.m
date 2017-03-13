numBins = 256;
treeNum = [10,50,150];
depth = [3,4,5,6,7,8,9,10];
split = 3;
learner_t = {'axis-aligned', 'two-pixel','linear'};
for index=1:numel(treeNum)
    for kindex=1:numel(learner_t)
        for jindex=1:numel(depth)
            learner_type = learner_t{kindex}
            numTrees = treeNum(index)
            depthtree = depth(jindex)
            filename =  sprintf('data_collection/kmean_depthtree_accuracy_4/numbins_256/%d_tree num_%d_learner_%d_depth.mat', numTrees,kindex,depthtree);
            filename_fig = sprintf('data_collection/kmean_depthtree_accuracy_4/numbins_256/%d_tree num_%d_learner_%d_depth.fig', numTrees,kindex,depthtree);
            main_guideline;
        end
    end
end

numBins = 128;
for index=1:numel(treeNum)
    for kindex=1:numel(learner_t)
        for jindex=1:numel(depth)
            learner_type = learner_t{kindex}
            numTrees = treeNum(index)
            depthtree = depth(jindex)
            filename =  sprintf('data_collection/kmean_depthtree_accuracy_4/numbins_128/%d_tree num_%d_learner_%d_depth.mat', numTrees,kindex,depthtree);
            filename_fig = sprintf('data_collection/kmean_depthtree_accuracy_4/numbins_128/%d_tree num_%d_learner_%d_depth.fig', numTrees,kindex,depthtree);
            main_guideline;
        end
    end
end

%%
numBins = 64;
treeNum = [10,50,150];
depth = [3,4,5,6,7,8,9,10];
split = 3;
learner_t = {'axis-aligned', 'two-pixel','linear'};
for index=1:numel(treeNum)
    for kindex=1:numel(learner_t)
        for jindex=1:numel(depth)
            learner_type = learner_t{kindex}
            numTrees = treeNum(index)
            depthtree = depth(jindex)
            filename =  sprintf('data_collection/kmean_depthtree_accuracy_4/numbins_64/%d_tree num_%d_learner_%d_depth.mat', numTrees,kindex,depthtree);
            filename_fig = sprintf('data_collection/kmean_depthtree_accuracy_4/numbins_64/%d_tree num_%d_learner_%d_depth.fig', numTrees,kindex,depthtree);
            main_guideline;
        end
    end
end
