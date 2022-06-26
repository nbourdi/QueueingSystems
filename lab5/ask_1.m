clear;
clc;
close all;
pkg load queueing;

% E(T) diagram for a < 1

a = 0.001:0.001:0.999;
lambda = 10000;
lambda_1 = lambda*a;
lambda_2 = lambda*(1-a);
mu_1 = 14650;
mu_2 = 11720;

[U_1, R_1, Q_1, X_1, P_1] = qsmm1(lambda_1, mu_1);
[U_2, R_2, Q_2, X_2, P_2] = qsmm1(lambda_2, mu_2);

ET = (Q_1 + Q_2)/lambda;

figure(1);
plot(a, ET, "r", "linewidth", 1.5);
grid on;
title("Average Response Time");
xlabel("a");
ylabel("E(T)");


% display a that minimizes E(T)

[Emin, min_a] = min(ET);
% min(ET) returns the index of a => 
% multiply by the step and add offset to get the value
min_a = 0.001*min_a + 0.001; 
display("E(T) is minimum for a = ");
display(min_a);