%this is to build the ID3 Decision tree.In the below script we will
%calculate entropies of the set and then information gain of the all
%attributes and the one with highest information gain is selected currentdataset root
function treeresult=buildtree(trainset,iris)
currentdataset=[];
currentdataset=trainset;
%finding the entropy of the set
entropy=entropy_finder(currentdataset);res=[],res1=[],remain_attribute=[];
%the set of attributes in the set here 1=Sepal Lenght, 2=Sepal Width,
%3=petal width,4=petal length We use this array while building the ID3
%Decision tree
remain_attribute=[1 2 3 4];
%Here calculating information gain of all attributes,The attribute with
%highest information gain attribute  will be root of ID3 decision tree
b(1)=inf_gain(currentdataset,1,entropy);
b(2)=inf_gain(currentdataset,2,entropy);
b(3)=inf_gain(currentdataset,3,entropy);
b(4)=inf_gain(currentdataset,4,entropy);
m=max(b);
for i=[1:size(b,2)]
   if(m==b(i))
      res(1,1)=0;
      res(1,2)=1;
      res(1,3)=i;
   break;
   end;   
end;
%if any attribute is used as root or node then it is marked as 0 in remain
%attribute array.Here root node is marked as zero in remain attribute group
%through function update_attribute 
remain_attribute=update_attribute(remain_attribute,i);
%the below is called to build the remaining tree
[res1,remain_attribute]=creattree(currentdataset,i,res,remain_attribute,iris);
%the complete tree is captured here
treeresult=res1;
%tree is captured in string format here
treestring=treeshape(treeresult);






    
    