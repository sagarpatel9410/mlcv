%% get training data
rf_codebook=0;
numDescriptors=10e4;
param.num = 5;         % Number of trees
param.depth = 5;        % trees depth
param.splitNum = 5;     % Number of split functions to try
param.split = 'IG';     % Currently support 'information gain' only
param.weakLearner = 'two-pixel';
numBins=512;
imgSel=[15 15];
[data_train, ~, ~, classList, ~, ~] = getData('Caltech',imgSel, numDescriptors, rf_codebook,numBins,param);
clearvars -except data_train numBins

%% 10
load k_10_data_train.mat
subplot(3,1,1)
bar(1:numBins,mean(data_train(1:15,1:numBins)));
axis([1 numBins 0 0.4])
title('Class 1, 10 Bins', 'FontSize', 25)
subplot(3,1,2)
bar(1:numBins,mean(data_train(16:30,1:numBins)));
axis([1 numBins 0 0.4])
title('Class 4, 10 Bins', 'FontSize', 25)
subplot(3,1,3)
bar(1:numBins,mean(data_train(76:90,1:numBins)));
axis([1 numBins 0 0.4])
title('Class 7, 10 Bins', 'FontSize', 25)
scale_graph

%% 128
load k_128_data_train.mat
subplot(3,1,1)
bar(1:numBins,mean(data_train(1:15,1:numBins)));
axis([1 numBins 0 0.075])
title('Class 1 Averaged Histogram, 128 Bins', 'FontSize', 35)
subplot(3,1,2)
bar(1:numBins,mean(data_train(16:30,1:numBins)));
axis([1 numBins 0 0.075])
title('Class 4 Averaged Histogram, 128 Bins', 'FontSize', 35)
subplot(3,1,3)
bar(1:numBins,mean(data_train(76:90,1:numBins)));
axis([1 numBins 0 0.075])
title('Class 7 Averaged Histogram, 128 Bins', 'FontSize', 35)
scale_graph


%% 512
load k_512_data_train.mat
subplot(3,1,1)
bar(1:numBins,mean(data_train(1:15,1:numBins)));
axis([1 numBins 0 0.04])
title('Class 1 Averaged Histogram, 512 Bins', 'FontSize', 35)
subplot(3,1,2)
bar(1:numBins,mean(data_train(16:30,1:numBins)));
axis([1 numBins 0 0.04])
title('Class 4 Averaged Histogram, 512 Bins', 'FontSize', 35)
subplot(3,1,3)
bar(1:numBins,mean(data_train(76:90,1:numBins)));
axis([1 numBins 0 0.04])
title('Class 7 Averaged Histogram, 512 Bins', 'FontSize', 35)
scale_graph
