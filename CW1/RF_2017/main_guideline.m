% Simple Random Forest Toolbox for Matlab
% written by Mang Shao and Tae-Kyun Kim, June 20, 2014.
% updated by Tae-Kyun Kim, Feb 09, 2017

% This is a guideline script of simple-RF toolbox.
% The codes are made for educational purposes only.
% Some parts are inspired by Karpathy's RF Toolbox

rng(0);

% Under BSD Licence

% Initialisation
init;

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
param.num = 5;         % Number of trees
param.depth = 5;        % trees depth
param.splitNum = 10;     % Number of split functions to try
param.weakLearner='axis-aligned';
param.split = 'IG';     % Currently support 'information gain' only

%%%%%%%%%%%%%%%%%%%%%%
% Train Random Forest

% Grow all trees
trees = growTrees(data_train,param);

%%%%%%%%%%%%%%%%%%%%%%
% Evaluate/Test Random Forest
%increment each cell in leaves by 1
leaves=testTrees_fast(data_test,trees,param.weakLearner) + 1;

%append new row to prob
b = [1/3,1/3,1/3];
trees(1).prob = [b;trees(1).prob];
p_rf = trees(1).prob(leaves,:);

% get the probabilities of the each class
p_rf_sum=[sum(reshape(p_rf(:,1),[length(data_test),param.num]),2)...
          sum(reshape(p_rf(:,2),[length(data_test),param.num]),2)...
          sum(reshape(p_rf(:,3),[length(data_test),param.num]),2)];

[~,data_test(:,3)]=max(p_rf_sum');

plot_toydata(data_test);

% to visual class distributions
plot_class_distributions(trees);


%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%% 
% experiment with Caltech101 dataset for image categorisation
%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%

% init;
% % Select dataset
% % we do bag-of-words technique to convert images to vectors (histogram of codewords)
% % Set 'showImg' in getData.m to 0 to stop displaying training and testing images and their feature vectors
% [data_train, data_test] = getData('Caltech');
% close all;
% 
% % Set the random forest parameters ...
% param.num = 5;         % Number of trees
% param.depth = 5;        % trees depth
% param.splitNum = 3;     % Number of split functions to try
% param.weakLearner='quad-features';
% param.split = 'IG';     % Currently support 'information gain' only
% 
% % Train Random Forest ...
% trees = growTrees(data_train,param);
% % Evaluate/Test Random Forest ...
% leaves=testTrees_fast(data_test,trees,param.weakLearner);
% p_rf = trees(1).prob(leaves,:);
% 
% p_rf_sum=[sum(reshape(p_rf(:,1),[length(data_test),param.num]),2)...
%           sum(reshape(p_rf(:,2),[length(data_test),param.num]),2)...
%           sum(reshape(p_rf(:,3),[length(data_test),param.num]),2)];
% 
% [~,rf_classes]=max(p_rf_sum');
% 
% % show accuracy and confusion matrix ...
% confus_script;

%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%% 
% random forest codebook for Caltech101 image categorisation
% .....



