%the below function is to count the number of rows for attribute column and
%decision is val
function ct=count(currentdataset,column,value,val)
p1=0;
%travering full data set
for k=[1:size(currentdataset,1)]
    if(currentdataset(k,column)==value & currentdataset(k,5)==val)
    p1=p1+1;
    end;
end; 
ct=p1;
   