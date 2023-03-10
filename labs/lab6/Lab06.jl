using PyPlot
using DifferentialEquations

function f1(du, u, p, t)
    du[1] = 0
    du[2] = -b*u[2]
    du[3] = b*u[2]
end

function f2(du, u, p, t)
    du[1] = -a*u[1]
    du[2] = a*u[1]-b*u[2]
    du[3] = b*u[2]
end

function draw(p)
    ax = PyPlot.axes()
    ax.set_title(p)
    ax.plot(time, s, color="blue")
    ax.plot(time, i, color="red")
    ax.plot(time, r, color="green")
    show()
    close()
end

range = (0, 100)
a = 0.01 # коэф. заболевания
b = 0.02 # коэф. выздоровления
N = 11700 # всего людей
I0 = 270 # изначально инфицированные
R0 = 49 # изначально с имунитетом
S0 = N - I0 - R0 # изначально восприимчивых
ode = ODEProblem(f1, [S0,I0,R0], range)
sol = solve(ode, dtmax=0.02)
s = [u[1] for u in sol.u]
i = [u[2] for u in sol.u]
r = [u[3] for u in sol.u]
time = [t for t in sol.t]
draw("При I(0) <= 0")

ode = ODEProblem(f2, [S0,I0,R0], range)
sol = solve(ode, dtmax=0.02)
s = [u[1] for u in sol.u]
i = [u[2] for u in sol.u]
r = [u[3] for u in sol.u]
time = [t for t in sol.t]
draw("При I(0) > 0")
