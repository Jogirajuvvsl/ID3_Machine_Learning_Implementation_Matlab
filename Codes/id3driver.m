%loading the iris data set
%load iris.dat
%update_iris function will update the setosa folwer rows with 1 and non
%setosa with 0 
update_iris
irisorig=iris
%array to store the accuracy values for all the bins 5,10,15,20
accuracyarray=[];
%democratize function to do democratization on ther iris data set as per
%the bins required
%Note:Used the democratize function developoed as part of assignment Have
%checked with the professor she is okay to use the democratize function of
%previous assignment
%democratizing the iris data set for bins=5
iris=democratize(iris,5)
%calling randomfunction for bin 5 where all accuracies for all the 10 runs are
%obtained those detials are captured
accuracyarray(1,:)=randomsetgenerateid3(iris,'setosa')
%democratizing the iris data set for bins=10
iris=democratize(irisorig,10)
%calling randomfunction where all accuracies for all the 10 runs are
%obtained those detials are captured
accuracyarray(2,:)=randomsetgenerateid3(iris,'setosa')
%democratizing the iris data set for bins=15
iris=democratize(irisorig,15)
%calling randomfunction for bin 15 where all accuracies for all the 15 runs are
%obtained those detials are captured
accuracyarray(3,:)=randomsetgenerateid3(iris,'setosa')
%democratizing the iris data set for bins=20
iris=democratize(irisorig,20)
%calling randomfunction for bin 20 where all accuracies for all the 15 runs are
%obtained those detials are captured
accuracyarray(4,:)=randomsetgenerateid3(iris,'setosa')
iris=irisorig;
