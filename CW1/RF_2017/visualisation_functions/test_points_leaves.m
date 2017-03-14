function test_points_leaves(p_rf, p_rf_sum)
        
    figure();
    for i=1:3
        for j=1:4
            subplot(4,4,(i-1)*4+j);
            bar(p_rf((i-1)*4+j,:));
            axis([0.5 3.5 0 1]);
            grid on; grid minor;
            str=sprintf('Test Point: %d, Tree, %d', j, i);
            title(str,'FontSize', 15);
        end
    end
    
    for j=1:4
        subplot(4,4,12+j);
        bar(p_rf_sum(j,:));
        axis([0.5 3.5 0 1]);
        grid on; grid minor;
        str=sprintf('Test Point: %d, Averaged', j, i);
        title('Averaged','FontSize', 15);
    end
    
    scale_graph;
    
end