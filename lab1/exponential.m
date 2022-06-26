#EXPONENTIAL
clc;
clear all;
close all;

pkg load statistics;

#TASK: in a common diagram, design the PDFs of exponential processes with mean 
# values 0.5,1,3. In the horizontal axis, choose k parameters 
# between 0 and 8. 

k = 0:0.0001:8;
mean = [0.5, 1, 3];

for i = 1 : columns(mean)
  expopdf(i, :) = exppdf(k, mean(i));
endfor

colors = "rbk";
figure(1);
hold on;
for i = 1 : columns(mean)
  plot(k, expopdf(i, :), colors(i), "linewidth", 2);
endfor
hold off;

title("Probability Density Function of Exponential processes");
xlabel("k values");
ylabel("probability");
legend("mean = 0.5", "mean = 1", "mean = 3");

#TASK: design the Cumulative Distribution Function of the above distributions

for i = 1 : columns(mean)
  expocdf(i, :) = expcdf(k, mean(i));
endfor

figure(2);
hold on;
for i = 1 : columns(mean)
  plot(k, expocdf(i, :), colors(i), "linewidth", 2);
endfor
hold off;

title("Cumulative Distribution Function of Exponential processes");
xlabel("k values");
ylabel("probability");
legend("mean = 0.5", "mean = 1", "mean = 3");

#TASK: property of memorylessness: 
# calculate the probabilities P(X>30000) and P(X>50000|X>20000) for 
# an Exponential distribution of mean value 2.5.

k = 0:0.00001:8;

ex = expcdf(k,2.5);
Pr_1 = 1 - ex(30000);
p_1 = 1 - ex(50000);
p_2 = 1 - ex(20000);
Pr_2 = (p_1)./(p_2);
display("P(X>30000) = ");
display(Pr_1);
display("P(X>50000|X>20000) = ");
display(Pr_2);
