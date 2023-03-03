using PyPlot
using DifferentialEquations

function f(du, u, p, t)
    du[1] = -a*u[1] + b*u[1]*u[2]
    du[2] = c*u[2] - d*u[1]*u[2]
end

function draw(p)
    ax = PyPlot.axes()
    ax.set_title(p)
    ax.plot(x, y, color="green")
    show()
    close()
    ax = PyPlot.axes()
    ax.set_title(p)
    ax.plot(time, x, color="blue")
    ax.plot(time, y, color="red")
    show()
    close()
end

range = (0, 100)
a = 0.63 # коэф. смертности хищников
b = 0.019 # коэф. прироста жертв
c = 0.59 # коэф. числа хищников
d = 0.018 # коэф.смертности жертв
X = 7
Y = 12
ode = ODEProblem(f, [X,Y], range)
sol = solve(ode, dtmax=0.02)
x = [u[1] for u in sol.u]
y = [u[2] for u in sol.u]
time = [t for t in sol.t]
draw("Случай с указанным начальным состоянием системы")

X = c/d
Y = a/b
ode = ODEProblem(f, [X,Y], range)
sol = solve(ode, dtmax=0.02)
x = [u[1] for u in sol.u]
y = [u[2] for u in sol.u]
time = [t for t in sol.t]
draw("Случай со стационарным состоянием системы")
