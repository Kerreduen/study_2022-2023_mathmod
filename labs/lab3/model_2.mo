model model_2
  parameter Real a( start=0.11);
  parameter Real b( start=0.68);
  parameter Real c( start=0.6);
  parameter Real h( start=0.15);
  Real x(start=52000);
  Real y(start=49000);
  
  equation
    der(x)=-a*x-b*y+sin(5*time)+1.1;
    der(y)=-c*x*y-h*y+cos(5*time)+1;
  
  annotation(experiment(StartTime=0, StopTime=10, Tolerance=1e-6, Interval=0.05));  

end model_2;
