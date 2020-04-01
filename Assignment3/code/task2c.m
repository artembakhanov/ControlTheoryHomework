A = [0 1; -25 -7];
B = [0; 1];
C = [1 0];
D = 1;
system = ss(A, B, C, D);
controller = pid(2000, 0, 300);
cl = system * controller;
disp(isstable(cl));