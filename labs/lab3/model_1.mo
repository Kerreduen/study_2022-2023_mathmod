model model_1
  parameter Real a( start=0.36);
  parameter Real b( start=0.48);
  parameter Real c( start=0.49);
  parameter Real h( start=0.37);
  Real x(start=52000);
  Real y(start=49000);
  
  equation
    der(x)=-a*x-b*y+sin(time+1)+1;
    der(y)=-c*x-h*y+cos(time+2)+1.1;
  
  annotation(experiment(StartTime=0, StopTime=10, Tolerance=1e-6, Interval=0.05));  

end model_1;
