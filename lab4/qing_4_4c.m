# pblocking < 1%

clc;
close all;

for c=1:1:200
  rho = 23*c/60;
  pblock = erlangb_iterative(rho, c)
  if pblock < 0.01 
     display(c);
     break;
  endif
endfor