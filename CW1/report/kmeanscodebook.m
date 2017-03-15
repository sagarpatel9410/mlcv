disp('Building visual codebook using K-means...')
% Build visual vocabulary (codebook) for 'Bag-of-Words method'
% Select 100k descriptors
desc_sel = single(vl_colsubset(cat(2,desc_tr{:}), numDescriptors));

% K-means clustering 
[~,C]=kmeans(desc_sel',numBins);    

disp('Encoding Images...')
% Vector Quantisation
data_train=zeros(length(classList)*imgSel(1),numBins+1);
% iterate over all points
for i=1:length(classList)
    for j=1:imgSel(1)
        % determine the distribution of centers
        idx = knnsearch(C,single(desc_tr{i,j})');
        % get normalised histograms
        data_train(imgSel(1)*(i-1)+j,1:end-1)=histc(idx,1:numBins)./numel(idx);
        % append class of training point 
        data_train(imgSel(1)*(i-1)+j,end)=i;
    end
end

