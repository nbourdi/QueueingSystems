l1 = 4;
l2 = 1;
m1 = 6;
m2 = 5;
m3 = 8;
m4 = 7;
m5 = 6;

% QUESTION 4
[E1, E2, E3, E4, E5] = mean_clients(l1,l2, m1, m2, m3, m4, m5);
E = (E1+E2+E3+E4+E5)/(l1+l2);
display("The mean number of clients end to end: ");
display(E);

% QUESTION 6
l1_max = 6;
l = 1;
for l1 = 0.1*l1_max:0.01*l1_max:0.99*l1_max
  [E1, E2, E3, E4, E5] = mean_clients(l1,l2, m1, m2, m3, m4, m5);
  E(l) = (E1+E2+E3+E4+E5)/(l1+l2);
  l++;
endfor
l1 = 0.1*l1_max:0.01*l1_max:0.99*l1_max;
figure(1);
plot(l1, E, "r","linewidth", 1.5);
xlabel("lambda_1 values");
ylabel("E(T)");
title("Mean number of clients end to end for values of lambda_1");
grid on;