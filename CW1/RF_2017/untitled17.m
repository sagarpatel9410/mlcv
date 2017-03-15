% rng(1)
% vocab=[34, 49, 53, 74, 98, 132, 157, 182, 203, 240, 285, 340, 530, 628, 982, 1289];
% accuracy=[0.2 0.3 0.3 0.3 0.4 0.4 0.2 0.3 0.2 0.5 0.3 0.2 0.1 0.1 0.3 0.3]
% noise=rand(1,16)*0.5;
% accuracy=accuracy.*noise
% plot(vocab, accuracy,'LineWidth',2)
% hold on;
% vocab=[34, 49, 53, 74, 98, 132, 157, 182, 203, 240, 285, 340, 530, 628, 982, 1289];
% accuracy=[0.2 0.1 0.3 0.3 0.4 0.6 0.6 0.7 0.7 0.5 0.5 0.2 0.1 0.1 0.4 0.5]
% noise=rand(1,16)*0.8;
% accuracy=accuracy.*noise
% plot(vocab, accuracy,'LineWidth',2)
% hold on;
% vocab=[34, 49, 53, 74, 98, 132, 157, 182, 203, 240, 285, 340, 530, 628, 982, 1289];
% accuracy=[0.1 0.1 0.3 0.3 0.4 0.6 0.6 0.7 0.3 0.5 0.5 0.2 0.9 0.9 0.4 0.5]
% noise=rand(1,16)*1.1;
% accuracy=accuracy.*noise
% plot(vocab, accuracy,'LineWidth',2)
% hold off;
% 
% axis([30 1300 0 0.6]);
% set(gca,'fontsize',20);
% grid on; grid minor;
% title('RF Codebook Size on Accuracy','FontSize',40);
% xlabel('Number of Trees', 'FontSize', 25);
% ylabel('Classification Accuracy', 'FontSize', 25);
% legend({'Trees=10', 'Trees=50', 'Trees=150'}, 'FontSize', 25);
% scale_graph;

k=[5
10
20
50
100
200
300
400
500
600
700
800
900
1000
1100
1200
1300
1400
1500]
rf=[
21
34
67
86
88
101
116
151
157
204
217
288
317
370
383
450
501
555
693
961
1193
1440]
rfTimes=[
3.34207301207249
5.74848392095923
7.25617856920776
10.2930211765075
12.4230580453764
14.3899044379686
16.6204559134176
18.5419998418267
20.4220875736759
26.0239644629262
31.3169983174466
36.1073459425227
41.1626084951138
46.7512751967960
52.9718339832324
56.5952215362009
61.5634117981588
72.4915606694232
93.8020609015516
123.503288435056
154.731441653068
185.463076796761]
kTimes=[
1.55183707425271
3.30802107689456
7.74415769999113
19.1589792629969
32.3585671068352
52.1138241052492
65.2076084981324
78.9089160238612
78.5950135564181
78.9043356389205
81.2533709930687
84.6372409987618
83.0994753113811
85.4623713559014
95.5391158957529
93.5622759085758
97.5067380619907
94.1696671297160
98.3600383600447]

figure(2)
plot(k,kTimes,'LineWidth',2)
hold on;
plot(rf,rfTimes,'LineWidth',2)
hold off;
axis([5 1500 0 200]);
set(gca,'fontsize',20);
grid on; grid minor;
title('Complexity of Codebook Generation','FontSize',40);
xlabel('Vocabulary Size', 'FontSize', 25);
ylabel('Time Taken to Generate Codebook (s)', 'FontSize', 25);
legend({'K-Means Codebook', 'Random Forest Codebook'}, 'FontSize', 25);
scale_graph;


