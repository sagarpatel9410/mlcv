idxToPlot = randperm(length(misClassIdx));
for m=1:num_plot
    subplot(2,5,m+5)
    c_int=floor(misClassIdx(idxToPlot(m))./15);
    idx=misClassIdx(idxToPlot(m))-15*c_int;
    if(c_int==10)
        subFolderName = fullfile(folderName,classList{c_int});
    else
        subFolderName = fullfile(folderName,classList{c_int+1});
    end
    imgList = dir(fullfile(subFolderName,'*.jpg'));
    if(idx==0)
        I = imread(fullfile(subFolderName,imgList(imgIdx_tr(c_int,idx+1)).name));
    else
        I = imread(fullfile(subFolderName,imgList(imgIdx_tr(c_int+1,idx)).name));
    end
    imshow(I);
    if(c_int==10)
        str1=sprintf('True: %s', classList_for_printing{c_int});
    else
        str1=sprintf('True: %s', classList_for_printing{c_int+1});
    end
    str2=sprintf('Classified: %s',classList_for_printing{c(misClassIdx(idxToPlot(m)))});
    title({str1,str2}, 'FontSize', 15);
end

