function iris=democratize(iris,k)
%k is the democratization intervals such as 3,5,7,9
%we have taken x from 1 to 4 as we have four attributes
%sepal_length,sepal_width,patal_lengh,petal_width
for x =[1 2 3 4]
%finding maximum and minimum in the each attribute then to find d values
a(x)=max(iris([1:150],x));
b(x)=min(iris([1:150],x));
c(x)=a(x)-b(x);
i=k;
d(x)=c(x)/i;
for z=[1:150]
    %if value of cell is minimum  of that attribute then make it 1
 if iris(z,x)==b(x)
iris(z,x)=1;

%if value of cell is maximum  of that attribute then make it k
 elseif  iris(z,x)==a(x)
iris(z,x)=k;

 else
    %finding the number of d betweeninterval value after democratiozation
iris(z,x)=floor(((iris(z,x)-b(x))/d(x))+1);

end
end
end