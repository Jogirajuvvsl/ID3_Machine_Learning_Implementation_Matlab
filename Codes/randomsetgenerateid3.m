function accuracy=randomsetgenerate(iris,flowertype)
accuracyarr=[],successcount=0,failurecount=0,testrow=[];
%calling random fuction ten times to capture accuracies for the random 10
%test and train data sets
for ct=[1:10]
    successcount=0,failurecount=0;
    %randperm will give an array of distinct random 25 number from 1 50
    r=randperm(50,25);
    trainset=[];
testset=[];
i=1;
k=1;
j=1;
for c=[1:50]
    %if flower is setosa consider rows from 1 to 50 in iris_d
    if (strcmp(flowertype,'setosa'))
        %find will c if the c is there in array r
      if(find(r==c))
          %rows belonging to random number are moved to train set and
          %others to test set
      trainset(k,:)=iris(c,:);
      k=k+1;
      else 
    testset(j,:)=iris(c,:);
    j=j+1;
    end
    end
end
r=[];
%randi will give an array of random 50 number from 1 100
r=randperm(100,50);
for c=[1:100]
    
 if (strcmp(flowertype,'setosa'))
        %find will c if the c is there in array r
      if(find(r==c))
          %rows belonging to random number are moved to train set and
          %others to test set this is for non setosa folwer which will be
          %from 51 to 150 rownumbers in iris data set
          trainset(k,:)=iris(c+50,:);
          k=k+1;
      else 
         testset(j,:)=iris(c+50,:);
         j=j+1;
         end
 end
 
end
%calling trainset to build traa function to buld decision tree using ID3Algorithm 
%the treerersult will have the decision tree captured
treeresult=build_tree(trainset,iris);
%calculating the accuracy of the tree bulit for testdata
for j=[1:size(testset)]
   
      testrow(1,:)=testset(j,:);
      %testing function will be called which will tell if the ID3 tree
      %predicted the decision correctly or not
      %accuracy 1 means it is predicted if not it is not done correctly
        accuracy=testing(treeresult, testrow);
        if (accuracy ==1)
            successcount=successcount+1;
        end ;
        if (accuracy ==0)
            failurecount=failurecount+1;
        end;
            
end;
%saving the acuuracy of each run in the array
accuracyarr(ct)=(successcount/(successcount+failurecount))*100;
end;
%returning the accuracies saved
accuracy=accuracyarr;