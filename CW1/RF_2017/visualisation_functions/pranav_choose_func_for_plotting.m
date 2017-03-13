if(length(dim)==1)
    r = [-1.5 1.5];
    if dim == 1
        plot([t t],[r(1),r(2)],'r', 'LineWidth', 2.5);
    else
        plot([r(1),r(2)],[t t],'r', 'LineWidth', 2.5);
    end
    dim='axis-aligned';
    title(sprintf('Axis: IG = %4.2f',ig_best),'FontSize', 20);
else
    if(length(dim)==2)
        y=(-dim(1)*x+t)./dim(2);
        dim='linear';
        plot(x,y,'r', 'LineWidth', 2.5);
        title(sprintf('Linear: IG = %4.2f',ig_best),'FontSize', 20);
    elseif(length(dim)==3)
        y=(-dim(2)*x-dim(3)*x.^2+t)./dim(1);
        dim='quadratic';
        plot(x,y,'r', 'LineWidth', 2.5);
        title(sprintf('Quad: IG = %4.2f',ig_best),'FontSize', 20);
    elseif(length(dim)==4)
        y=(-dim(2)*x-dim(3)*x.^2-dim(4)*x.^3+t)./dim(1);
        dim='cubic';
        plot(x,y,'r', 'LineWidth', 2.5);
        title(sprintf('Cube: IG = %4.2f',ig_best),'FontSize', 20);
    end
end