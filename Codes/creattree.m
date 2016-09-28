%here the tree is captured from root to further
%res array is used to capture the tree detials
%the the third and first column will contain root and node detials and
%second column will contain attribute values of the edges in the tree
%the first,second column values in first row are dummy values the third
%the third column of the first row will be root of the tree then all the
%edges from the root node will be captured further
%nonres array will contain the attributes with non zero yes and non zero no
%decisions
function [res1,remain_attribute1]=creattree(currentdataset,root,res,remain_attribute,iris)
a=[],v=0,sum=0,nonres=[],m1=1;
ct1=-1,ct0=-1
%using the below loop all the distinct values of the root attribute are
%captured
for k=[1:size(iris,1)]
    %if the values is there in array then it is not inserted if not it is
    %inserted Find function will return empty if it is not there if not it
    %will retun true
    if root>0 
   if(isempty(find(a==iris(k,root))))
      v=v+1;
     a(v)=iris(k,root);
     end;
end;
end;

%for all the distinct values of root attributes we are calculating count of
%yes and no decisions if any of them is zero then branch is made from root
%Then a branch from root thorugh that distinct value to respective decision
%is built
for k=[1:size(a,2)]
    m=size(res,1);
%count of yes decision for the root,a(k) attribute value combination 
ct1=count(currentdataset,root,a(k),1);    
%count of no decision for the root,a(k) attribute value combination 
ct0=count(currentdataset,root,a(k),0);
%if both are zero then it will be decision no
if (ct1==0 & ct0 ==0)
 
    res(m+1,1)=root;
    res(m+1,2)=a(k);
    res(m+1,3)=0;
    
end
%if no is not zero and yes is zero then decision will be no
if (ct1==0 & ct0 >0)
  
    %res first column is node or root
    res(m+1,1)=root;
    %res second column is attribute value
    res(m+1,2)=a(k);
    %0 is conidered equal to no
    res(m+1,3)=0;
    
end
%if yes is  zero and no is not zero then decision will be yes
if (ct0==0 & ct1 >0)
  
  
    res(m+1,1)=root;
    res(m+1,2)=a(k);
    %11 is considered as yes as we have attribute with values 1
    res(m+1,3)=11;
    
end;
%if any attributes has both yes and no decisions non zero values then we
%need build tree further fromn there with the non zero attributes in the array ,remain_attribute
%storing all the values with non zero yes and non no for further processing
if(ct1 >0 & ct0 >0)
nonres(m1)=a(k);
m1=m1+1;
end;

end;
%calling updatetree function where the tree for non zero yes and non zerono
%attribute values is construted using recuring call
if m1>1
    %root and remain attribute and the current datset,result array res are
    %needed so they are sent for furher processing
[res1,remain_attribute1]=updatetree(currentdataset,root,nonres,remain_attribute,res,iris);
else
res1=res;
remain_attribute1=remain_attribute;
end;