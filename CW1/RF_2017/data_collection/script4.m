numBins = 256;
treeNum = [5,10,20,35,50,75,100,150,175,200,250,300];
treeNum_CodeBook = [5,10,20,50];
depth = [3,5,7,9,11];
depthCodeBook = [3,5,7,9,11];
split = 5;
learner_t = {'axis-aligned', 'two-pixel'};
rf_codebook = 1;

%%%% varying the classifer this keeps the codebook constant so only
%%%% generate the codebook once

for index = 1:numel(treeNum_CodeBook)
      for mindex = 1:numel(depthCodeBook)
          for lindex = 1:numel(learner_t)
               numTreesCodeBook = treeNum_CodeBook(index)
               depthtreeCodeBook = depthCodeBook(mindex)
               learner_type = learner_t{lindex}
              % If using rf codebook, describe parameters
               param.num = numTreesCodeBook;         % Number of trees
               param.depth = depthtreeCodeBook;        % trees depth
               param.splitNum = split;     % Number of split functions to try
               param.split = 'IG';     % Currently support 'information gain' only
               param.weakLearner = learner_type;
               tic; % Start Timer
               [data_train, data_test, classList, imgIdx_tr, imgIdx_te] = getData('Caltech',[15 15], 10e4, 1,0,param);
               buildCodebookTime = toc; %Stop Timer
               
               for kindex=1:numel(treeNum)
                      for jindex=1:numel(depth)

                        numTrees = treeNum(kindex)
                        depthtree = depth(jindex)
                        
                        filename =  sprintf('data_collection/rf_test_new/%d_%d_%d_%d_%d.mat', lindex,numTrees,depthtree, depthtreeCodeBook, numTreesCodeBook);
                        filename_fig = sprintf('data_collection/rf_test_new/%d_%d_%d_%d_%d.fig', lindex,numTrees,depthtree, depthtreeCodeBook, numTreesCodeBook);
                        main_guideline;


                      end
               end

              
              
          end
      end
end

