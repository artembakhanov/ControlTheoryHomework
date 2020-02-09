
% define the function
syms x(t)

% create symbolic functions for initial conditions
Dx = diff(x, t);

% define the ode
ode = 4 * diff(x, t, 2) - 4 * diff(x, t) + 5 * t - 2 * x == 3;

% define initial conditions
cond1 = x(0) == -3;
cond2 = Dx(0) == 0;
conds = [cond1 cond2];

xSol(t) = dsolve(ode, conds);
disp(xSol);

% draw a plot
figure
fplot(xSol, [0 10]);