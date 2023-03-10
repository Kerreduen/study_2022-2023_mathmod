using PyPlot
using DifferentialEquations

function f(du, u, p, t)
    du[1] = (a1 * t + a2 * t * u[1]) * (N - u[1])
end

function f2(du, u, p, t)
    du[1] = (a1 * sin(t) + a2 * sin(6*t) * u[1]) * (N - u[1])
end

function draw(p)
    ax = PyPlot.axes()
    ax.set_title(p)
    ax.plot(time, n, color="blue")
    show()
    close()
end

range = (0, 1)
N = 860
N0 = 2
a1 = 0.66
a2 = 0.000061
ode = ODEProblem(f, [N0], range)
sol = solve(ode, dtmax=0.01)
n = [u[1] for u in sol.u]
time = [t for t in sol.t]
draw("Случай 1")

a1 = 0.000056
a2 = 0.66
ode = ODEProblem(f, [N0], range)
sol = solve(ode, dtmax=0.01)
n = [u[1] for u in sol.u]
time = [t for t in sol.t]
draw("Случай 2")

a1 = 0.66
a2 = 0.66
ode = ODEProblem(f2, [N0], range)
sol = solve(ode, dtmax=0.01)
n = [u[1] for u in sol.u]
time = [t for t in sol.t]
draw("Случай 3")