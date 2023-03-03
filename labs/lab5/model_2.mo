model model_2

parameter Real a = 0.63;
parameter Real b = 0.019;
parameter Real c = 0.59;
parameter Real d = 0.018;

parameter Real x0=c/d;
parameter Real y0=a/b;

Real x(start =x0);
Real y(start =y0);

equation
  der(x) = -a*x + b*x*y;
  der(y) = c*y - d*x*y;

  annotation(experiment(StartTime = 0, StopTime = 100, Tolerance = 1e-6, Interval = 0.02));

end model_2;
