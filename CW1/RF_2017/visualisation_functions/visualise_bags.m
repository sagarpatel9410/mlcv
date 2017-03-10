[data_train, ~] = getData('Toy_Spiral'); 
plot_toydata(data_train);
[N,D] = size(data_train);
frac = 1 - 1/exp(1);

figure;
for i = 1:4
    idx = randsample(N,ceil(N*frac),1); 
    subplot(2,2,i)       % add first plot in 2 x 2 grid
    plot_toydata(data_train(idx,:));
    str = sprintf('Bagging Data Subset %d',i);
    title(str);   
end