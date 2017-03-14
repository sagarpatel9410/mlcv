load kmeans_codebook_accuracy.mat

semilogx(numBin, accuracy_rf_all, 'LineWidth', 2);
axis([10 1024 0 1]);
set(gca,'fontsize',20);
grid on; grid minor;
title('Impact of Vocabulary Size on Accuracy','FontSize',40);
xlabel('Number of Bins', 'FontSize', 25);
ylabel('Classification Accuracy', 'FontSize', 25);
legend({'Trees=10', 'Trees=50', 'Trees=150'}, 'FontSize', 25);
scale_graph;
