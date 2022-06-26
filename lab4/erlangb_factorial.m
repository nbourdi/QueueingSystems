# Erlang-B factorial

function p_blocking = erlangb_factorial(rho, c)
  sum=0;
  for k=0:1:c
    sum += power(rho, k)/factorial(k);
  endfor
  num = power(rho,c)/factorial(c);
  p_blocking = num/sum;
endfunction