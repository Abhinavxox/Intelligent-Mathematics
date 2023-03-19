import matplotlib.pyplot as plt
import numpy as np
from cvxopt import matrix, solvers
import cvxpy as cp
A = matrix([ [3.0, 40.0, -1.0, 0.0], [3.0, 10.0, 0.0, -1.0] ])
b = matrix([ 120.0, 1000.0, 0.0, 0.0 ])
C = matrix([ 20.0, 10.0 ])
x = cp.Variable(shape=(2, 1)); 
objFn = cp.Maximize(C.T @ x);
const = [A @ x <= b];
prob = cp.Problem(objFn, const);
opt_val = prob.solve();
print(x.value)

#Maximize Z = 40x+30y
#Subject to
#2x+y<=320
#x+y<=240
#x,y>=0
#Define the objective function and constraints like above and solve for x and y

A = matrix([ [2.0, 1.0, -1.0, 0.0], [1.0, 1.0, 0.0, -1.0] ])
b = matrix([ 320.0, 240.0, 0.0, 0.0 ])
C = matrix([ 40.0, 30.0 ])
x = cp.Variable(shape=(2, 1));
objFn = cp.Maximize(C.T @ x);
const = [A @ x <= b];
prob = cp.Problem(objFn, const);
opt_val = prob.solve();
print(x.value)


