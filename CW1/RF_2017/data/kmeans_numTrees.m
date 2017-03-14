load kmeans_codebook_numTrees_acc_and_complexity.mat

figure(1);
plot(treeNum, accuracy_rf_all, 'LineWidth', 2);
axis([5 200 0.3 0.75]);
set(gca,'fontsize',20);
grid on; grid minor;
title('Impact of numTrees on Accuracy','FontSize',40);
xlabel('Number of Trees in Forest', 'FontSize', 25);
ylabel('Classification Accuracy', 'FontSize', 25);
legend({'numBins=64', 'numBins=128','numBins=256'}, 'FontSize', 25);
scale_graph;

% figure(2);
% plot(treeNum, mean(buildRfClassifierTime_all), 'LineWidth', 2);
% axis([5 200 0 1.5]);
% set(gca,'fontsize',20);
% grid on; grid minor;
% title('Computational Complexity of numTrees','FontSize',40);
% xlabel('Number of Trees in Forest', 'FontSize', 25);
% ylabel('Time Taken to Build RF Classifier (s)', 'FontSize', 25);
% scale_graph;


