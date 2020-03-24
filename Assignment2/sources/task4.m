% first solution using built-in function ss2tf
A = [3, 1; -2 2];
B = [2; 0];
C = [1, 3];
D = [1];
[b, a] = ss2tf(A, B, C, D);
disp(b);
disp(a);

% second solution using common sense
syms s;
K = C * inv(s * eye(2) - A) * B + D;
disp(simplify(K));