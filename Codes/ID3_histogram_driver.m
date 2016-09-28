%histogram for all values in a same diagram with different colors
a=[min(accuracyarr(1,:)) mean(accuracyarr(1,:)) max(accuracyarr(1,:));
    min(accuracyarr(2,:)) mean(accuracyarr(2,:)) max(accuracyarr(2,:));
    min(accuracyarr(3,:)) mean(accuracyarr(3,:)) max(accuracyarr(3,:));
    min(accuracyarr(4,:)) mean(accuracyarr(4,:)) max(accuracyarr(4,:))]
x =[5 10 15 20];
b=bar(x,a)
xlabel('For each value of n')
ylabel('Accuracies')
title('Histogram for ID3 algorithm against N=5 to 20')