model model_3

parameter Real N= 860;
parameter Real N0= 2;
Real n(start=N0);

function k
  input Real t;
  output Real result;
algorithm
  result:= 0.66*sin(t); //коэф.1
end k;

function p
  input Real t;
  output Real result;
algorithm
  result:=  0.66*sin(6*t); //коэф.2
end p;

equation
  der(n)=(k(time)+p(time)*n)*(N-n);

  annotation(experiment(StartTime = 0, StopTime = 1, Tolerance = 1e-6, Interval = 0.01));

end model_3;
