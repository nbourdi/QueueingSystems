% M/M/1/10 simulation
clc;
clear all;
close all;
s = 1; % counter for figures
lambda = [1, 5, 10]; 
mu = 5;

for j=1:1:length(lambda)
  rand("seed", 1);
  threshold = lambda(j)/(lambda(j) + mu); % the threshold used to calculate probabilities
  index = 0;
  transitions = 0; % holds the transitions of the simulation in transitions steps
  
  arrivals = zeros(1, 11);
  P = zeros(1, 11);
  total_arrivals = 0; % to measure the total number of arrivals
  current_state = 0;  % holds the current state of the system
  previous_mean_clients = 0; % will help in the convergence test
  
  while transitions >= 0
    transitions = transitions + 1; % one more transitions step
    if mod(transitions,1000) == 0 % check for convergence every 1000 transitions steps
      index = index + 1;
      for i=1:1:11
          P(i) = arrivals(i)/total_arrivals; % calcuate the probability of every state in the system
      endfor
      mean_clients = 0; % calculate the mean number of clients in the system
      for i=1:1:11
         mean_clients = mean_clients + (i-1).*P(i);
      endfor
      to_plot(index) = mean_clients;
      if abs(mean_clients - previous_mean_clients) < 0.00001 || transitions > 1000000 % convergence test
        break;
      endif
      previous_mean_clients = mean_clients;
    endif

    random_number = rand(1); % generate a random number (Uniform distribution)
    if current_state == 0 || random_number < threshold % arrival
      total_arrivals = total_arrivals + 1;
      if current_state < 11
        arrivals(current_state + 1) = arrivals(current_state + 1) + 1;
        if current_state < 10
          current_state = current_state + 1;
        endif
      endif
    else % departure
      if current_state != 0 % no departure from an empty system
        current_state = current_state - 1;
      endif
    endif
  endwhile

  % display the state probabilities
  display("Probabilities of the 11 states = ");
  for i=1:1:11
    display(P(i));
  endfor
  
  display(mean_clients);
  %display the average delay time
  average_delay_time = mean_clients / (lambda(j)*(1-P(11)));
  display("Average delay time =");
  disp(average_delay_time);

  % display the blocking probability
  display("P[blocking] = ");
  display(P(11));

  figure(s);
  plot(to_plot,"r","linewidth",1.3);
  title("Average number of clients in the M/M/1/10 queue: Convergence");
  xlabel("transitions in thousands");
  ylabel("Average number of clients");
  s++;
  figure(s);
  bar(P,'r',0.4);
  title("Probabilities");
  s++;
endfor