function yesorno=testing(res,testrow)
root=res(1,3),i=2,treedecision=-1,loopcount=1,ct=1;
while(ct)
        if(res(i,1)==root & testrow(1,root)==res(i,2))
            if (res(i,3)==0 | res(i,3)==11)
                treedecision=res(i,3);
                ct=0;
            else 
                root=res(i,3);
                
            end;
        end;
   loopcount=loopcount+1;
   if (loopcount>size(res,1))
   break;
   end;
i=i+1;
end;

if (treedecision==0 & testrow(1,5)==0)
    yesorno=1;
else if (treedecision==11 & testrow(1,5)==1)
    yesorno=1;
else
    yesorno=0;  
end;

end;
    


                