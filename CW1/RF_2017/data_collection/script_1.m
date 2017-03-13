clear all;

%% get results for impact of num bin on accuracy
split = 3;
learner_type = 'two-pixel';
treeNum = [10,50,150]; % specifies the number of trees for RF classifier
numBin = [10,20,32,40,50,60,70,80,90,100,110,120,128,140,150,160,170,180,190,200,256,512,1024];
for index=1:numel(numBin)
    for jindex = 1:numel(treeNum)
    numBins = numBin(index)
    numTrees = treeNum(jindex)
    filename =  sprintf('data_collection/kmean_codebook_accuracy_1/%d_num_trees_%d.mat', numTrees, numBins);
    filename_fig = sprintf('data_collection/kmean_codebook_accuracy_1/%d_num_trees_%d.fig', numTrees, numBins);
    main_guideline;
    end
end

%% get results for impact on RF tree number with kmeans codebook
numBins = 256
treeNum = [5,10,15,20,25,30,35,40,45,50,75,100,125,150,175,200];
for index=1:numel(treeNum)
    numTrees = treeNum(index)
    filename =  sprintf('data_collection/kmean_treedepth_accuracy_2/numbin_256/%d.mat', treeNum(index));
    filename_fig = sprintf('data_collection/kmean_treedepth_accuracy_2/numbin_256/%d.fig', treeNum(index));
    main_guideline;
end
%%
numBins = 128
treeNum = [5,10,15,20,25,30,35,40,45,50,75,100,125,150,175,200];
depthtree = 5;
for index=8:16
    numTrees = treeNum(index)
    filename =  sprintf('data_collection/kmean_treedepth_accuracy_2/numbin_128/%d.mat', treeNum(index));
    filename_fig = sprintf('data_collection/kmean_treedepth_accuracy_2/numbin_128/%d.fig', treeNum(index));
    main_guideline;
end

numBins = 64
treeNum = [5,10,15,20,25,30,35,40,45,50,75,100,125,150,175,200];
for index=8:16
    numTrees = treeNum(index)
    filename =  sprintf('data_collection/kmean_treedepth_accuracy_2/numbin_64/%d.mat', treeNum(index));
    filename_fig = sprintf('data_collection/kmean_treedepth_accuracy_2/numbin_64/%d.fig', treeNum(index));
    main_guideline;
end
