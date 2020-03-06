% define symbolic variables, X is Laplace transform of the solution
syms s t X;

% define x' and x''
X1 = s * X - (-3);
X2 = s * X1 - 0;

% define right-hand function and find its Laplace transform
f = 3 - 5 * t;
F = laplace(f);

% solve for X
Sol = solve(4*X2 - 4 * X1 - 2 * X - F, X);

% find the inverse Laplace transform of X
sol = ilaplace(Sol, s, t);

disp(sol);
% plot the solution graph
figure
fplot(sol, [0 10]);