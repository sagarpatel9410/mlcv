function plot_split_function(idx_best,data,dim,t,ig_best,iter,row)
    
    subplot(4,4,row);
    x=-1.5:0.001:1.5;
    if(length(dim)==1)
        r = [-1.5 1.5];
        if dim == 1
            plot([t t],[r(1),r(2)],'r');
        else
            plot([r(1),r(2)],[t t],'r');
        end
        dim='axis-aligned';
    else
        if(length(dim)==2)
            y=(-dim(1)*x+t)./dim(2);
            dim='linear';
        elseif(length(dim)==3)
            y=(-dim(2)*x-dim(3)*x.^2+t)./dim(1);
            dim='quadratic';
        elseif(length(dim)==4)
            y=(-dim(2)*x-dim(3)*x.^2-dim(4)*x.^3+t)./dim(1);
            dim='cubic';
        end

        plot(x,y,'r');
    end
    
    axis([-1.5 1.5 -1 1]);
    grid on; grid minor;    
    
    hold on;
    plot(data(~idx_best,1), data(~idx_best,2), '*', 'MarkerEdgeColor', [.8 .6 .6], 'MarkerSize', 10);
    hold on;
    plot(data(idx_best,1), data(idx_best,2), '+', 'MarkerEdgeColor', [.6 .6 .8], 'MarkerSize', 10);

    hold on;
    plot(data(data(:,end)==1,1), data(data(:,end)==1,2), 'o', 'MarkerFaceColor', [.9 .3 .3], 'MarkerEdgeColor','k');
    hold on;
    plot(data(data(:,end)==2,1), data(data(:,end)==2,2), 'o', 'MarkerFaceColor', [.3 .9 .3], 'MarkerEdgeColor','k');
    hold on;
    plot(data(data(:,end)==3,1), data(data(:,end)==3,2), 'o', 'MarkerFaceColor', [.3 .3 .9], 'MarkerEdgeColor','k');

    title(sprintf('IG = %4.2f',ig_best),'FontSize', 20);

    hold off;
    scale_graph;
end