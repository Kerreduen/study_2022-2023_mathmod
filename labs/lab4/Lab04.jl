using PyPlot
using DifferentialEquations

function f1(du, u, p, t)
    du[1] = u[2]
    du[2] = -w*u[1]
end

function f2(du, u, p, t)
    du[1] = u[2]
    du[2] = -2*g*u[2]-w*u[1]
end

function f3(du, u, p, t)
    du[1] = u[2]
    du[2] = -2*g*u[2]-w*u[1]+0.7*sin(3*t)
end

function draw(p)
    ax = PyPlot.axes()
    ax.set_title(p)
    ax.plot(x, y, linestyle="-", color="red")
    show()
    close()
    ax = PyPlot.axes()
    ax.set_title(p)
    ax.plot(time, x, linestyle="-", color="blue")
    ax.plot(time, y, linestyle="-", color="green")
    show()
    close()
end

range = (0, 61)
X = -0.3
Y = 1.3
w = 4.3
ode = ODEProblem(f1, [X,Y], range)
sol = solve(ode, dtmax=0.05)
x = [u[1] for u in sol.u]
y = [u[2] for u in sol.u]
time = [t for t in sol.t]
draw("Случай 1")

w = 20
g = 0.5
ode = ODEProblem(f2, [X,Y], range)
sol = solve(ode, dtmax=0.05)
x = [u[1] for u in sol.u]
y = [u[2] for u in sol.u]
time = [t for t in sol.t]
draw("Случай 2")

w = 8.8
g = 0.5
ode = ODEProblem(f3, [X,Y], range)
sol = solve(ode, dtmax=0.05)
x = [u[1] for u in sol.u]
y = [u[2] for u in sol.u]
time = [t for t in sol.t]
draw("Случай 3")
