using PyPlot
using DifferentialEquations

function f1(du, u, p, t)
    du[1] = u[1]-(b/c1)*u[1]*u[2]-(a1/c1)*u[1]*u[1]
    du[2] = (c2/c1)*u[2]-(b/c1)*u[1]*u[2]-(a2/c1)*u[2]*u[2]
end

function f2(du, u, p, t)
    du[1] = u[1]-(b/c1+d)*u[1]*u[2]-(a1/c1)*u[1]*u[1]
    du[2] = (c2/c1)*u[2]-(b/c1)*u[1]*u[2]-(a2/c1)*u[2]*u[2]
end

function draw(text)
    ax = PyPlot.axes()
    ax.set_title(text * " (линейный)")
    ax.plot(time, m1, color="red")
    ax.plot(time, m2, color="blue")
    show()
    close()
    ax = PyPlot.axes()
    ax.set_title(text * " (параметрический)")
    ax.plot(m1, m2, color="green")
    show()
    close()
end

range = (0, 20)
Pcr = 30
t1, t2 = 25, 20
p1, p2 = 10.1, 11.5
N = 80
q = 1
M1, M2 = 8.8, 9.9
a1 = Pcr / (t1*t1*p1*p1*N*q);
a2 = Pcr / (t2*t2*p2*p2*N*q);
b = Pcr / (t1*t1*t2*t2*p1*p1*p2*p2*N*q);
c1 = (Pcr - p1) / (t1*p1);
c2 = (Pcr - p2) / (t2*p2);
d = 0.0002
ode = ODEProblem(f1, [M1,M2], range)
sol = solve(ode, dtmax=0.01)
m1 = [u[1] for u in sol.u]
m2 = [u[2] for u in sol.u]
time = [t for t in sol.t]
draw("Случай 1")

ode = ODEProblem(f2, [M1,M2], range)
sol = solve(ode, dtmax=0.01)
m1 = [u[1] for u in sol.u]
m2 = [u[2] for u in sol.u]
time = [t for t in sol.t]
draw("Случай 2")
