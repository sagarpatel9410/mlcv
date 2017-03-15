disp('Building visual codebook using Random Forest...')

% append the class of the image to the end of each descriptor
for c=1:length(classList)
    for i=1:imgSel(1)
        desc_tr{c,i}=[desc_tr{c,i}; c*ones(1,length(desc_tr{c,i}))];
    end
end

% Build visual vocabulary (codebook) for 'Bag-of-Words method'
% select 100k descriptors
desc_sel = single(vl_colsubset(cat(2,desc_tr{:}), numDescriptors))';

% RF parameters
param.num = 10;         % Number of trees
param.depth = 5;        % trees depth
param.splitNum = 5;     % Number of split functions to try
param.split = 'IG';     % Currently support 'information gain' only
param.weakLearner = 'two-pixel';

% Build random forest codebook
trees = growTrees(desc_sel,param);
trees = fix_trees(trees);

% generate histograms for training images
numLeavesTotal=length(trees(1).prob);
data_train=zeros(length(classList)*imgSel(1),numLeavesTotal+1);
% iterate over all points
for c=1:length(classList)
    for i=1:imgSel(1)
        % for each descriptor, we create the histogram
        leaves=testTrees_fast(single(desc_tr{c,i}(1:end,:)'),trees,param.weakLearner)+1;
        data_train(imgSel(1)*(c-1)+i,1:end-1)=histc(reshape(leaves,1,numel(leaves)),1:numLeavesTotal)./numel(leaves);
        %append original class to training image histogram
        data_train(imgSel(1)*(c-1)+i,end)=c;
    end
end

end

function trees=fix_trees(trees)
    num_classes=size(trees(1).prob,2);
    b=ones(1,num_classes)./num_classes;
    trees(1).prob = [b;trees(1).prob];
end