%this is for finding the entropy of the set
function entvalue=entropy_finder(iris)
%finding the p1=0 and p2=0 and n=0 and en=0
p1=0,p2=0,n=0,en=0;
%verifying all the rows of the set
for k=[1:size(iris,1)]
    %counting p1 and p2
    if ((iris(k,5)==1))
        p1=p1+1;
    else
        p2=p2+1;
    end;
end;
%calculating the sum of p1 and p2
n=p1+p2;
%finding the probabailities q1 and q2
q1=p1/n;
q2=p2/n;

if( q1~=0 & q2~=0)
%entropy value calulating
entvalue=-1*(q1*log2(q1)+q2*(log2(q2)));
else
    %entropy value calulating when one is zero
if q1==0
    entvalue=-q2*log2(q2);
else
    entvalue=-q1*log2(q1);
end;
end;