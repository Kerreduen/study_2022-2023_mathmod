model model_3

  parameter Real w(start=8.8);
  parameter Real g(start=0.5);
  Real x(start = -0.3);
  Real y(start = 1.3);
  
equation

  der(x)=y;
  der(y)=-2*g*y-w*x+0.7*sin(3*time);
  
  annotation(experiment(StartTime = 0, StopTime = 61, Tolerance = 1e-6, Interval = 0.05));  

end model_3;
