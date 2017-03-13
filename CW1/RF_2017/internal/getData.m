function [ data_train, data_query, classList, imgIdx_tr, imgIdx_te] = getData( MODE, imgSel, numDescriptors, rf_codebook, numBins, param)
% Generate training and testing data

% Data Options:
%   1. Toy_Gaussian
%   2. Toy_Spiral
%   3. Toy_Circle
%   4. Caltech 101

showImg = 0; % Show training & testing images and their image feature vector (histogram representation)

PHOW_Sizes = [4 8 10]; % Multi-resolution, these values determine the scale of each layer.
PHOW_Step = 8; % The lower the denser. Select from {2,4,8,16}

switch MODE
    case 'Toy_Gaussian' % Gaussian distributed 2D points
        %rand('state', 0);
        %randn('state', 0);
        N= 150;
        D= 2;
        
        cov1 = randi(4);
        cov2 = randi(4);
        cov3 = randi(4);
        
        X1 = mgd(N, D, [randi(4)-1 randi(4)-1], [cov1 0;0 cov1]);
        X2 = mgd(N, D, [randi(4)-1 randi(4)-1], [cov2 0;0 cov2]);
        X3 = mgd(N, D, [randi(4)-1 randi(4)-1], [cov3 0;0 cov3]);
        
        X= real([X1; X2; X3]);
        X= bsxfun(@rdivide, bsxfun(@minus, X, mean(X)), var(X));
        Y= [ones(N, 1); ones(N, 1)*2; ones(N, 1)*3];
        
        data_train = [X Y];
        
    case 'Toy_Spiral' % Spiral (from Karpathy's matlab toolbox)
        
        N= 50;
        t = linspace(0.5, 2*pi, N);
        x = t.*cos(t);
        y = t.*sin(t);
        
        t = linspace(0.5, 2*pi, N);
        x2 = t.*cos(t+2);
        y2 = t.*sin(t+2);
        
        t = linspace(0.5, 2*pi, N);
        x3 = t.*cos(t+4);
        y3 = t.*sin(t+4);
        
        X= [[x' y']; [x2' y2']; [x3' y3']];
        X= bsxfun(@rdivide, bsxfun(@minus, X, mean(X)), var(X));
        Y= [ones(N, 1); ones(N, 1)*2; ones(N, 1)*3];
        
        data_train = [X Y];
        
    case 'Toy_Circle' % Circle
        
        N= 50;
        t = linspace(0, 2*pi, N);
        r = 0.4
        x = r*cos(t);
        y = r*sin(t);
        
        r = 0.8
        t = linspace(0, 2*pi, N);
        x2 = r*cos(t);
        y2 = r*sin(t);
        
        r = 1.2;
        t = linspace(0, 2*pi, N);
        x3 = r*cos(t);
        y3 = r*sin(t);
        
        X= [[x' y']; [x2' y2']; [x3' y3']];
        Y= [ones(N, 1); ones(N, 1)*2; ones(N, 1)*3];
        
        data_train = [X Y];
        
    case 'Caltech' % Caltech dataset
        close all;
        folderName = './Caltech_101/101_ObjectCategories';
        classList = dir(folderName); 
        classList = {classList(3:end).name}; % 10 classes
        
        disp('Loading training images...')
        % Load Images -> Description (Dense SIFT)
        cnt = 1;
        if showImg
            figure('Units','normalized','Position',[.05 .1 .4 .9]);
            suptitle('Training image samples');
        end
        
        % initialise vector to hold vectors of selected training images
        imgIdx_tr=zeros(length(classList),imgSel(1));
        
        for c = 1:length(classList)
            subFolderName = fullfile(folderName,classList{c});
            imgList = dir(fullfile(subFolderName,'*.jpg'));
            imgIdx{c} = randperm(length(imgList));
            
            % training images index
            imgIdx_tr(c,:) = imgIdx{c}(1:imgSel(1));
            
            for i = 1:length(imgIdx_tr)
                I = imread(fullfile(subFolderName,imgList(imgIdx_tr(c,i)).name));
                
                % Visualise
                if i < 6 & showImg
                    subaxis(length(classList),5,cnt,'SpacingVert',0,'MR',0);
                    imshow(I);
                    cnt = cnt+1;
                    drawnow;
                end
                
                if size(I,3) == 3
                    I = rgb2gray(I); % PHOW work on gray scale image
                end
                
                % For details of image description, see http://www.vlfeat.org/matlab/vl_phow.html
                [~, desc_tr{c,i}] = vl_phow(single(I),'Sizes',PHOW_Sizes,'Step',PHOW_Step); %  extracts PHOW features (multi-scaled Dense SIFT)
            end
        end

        if(~rf_codebook)
            disp('Building visual codebook using K-means...')
            % Build visual vocabulary (codebook) for 'Bag-of-Words method'
            desc_sel = single(vl_colsubset(cat(2,desc_tr{:}), numDescriptors));
            % K-means clustering 
            [~,C]=kmeans(desc_sel',numBins);    


            disp('Encoding Images...')
            % Vector Quantisation
            data_train=zeros(length(classList)*imgSel(1),numBins+1);
            % iterate over all points
            for i=1:length(classList)
                for j=1:imgSel(1)
                    % determine the distribution of centers
                    idx = knnsearch(C,single(desc_tr{i,j})');
                    % get normalised histograms
                    data_train(imgSel(1)*(i-1)+j,1:end-1)=histc(idx,1:numBins)./numel(idx);
                    % append class of training point 
                    data_train(imgSel(1)*(i-1)+j,end)=i;
                end
            end
        else
            disp('Building visual codebook using Random Forest...')
            
            % append the classes to the end of each descriptor
            for c=1:length(classList)
                for i=1:imgSel(1)
                    desc_tr{c,i}=[desc_tr{c,i}; c*ones(1,length(desc_tr{c,i}))];
                end
            end
            
            % Build visual vocabulary (codebook) for 'Bag-of-Words method'
            desc_sel = single(vl_colsubset(cat(2,desc_tr{:}), numDescriptors))';
            
            trees = growTrees(desc_sel,param);
            trees = fix_trees(trees);
            
            % next generate histograms
            numLeavesTotal=length(trees(1).prob);
            data_train=zeros(length(classList)*imgSel(1),numLeavesTotal+1);
            % iterate over all points
            for c=1:length(classList)
                for i=1:imgSel(1)
                    % for each descriptor, we create the histogram
                    leaves=testTrees_fast(single(desc_tr{c,i}(1:end,:)'),trees,param.weakLearner)+1;
                    data_train(imgSel(1)*(c-1)+i,1:end-1)=histc(reshape(leaves,1,numel(leaves)),1:numLeavesTotal)./numel(leaves);
                    data_train(imgSel(1)*(c-1)+i,end)=c;
                end
            end
            
        end

        % Clear unused varibles to save memory
        clearvars desc_tr desc_sel
end

switch MODE
    case 'Caltech'
        if showImg
            figure('Units','normalized','Position',[.05 .1 .4 .9]);
            suptitle('Testing image samples');
        end
        disp('Processing testing images...');
        cnt = 1;
                
        % initialise vector to hold image index of selected testing images
        imgIdx_te=zeros(length(classList),imgSel(2));

        % Load Images -> Description (Dense SIFT)
        for c = 1:length(classList)
            subFolderName = fullfile(folderName,classList{c});
            imgList = dir(fullfile(subFolderName,'*.jpg'));
            imgIdx_te(c,:) = imgIdx{c}(imgSel(1)+1:sum(imgSel));
            
            for i = 1:length(imgIdx_te)
                I = imread(fullfile(subFolderName,imgList(imgIdx_te(c,i)).name));
                
                % Visualise
                if i < 6 & showImg
                    subaxis(length(classList),5,cnt,'SpacingVert',0,'MR',0);
                    imshow(I);
                    cnt = cnt+1;
                    drawnow;
                end
                
                if size(I,3) == 3
                    I = rgb2gray(I);
                end
                [~, desc_te{c,i}] = vl_phow(single(I),'Sizes',PHOW_Sizes,'Step',PHOW_Step);
            
            end
        end
        if showImg
            figure('Units','normalized','Position',[.5 .1 .4 .9]);
            suptitle('Testing image representations: 256-D histograms');
        end

        if(~rf_codebook)
            
            % Quantisation
            data_query=zeros(length(classList)*imgSel(2),numBins+1);
            % iterate over all points
            for i=1:length(classList)
                for j=1:imgSel(2)
                    % determine the distribution of centers
                    idx = knnsearch(C,single(desc_te{i,j})');
                    % get normalised histograms
                    data_query(imgSel(2)*(i-1)+j,1:end-1)=histc(idx,1:numBins)./numel(idx);
                    % append class of training point 
                    data_query(imgSel(2)*(i-1)+j,end)=i;
                end
            end
        else
            % next generate histograms
            data_query=zeros(length(classList)*imgSel(2),numLeavesTotal+1);
            % iterate over all points
            for c=1:length(classList)
                for i=1:imgSel(2)
                    % for each descriptor, we create the histogram
                    current_desc=[single(desc_te{c,i}(1:end,:)') zeros(size(desc_te{c,i},2),1)];
                    leaves=testTrees_fast(current_desc,trees,param.weakLearner)+1;
                    data_query(imgSel(2)*(c-1)+i,1:end-1)=histc(reshape(leaves,1,numel(leaves)),1:numLeavesTotal)./numel(leaves);
                    data_query(imgSel(2)*(c-1)+i,end)=c;
                end
            end
        end
        
        
    otherwise % Dense point for 2D toy data
        xrange = [-1.5 1.5];
        yrange = [-1.5 1.5];
        inc = 0.02;
        [x, y] = meshgrid(xrange(1):inc:xrange(2), yrange(1):inc:yrange(2));
        data_query = [x(:) y(:) zeros(length(x)^2,1)];
end
end

