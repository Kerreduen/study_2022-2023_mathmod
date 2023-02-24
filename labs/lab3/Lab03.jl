using PyPlot
using DifferentialEquations

function f1(du, u, p, t)
    du[1] = -0.36*u[1] -0.48*u[2] + sin(t + 1) + 1
    du[2] = -0.49*u[1] -0.37*u[2] + cos(t + 2) + 1.1
end

function f2(du, u, p, t)
    du[1] = -0.11*u[1] -0.68*u[2] + sin(5t) + 1.1
    du[2] = -0.6*u[1]*u[2] -0.15*u[2] + cos(5t) + 1
end

function draw(p)
    ax = PyPlot.axes()
    ax.set_xlim(0, 53000)
    ax.set_ylim(0, 50000)
    ax.set_title(p)
    ax.plot(x, y, linestyle="-", color="red")
    show()
    close()
    ax = PyPlot.axes()
    ax.set_xlim(0, 10)
    ax.set_ylim(0, 53000)
    ax.set_title(p)
    ax.plot(time, x, linestyle="-", color="blue")
    ax.plot(time, y, linestyle="-", color="green")
    show()
    close()
end

const X = 52000
const Y = 49000
range = (0, 10)
ode = ODEProblem(f1, [X,Y], range)
sol = solve(ode, dtmax=0.01)
x = [u[1] for u in sol.u]
y = [u[2] for u in sol.u]
time = [t for t in sol.t]
draw("Армия из регулярными войсками")

ode = ODEProblem(f2, [X,Y], range)
sol = solve(ode, dtmax=0.01)
x = [u[1] for u in sol.u]
y = [u[2] for u in sol.u]
time = [t for t in sol.t]
draw("Армия с партизанскими отрядами")
