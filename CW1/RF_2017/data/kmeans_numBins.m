load kmeans_codebook_accuracy.mat

figure(1)
plot(numBin, accuracy_rf_all, 'LineWidth', 2);
axis([5 1024 0 1]);
set(gca,'fontsize',20);
grid on; grid minor;
title('Impact of Vocabulary Size on Accuracy','FontSize',40);
xlabel('Number of Bins', 'FontSize', 25);
ylabel('Classification Accuracy', 'FontSize', 25);
legend({'Trees=10', 'Trees=50', 'Trees=150'}, 'FontSize', 25);
scale_graph;

figure(2)
plot(numBin, mean(buildCodebookTime_all), 'LineWidth', 2);
axis([5 1024 0 200]);
set(gca,'fontsize',20);
grid on; grid minor;
title('Complexity of Vocabulary Size','FontSize',40);
xlabel('Number of Bins', 'FontSize', 25);
ylabel('Time Taken to Build Kmeans Codebook (s)', 'FontSize', 25);
scale_graph;

