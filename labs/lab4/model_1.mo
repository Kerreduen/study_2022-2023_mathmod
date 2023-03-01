model model_1

  parameter Real w(start=4.3);
  Real x(start = -0.3);
  Real y(start = 1.3);
  
equation

  der(x)=y;
  der(y)=-w*x;
  
  annotation(experiment(StartTime = 0, StopTime = 61, Tolerance = 1e-6, Interval = 0.05));

end model_1;
