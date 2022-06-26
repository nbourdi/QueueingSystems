#Poisson counting process
clc;
clear all;
close all;

pkg load statistics;

#TASK: using exprnd() generate 100 sequencial random events 
# and design a Poisson counting process using the stairs 
# function with lambda=5

x = exprnd(0.2, 1, 100);
y = 0:1: 99;
for i = 1 : (99)
  x(i+1) = x(i) + x(i+1);
endfor
display(100);   
figure(1);
stairs(x, y, 'r');
title("Poisson Counting Process");
xlabel("Time (sec)");
ylabel("N(t)");
legend("lambda = 5 events/esc");

#TASK: find the average number of events per time unit
# for 200, 300, 500, 1000, 10000 events

e = [200, 300, 500, 1000, 10000]

for j = 1 : columns(e)
  x = exprnd(0.2, 1, e(j));
  y = 0:1: (e(j) - 1);
  for i = 1 : (e(j) - 1)
    x(i+1) = x(i) + x(i+1);
  endfor
  mean_value = e(j)/x(e(j));
  display(e(j));
  display(mean_value);
endfor 