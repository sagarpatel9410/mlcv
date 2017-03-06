function trees=fix_trees(trees)
num_classes=size(trees(1).prob,2);
b=ones(1,num_classes)./num_classes;
trees(1).prob = [b;trees(1).prob];
end