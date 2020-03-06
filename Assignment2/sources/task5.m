% first solution using built-in function ss2tf
A = [5, 1; 0 -2];
B = [0, 2; 2, 3];
C = [1, 1];
D = [1, 6];
% first equation
[b, a] = ss2tf(A, B, C, D, 1);
disp("First TF");
disp(b);
disp(a);
% second equation
[b, a] = ss2tf(A, B, C, D, 2);
disp("Second TF");
disp(b);
disp(a);

% second solution using common sense
syms s;
K = C * inv(s * eye(2) - A) * B + D;
disp(simplify(K));