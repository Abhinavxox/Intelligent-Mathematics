% Define the objective function and constraints
f = [1; 2; 3];  % Objective function coefficients
A = [1, 2, 3;
     4, 5, 6;
     7, 8, 9]; % Constraint coefficients
b = [1; 2; 3];  % Right-hand side of constraints
lb = [0; 0; 0]; % Lower bounds on variables
ub = [1; 1; 1]; % Upper bounds on variables
ctype = ['S'; 'S'; 'S']; % Constraints are of type 'S' (satisfied)
vartype = ['C'; 'C'; 'C'];  % Variables are of type 'C' (continuous)
sense = 1;  % Problem sense (1: minimize, -1: maximize)

% Set up the parameters for the solver
param.msglev = 2; % Display solver output
param.meth = 1;   % Use primal simplex method

% Solve the LPP using `glpk`
[x, fval, status, extra] = MakeMexWindows(f, A, b, lb, ub, ctype, vartype,sense, param);

%print the solution
x
fval
status
extra

% Load the GLPK library
glpk = glpk;

% % Define the optimization problem
% % Minimize: 2*x + y
% % Subject to:
% %   x + y >= 1
% %   x - y <= 1
% %   x, y >= 0

% % Set the problem size
% m = 2;  % Number of constraints
% n = 2;  % Number of variables

% % Set the problem data
% c = [2; 1];  % Objective function coefficients
% A = [1 1; 1 -1];  % Constraint coefficients
% b = [1; 1];  % Constraint limits
% ctype = 'UU';  % Constraint types (U: <=, L: >=)
% vartype = 'CC';  % Variable types (C: continuous, I: integer)
% sense = 1;  % Problem sense (1: minimize, -1: maximize)

% % Set the parameters
% param.msglev = 1;  % Display log (0: none, 1: error, 2: normal, 3: full)
% param.itlim = 1000;  % Iteration limit

% % Solve the problem
% [xmin, fmin, status, extra] = glpk(c, A, b, ctype, vartype, sense, param);

% % Display the solution
% disp('Solution:');
% disp(['x = ' num2str(xmin(1))]);
% disp(['y = ' num2str(xmin(2))]);
% disp(['Optimal objective function value = ' num2str(fmin)]);