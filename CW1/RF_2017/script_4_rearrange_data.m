numBins = 256;
% treeNum = [5,10,20,35,50,75,100,150,175,200,250,300];
treeNum=200;
treeNum_CodeBook = [20];
% depth = [3,5,7,9,11];
depth=7;
depthCodeBook = [3,5,7,9,11];
% depthCodeBook=5;
split = 5;
% learner_t = {'axis-aligned', 'two-pixel'};
learner_t={'axis-aligned'};
rf_codebook = 1;
accuracy_rf_all=zeros(numel(treeNum_CodeBook), numel(depthCodeBook));
buildCodebookTime_all=zeros(numel(treeNum_CodeBook), numel(depthCodeBook));

%%%% varying the classifer this keeps the codebook constant so only
%%%% generate the codebook once

for index = 1:numel(treeNum_CodeBook)
      for mindex = 1:numel(depthCodeBook)
          for lindex = 1:numel(learner_t)
               numTreesCodeBook = treeNum_CodeBook(index);
               depthtreeCodeBook = depthCodeBook(mindex);
         
               for kindex=1:numel(treeNum)
                      for jindex=1:numel(depth)

                        numTrees = treeNum(kindex);
                        depthtree = depth(jindex);
                        
                        filename =  sprintf('data_collection/rf_test_new/%d_%d_%d_%d_%d.mat', lindex,numTrees,depthtree, depthtreeCodeBook, numTreesCodeBook);
%                         filename_fig = sprintf('data_collection/rf_test_new/%d_%d_%d_%d_%d.fig', lindex,numTrees,depthtree, depthtreeCodeBook, numTreesCodeBook);
                        load(filename);
                        accuracy_rf_all(index,mindex)=accuracy_rf;
                        buildCodebookTime_all(index,mindex)=buildCodebookTime;
                      end
               end

              
              
          end
      end
end

clearvars -except treeNum treeNum_CodeBook depth depthCodeBook accuracy_rf_all split learner_t buildCodebookTime_all
