clc;
clear;
locations = ...
    {'receiver','router1','router2','router3','router4'};
D = [ 0.00  6.32  4.37  6.12  5.26;
      6.32  0.00  8.05  9.29 11.35;
      4.37  8.05  0.00 10.43  7.79;
      6.12  9.29 10.43  0.00  5.68;
      5.26 11.35  7.79  5.68  0.00];
 [Y,eigvals] = cmdscale(D);
 D1 = [ 0.00  2.09  3.29  3.29  5.19;
        2.09  0.00  8.05  9.29 11.35;
        3.29  8.05  0.00 10.43  7.79;
        3.29  9.29 10.43  0.00  5.68;
        5.19 11.35  7.79  5.68  0.00];
  [Y1,eigvals1] = cmdscale(D1);
 format short g;
[eigvals eigvals/max(abs(eigvals))]
Dtriu = D(find(tril(ones(5),-1)))';
maxrelerr = max(abs(Dtriu-pdist(Y(:,1:2))))./max(Dtriu)
figure(1),plot(Y(:,1),Y(:,2),'*');
[eigvals1 eigvals1/max(abs(eigvals1))]
Dtriu1 = D1(find(tril(ones(5),-1)))';
maxrelerr1 = max(abs(Dtriu1-pdist(Y1(:,1:2))))./max(Dtriu1)
figure(1),plot(Y(:,1),Y(:,2),'*');
text(Y(:,1),Y(:,2),locations);
title('measured distance');
xlabel('Meters');
ylabel('Meters');
figure(2),plot(Y1(:,1),Y1(:,2),'*');
text(Y1(:,1),Y1(:,2),locations);
title('calculated distance form RSSI');
xlabel('Meters');
ylabel('Meters');

