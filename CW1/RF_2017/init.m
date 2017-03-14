% Please run this script under the root folder

% clearvars -except N ;
close all;

% addpaths
addpath('./internal');
addpath('./external');
addpath('./split_functions');
addpath('./visualisation_functions');
addpath('./data_collection');
addpath('./data_collection/kmean_codebook_accuracy_1');
addpath('./data_collection/kmean_depthtree_accuracy_4');
addpath('./data_collection/kmean_depthtree_accuracy_4/numbins_256');
addpath('./data_collection/kmean_depthtree_accuracy_4/numbins_128');
addpath('./data_collection/kmean_depthtree_accuracy_4/numbins_64');
addpath('./data_collection/kmean_learner_split_accuracy_3');
addpath('./data_collection/kmean_learner_split_accuracy_3/numbins_256');
addpath('./data_collection/kmean_learner_split_accuracy_3/numbins_128');
addpath('./data_collection/kmean_learner_split_accuracy_3/numbins_64');
addpath('./data_collection/kmean_treedepth_accuracy_2');
addpath('./data_collection/kmean_learner_split_accuracy_3');
addpath('./data_collection/kmean_treedepth_accuracy_2');

addpath('./external/libsvm-3.18/matlab');

% initialise external libraries
run('external/vlfeat-0.9.18/toolbox/vl_setup.m'); % vlfeat library
cd('external/libsvm-3.18/matlab'); % libsvm library
run('make');
cd('../../..');

% tested on Ubuntu 12.04, 64-bit, Intel® Core�?i7-3820 CPU @ 3.60GHz × 8 