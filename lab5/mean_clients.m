
function [E1, E2, E3, E4, E5] = mean_clients(l1,l2, m1, m2, m3, m4, m5)
  [ergo, r1, r2, r3, r4, r5] = intensities(l1,l2, m1, m2, m3, m4, m5);
  E1 = r1/(1-r1);
  E2 = r2/(1-r2);  
  E3 = r3/(1-r3);  
  E4 = r4/(1-r4);  
  E5 = r5/(1-r5);
endfunction
