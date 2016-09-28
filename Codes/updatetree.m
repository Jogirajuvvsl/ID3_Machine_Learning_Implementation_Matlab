%here bracnhes for all the attributes with non zero  yes and non zero no is
%construed here
function [res1,remain_attribute1]=updatetree(currentdataset,root,nonres,remain_attribute,res,iris)
sub=[],inf_gain_max=0,in_max_index=0,m=1,p=0;
%verify remain function will tell if we have used all the attributes in
%remain attribute array.
p=verify_remain(remain_attribute);
%first data set for the root and attribute is formed through code
for k=[1:size(nonres,2)]
  for i=[1:size(currentdataset,1)]
     if(currentdataset(i,root)==nonres(k))
     sub(m,:)=currentdataset(i,:);
     m=m+1;
     end;
  end;
  %then entropy is calculated for the set derived above
  entvalue=entropy_finder(sub);
  %when there are unused attributes in remain attributes then entropy is
  %calculated for all of them
  if(p>0)
  for j=[1:4]
      if(remain_attribute(j)~=0)
     inf_gain_val=inf_gain(sub,remain_attribute(j),entvalue)
      if inf_gain_val>inf_gain_max
         inf_gain_max=inf_gain_val;
          in_max_index=j;
      end;
      end;
  end;
  end;
  %attribute with the best information gain is used as the node.
   if (in_max_index ~=0)
   m=size(res,1)
   res(m+1,1)=root;
   res(m+1,2)=nonres(k);
   res(m+1,3)=remain_attribute(in_max_index);
    remain_attribute(in_max_index)=0;
    %once again create tree is called recurvisely from that node
    %this process is repeated till there are no unused nodes in remain
    %attribute array or there are no attributes values with non zero yes
    %and non zero no decisions
   [res,remain_attribute]=creattree(sub, res(m+1,3),res,remain_attribute,iris)
end;
end;
res1=res;
remain_attribute1=remain_attribute;

           
   
     