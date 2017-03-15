% Quantisation
data_test=zeros(length(classList)*imgSel(2),numBins+1);
% iterate over all points
for i=1:length(classList)
    for j=1:imgSel(2)
        % determine the distribution of centers
        idx = knnsearch(C,single(desc_te{i,j})');
        % get normalised histograms
        data_test(imgSel(2)*(i-1)+j,1:end-1)=histc(idx,1:numBins)./numel(idx);
        % append class of training point 
        data_test(imgSel(2)*(i-1)+j,end)=i;
    end
end