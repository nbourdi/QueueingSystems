# Blocking probabilities diagram
# using erlangb_iterative
clc;
close all;

for c=1:1:200
  rho = 23*c/60;
  pblock(c) = erlangb_iterative(rho, c)
endfor

figure(1);
stem(pblock, 'r');
title("Bloccking probability - Number of phone lines");
xlabel("Phone lines");
ylabel("Blocking probability");
