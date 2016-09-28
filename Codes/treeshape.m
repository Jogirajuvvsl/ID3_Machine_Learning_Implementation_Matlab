function treestring=treeshape(treeresult)
str=[],i=0;
for i=[1:size(treeresult)]
if(i==1)
    str{i}=strcat('root','  ',int2str(treeresult(i,2)),'  ',flowerfeature(treeresult(i,3)));
else
    str{i}=strcat(flowerfeature(treeresult(i,1)),'  ',int2str(treeresult(i,2)),'  ',flowerfeature(treeresult(i,3)));
end
end
treestring=str;


function type=flowerfeature(flowerchar)
if (flowerchar==1)
    type='Sepal Lengh';
elseif (flowerchar==2)
    type='Sepal Width';
elseif (flowerchar==3)
    type='Petal Length';
elseif (flowerchar==4)
    type='Petal Width';
 else 
   type=int2str(flowerchar);
end;
