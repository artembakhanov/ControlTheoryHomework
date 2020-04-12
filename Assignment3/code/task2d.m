A = [10 3; 5 -5];
B = [0; 1];
C = [1 0];
D = 1;
system = ss(A, B, C, D);
controller = pid(800, 0, 80);
cl = system * controller;
disp(isstable(cl));
[b, a] = ss2tf(A, B, C, D);
disp(b);
disp(a);