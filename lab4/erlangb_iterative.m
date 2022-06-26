# Erlang-B iterative

function B = erlangb_iterative(rho, c)
  B = 1;
  for n=0:1:c
      num = rho*B;
      den = rho*B + n;
      B = num/den;
  endfor
endfunction
