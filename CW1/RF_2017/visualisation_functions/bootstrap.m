rng(1);

[data_train, data_test] = getData('Toy_Spiral');

% define number of datasets
num_datasets=4;
[i,j]=size(data_train);

sub_datasets=zeros(i,j,num_datasets);
unique_percentage=zeros(num_datasets,1);
class_distributions=zeros(num_datasets,3);

for n=1:4
    idx=randsample(i,i,1);
    sub_datasets(:,:,n)=data_train(idx,:);
    unique_percentage(n)=100.*length(unique(idx))./i;
    class_distributions(n,:) = histc(data_train(idx,end),1:3)/length(idx);
    
    subplot(2,2,n);
    plot_toydata(sub_datasets(:,:,n),'train_small');
    str=sprintf('Data Set: %d, Uniqueness, %.1f%%',n, unique_percentage(n));
    set(gca,'fontsize',10);
    title(str,'FontSize',25);
end

scale_graph;




