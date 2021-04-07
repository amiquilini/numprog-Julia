"""
Atividade 27
CFCl3 -> Cl. + .CFCl2
Cl. + O3 -> ClO + O2
ClO + O3 -> Cl. + 2O2

Discretização:
CFCl3[i] = CFCl3[i-1] - k1*CFCl3[i-1]*dt
Cl[i] = Cl[i-1] + k1*CFCl3[i-1]*dt - k2*Cl[i-1]*O3[i-1]*dt + k3*ClO[i-1]*O3[i-1]*dt
CFCl2[i] = CFCl2[i-1] + k1*CFCl3[i-1]*dt
O3[i] = O3[i-1] - k2*Cl[i-1]*O3[i-1]*dt - k3*ClO[i-1]*O3[i-1]*dt
ClO[i] = ClO[i-1] + k2*Cl[i-1]*O3[i-1]*dt - k3*ClO[i-1]*O3[i-1]*dt
O2[i] = O2[i-1] + k2*Cl[i-1]*O3[i-1]*dt + k3*dt*ClO[i-1]*O3[i-1]*2
"""
function sim2_27(CFCl30, O30, k1, k2, k3, time)
    dt = 1.e-1 # Time-step
    nsteps = Int64(time/dt) # Number of steps
    t = Vector{Float64}(undef,nsteps)
    CFCl3 = Vector{Float64}(undef,nsteps)
    O3 = Vector{Float64}(undef,nsteps)
    CFCl2 = Vector{Float64}(undef,nsteps)
    Cl = Vector{Float64}(undef,nsteps)
    ClO = Vector{Float64}(undef,nsteps)
    O2 = Vector{Float64}(undef,nsteps)
    CFCl3[1] = CFCl30
    O3[1] = O30
    CFCl2[1] = 0.
    Cl[1] = 0.
    ClO[1] = 0.
    O2[1] = 0.
    t[1] = 0.
    for i in 2:nsteps
        CFCl3[i] = CFCl3[i-1] - k1*CFCl3[i-1]*dt
        Cl[i] = Cl[i-1] + k1*CFCl3[i-1]*dt - k2*Cl[i-1]*O3[i-1]*dt + k3*ClO[i-1]*O3[i-1]*dt
        CFCl2[i] = CFCl2[i-1] + k1*CFCl3[i-1]*dt
        O3[i] = O3[i-1] - k2*Cl[i-1]*O3[i-1]*dt - k3*ClO[i-1]*O3[i-1]*dt
        ClO[i] = ClO[i-1] + k2*Cl[i-1]*O3[i-1]*dt - k3*ClO[i-1]*O3[i-1]*dt
        O2[i] = O2[i-1] + k2*Cl[i-1]*O3[i-1]*dt + k3*dt*ClO[i-1]*O3[i-1]*2
        t[i] = t[i-1] + dt
    end
    return t, CFCl3, O3, CFCl2, Cl, ClO, O2
end

CFCl30 = 5.
O30 = 10.
k1 = 1.e-2
k2 = 1.e-2
k3 = 1.e-1
time = 160.

using Plots
t1, CFCl31, O31, CFCl21, Cl1, ClO1, O21 = sim2_26(CFCl30, O30, k1, k2, k3, time)
plot(t1,CFCl31,xlabel="time", ylabel="[CFCl3]", linecolor=:blue, label="[CFCl3]")
plot!(t1,O31,xlabel="time",ylabel="[O3]",linecolor=:black, label="[O3]", title="O3 Decomp.")
plot!(t1,CFCl21,xlabel="time",ylabel="[CFCl2]",linecolor=:pink, label="[CFCl2]")
plot!(t1,Cl1,xlabel="time",ylabel="[Cl]",linecolor=:green, label="[Cl]")
plot!(t1,ClO1,xlabel="time",ylabel="[ClO]",linecolor=:yellow, label="[ClO]")
plot!(t1,O21,xlabel="time",ylabel="[O2]",linecolor=:red, label="[O2]")
