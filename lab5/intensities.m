% a function to calculate the load intensity in each node

function [ergo, r1, r2, r3, r4, r5] = intensities(l1,l2,m1,m2,m3,m4,m5)
  r1 = l1/m1;
  r2 = (l2+(2/7)*l1)/m2;
  r3 = ((4/7)*l1)/m3;
  r4 = ((3/7)*l1)/m4;
  r5 = (l2+(4/7)*l1)/m5;
  
  % if the network is ergodic, ergo = 1 else 0
  
  if ((r1 <1) && (r2<2) && (r3<1) && (r4<2))
    ergo = 1;
    disp("The system is ergodic.");
  else 
    ergo = 0;
    disp("The system is not ergodic.");
  endif
  
  display(r1);
  display(r2);
  display(r3);
  display(r4);
endfunction
