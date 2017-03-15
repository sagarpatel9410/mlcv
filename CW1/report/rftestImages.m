% Generate bag of visual words for testing images 
data_test=zeros(length(classList)*imgSel(2),numLeavesTotal+1);
% iterate over all points
for c=1:length(classList)
    for i=1:imgSel(2)
        % for each descriptor, we create the histogram
        current_desc=[single(desc_te{c,i}(1:end,:)') zeros(size(desc_te{c,i},2),1)];
        leaves=testTrees_fast(current_desc,trees,param.weakLearner)+1;
        data_test(imgSel(2)*(c-1)+i,1:end-1)=histc(reshape(leaves,1,numel(leaves)),1:numLeavesTotal)./numel(leaves);
        data_test(imgSel(2)*(c-1)+i,end)=c;
    end
end