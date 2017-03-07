% Simple Random Forest Toolbox for Matlab
% written by Mang Shao and Tae-Kyun Kim, June 20, 2014.
% updated by Tae-Kyun Kim, Feb 09, 2017

% This is a guideline script of simple-RF toolbox.
% The codes are made for educational purposes only.
% Some parts are inspired by Karpathy's RF Toolbox

% Under BSD Licence
rng(1);

% turn off rank deficient warning:
% comes about in getE when trying to find entropy of an empty dataset
warning('off', 'MATLAB:rankDeficientMatrix');

%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%% 
% experiment with Toy_Spiral dataset for classification
%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%
% Initialisation
% init;

% Select dataset
[data_train, data_test] = getData('Toy_Spiral'); % {'Toy_Gaussian', 'Toy_Spiral', 'Toy_Circle', 'Caltech'}


% for loop to iterate over all the types of split functions
%%%%%%%%%%%%%
% check the training and testing data
    % data_train(:,1:2) : [num_data x dim] Training 2D vectors
    % data_train(:,3) : [num_data x 1] Labels of training data, {1,2,3}
    
plot_toydata(data_train);

    % data_test(:,1:2) : [num_data x dim] Testing 2D vectors, 2D points in the
    % uniform dense grid within the range of [-1.5, 1.5]
    % data_train(:,3) : N/A
    
scatter(data_test(:,1),data_test(:,2),'.b');


% Set the random forest parameters for instance, 
param.num = 100;         % Number of trees
param.depth = 5;        % trees depth
param.splitNum = 3;     % Number of split functions to try
param.weakLearner='cube-features';
param.split = 'IG';     % Currently support 'information gain' only

%%%%%%%%%%%%%%%%%%%%%%
% Train Random Forest

% Grow all trees
trees = growTrees(data_train,param);
trees=fix_trees(trees);

%%%%%%%%%%%%%%%%%%%%%%
% Evaluate/Test Random Forest
%increment each cell in leaves by 1
leaves=testTrees_fast(data_test,trees,param.weakLearner) + 1;

%append new row to prob
p_rf = trees(1).prob(leaves,:);

% get the probabilities of the each class
p_rf_sum=[sum(reshape(p_rf(:,1),[length(data_test),param.num]),2)...
          sum(reshape(p_rf(:,2),[length(data_test),param.num]),2)...
          sum(reshape(p_rf(:,3),[length(data_test),param.num]),2)];

[~,data_test(:,3)]=max(p_rf_sum');

plot_toydata(data_test);

% to visual class distributions
% plot_class_distributions(trees);

%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%% 
% experiment with Caltech101 dataset for image categorisation
%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%

% init;

% Using rf-codebook or k - means
% rf_codebook=0 : k-means
% rf_codebook=1 : rf
rf_codebook=1;

% number of descriptors to use
numDescriptors=10e4;

% If using rf codebook, describe parameters
param.num = 5;         % Number of trees
param.depth = 5;        % trees depth
param.splitNum = 5;     % Number of split functions to try
param.split = 'IG';     % Currently support 'information gain' only
param.weakLearner = 'two-pixel';

% If using K-means, define number of bins
numBins=256;

% define number of training and testing images
% first index represents training, second index represents testing
imgSel=[15 15];

[data_train, data_test, folderName, classList, imgIdx_tr, imgIdx_te] = getData('Caltech',imgSel, numDescriptors, rf_codebook,numBins,param);
close all;

% Set the random forest parameters ...
param.num = 100;         	% Number of trees
param.depth = 5;        % trees depth
param.splitNum = 3;     % Number of split functions to try
param.weakLearner='axis-aligned';
param.split = 'IG';     % Currently support 'information gain' only

% Grow all trees
trees = growTrees(data_train,param);
trees = fix_trees(trees);

% Evaluate/Test Random Forest ...
leaves=testTrees_fast(data_test,trees,param.weakLearner)+1;
p_rf = trees(1).prob(leaves,:);

% initialise matrix to hold values
p_rf_sum=zeros(size(data_test,1),10);
for i=1:10
    p_rf_sum(:,i)=sum(reshape(p_rf(:,i),[size(data_test,1),param.num]),2);
end

confus_script;

% plotting of correctly and wrongly classified data 
% num_plot=5;
% misclassified_plotting;
% num_plot=5;
% correctlyclassified_plotting;

