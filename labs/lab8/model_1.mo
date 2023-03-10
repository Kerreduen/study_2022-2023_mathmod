model model_1

parameter Real p_cr = 30;//критическая стоимость продукта
parameter Real tau1 = 25;//длительность производственного цикла фирмы 1
parameter Real p1 = 10.1;//себестоимость продукта у фирмы 1
parameter Real tau2 = 20;//длительность производственного цикла фирмы 2
parameter Real p2 = 11.5; //себестоимость продукта у фирмы 2
parameter Real N = 80; //число потребителей производимого продукта
parameter Real q = 1; //максимальная потребность одного человека в продукте в единицу времени

parameter Real a1 = p_cr/(tau1*tau1*p1*p1*N*q);
parameter Real a2 = p_cr/(tau2*tau2*p2*p2*N*q);
parameter Real b = p_cr/(tau1*tau1*tau2*tau2*p1*p1*p2*p2*N*q);
parameter Real c1 = (p_cr-p1)/(tau1*p1);
parameter Real c2 = (p_cr-p2)/(tau2*p2);

parameter Real d = 0.0002;

Real M1(start=8.8);
Real M2(start=9.9);

equation
  der(M1) = M1-(b/c1)*M1*M2-(a1/c1)*M1*M1;
  der(M2) = (c2/c1)*M2-(b/c1)*M1*M2-(a2/c1)*M2*M2;

  annotation(experiment(StartTime = 0, StopTime = 20, Tolerance = 1e-6, Interval = 0.02));

end model_1;
