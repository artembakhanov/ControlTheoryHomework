A = [[ 0.      0.      1.      0.    ]
     [ 0.      0.      0.      1.    ]
     [ 0.      5.7552  0.      0.    ]
     [ 0.     12.971   0.      0.    ]];
 
 
B = [[0.        ]
     [0.        ]
     [0.13333333]
     [0.11111111]];
     
C = [[1. 0. 0. 0.]
     [0. 1. 0. 0.]];
 
D = 0;


sys = ss(A, B, C, D);
d_sys = c2d(sys, 0.1);

[sprintf('%d,', d_sys.A(1:end-1)), sprintf('%d', d_sys.A(end))];



M = 0.5;
m = 0.2;
b = 0.1;
I = 0.006;
g = 9.8;
l = 0.3;

p = I*(M+m)+M*m*l^2; %denominator for the A and B matrices

A = [0      1              0           0;
     0 -(I+m*l^2)*b/p  (m^2*g*l^2)/p   0;
     0      0              0           1;
     0 -(m*l*b)/p       m*g*l*(M+m)/p  0];
B = [     0;
     (I+m*l^2)/p;
          0;
        m*l/p];
C = [1 0 0 0;
     0 0 1 0];
D = [0;
     0];

states = {'x' 'x_dot' 'phi' 'phi_dot'};
inputs = {'u'};
outputs = {'x'; 'phi'};

sys_ss = ss(A,B,C,D,'statename',states,'inputname',inputs,'outputname',outputs);

Ts = 1/5;

sys_d = c2d(sys_ss,Ts,'zoh');


A = sys_d.a;
B = sys_d.b;
C = sys_d.c;
D = sys_d.d;
Q = C'*C
R = 1;
[K] = dlqr(A,B,Q,R)

Ac = [(A-B*K)];
Bc = [B];
Cc = [C];
Dc = [D];

disp(Ac);