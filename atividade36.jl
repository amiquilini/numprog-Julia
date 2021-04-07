"""
Atividade 36
com vetor
"""

function min36(x0,y0,precision)
    xbest = x0 # Save best point
    ybest = y0
    fbest = xbest^2 + ybest^2 # Best value up to now
    println(" Initial point: ",xbest, " ",ybest," ",fbest)
    deltaf = -1.
    deltas = 0.1
    while deltaf < 0.
        # Move x in the descent direction, with step deltax
        dfdx = 2*xbest # Computing the derivative
        dfdy = 2*ybest
        if abs(dfdx + dfdy) < precision
            println(" Critical point found. ")
            println(" xbest = ", xbest, " ybest = ", ybest, " fbest = ", fbest, " dfdx = ", dfdx, " dfdy = ", dfdy)
            return xbest, ybest, fbest
        end
        xtrial = xbest - deltas * dfdx # Move x in the -f' direction
        ytrial = ybest - deltas * dfdy
        # Compute function value at trial point
        ftrial = xtrial^2 + ytrial^2
        # If the function decreased, accept trial point and increase step
        if ftrial < fbest
            xbest = xtrial
            ybest = ytrial
            fbest = ftrial
            println(" Accepted: ", xbest, " ", ybest, " ",fbest," ",deltas," ", dfdx, " ", dfdy)
            deltas = deltas * 2
        else
            println(" Not accepted: ", xbest," ",fbest," ",deltas," ", dfdx, " ", dfdy)
            deltas = deltas / 2
        end
    end
end

xbest, ybest, fbest = min36(1., 4., 0.001)
