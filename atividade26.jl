"""
Atividade 26
E + S -> ES -> E + P

Discretização:

E[i] = E[i-1] - kr*S[i-1]*E[i-1]*dt + kf*ES[i-1] + kcat*ES[i-1]
S[i] = S[i-1] - kr*S[i-1]*E[i-1]*dt + kf*ES[i-1]
ES[i] = ES[i-1] + kr*S[i-1]*E[i-1]*dt - kcat*ES[i-1]
P[i] = P[i-1] + kcat*ES[i]

"""
function sim2_26(E0, S0, kr, kf, kcat, time)
    dt = 1.e-1 # Time-step
    nsteps = Int64(time/dt) # Number of steps
    t = Vector{Float64}(undef,nsteps)
    E = Vector{Float64}(undef,nsteps)
    S = Vector{Float64}(undef,nsteps)
    ES = Vector{Float64}(undef,nsteps)
    P = Vector{Float64}(undef,nsteps)
    E[1] = E0
    S[1] = S0
    ES[1] = 0.
    P[1] = 0.
    t[1] = 0.
    for i in 2:nsteps
        E[i] = E[i-1] - kr*S[i-1]*E[i-1]*dt + kf*ES[i-1]*dt + kcat*ES[i-1]*dt
        S[i] = S[i-1] - kr*S[i-1]*E[i-1]*dt + kf*ES[i-1]*dt
        ES[i] = ES[i-1] + kr*S[i-1]*E[i-1]*dt - kcat*ES[i-1]*dt
        P[i] = P[i-1] + kcat*ES[i]*dt
        t[i] = t[i-1] + dt
    end
    return t, E, S, ES, P
end

E0 = 5.
S0 = 10.
kr = 1.e-2
kf = 1.e-2
kcat = 1.
time = 60.

using Plots
t1, E1, S1, ES1, P1 = sim2_26(E0, S0, kr, kf, kcat, time)
plot(t1,S1,xlabel="time", ylabel="[S]", linecolor=:blue, label="[S]")
plot!(t1,E1,xlabel="time",ylabel="[E]",linecolor=:red, label="[E]")
plot!(t1,ES1,xlabel="time",ylabel="[ES]",linecolor=:green, label="[ES]")
plot!(t1,P1,xlabel="time",ylabel="[P]",linecolor=:black, label="[P]", title="Enzyme Kinetics")

savefig("./atividade26.pdf")
file = open("sim1.dat","w")
i = 0
for x in t
    global i = i + 1
    println(file,t[i]," ",P1[i])
end
close(file)
