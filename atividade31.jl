"""
Atividade 31
y = x^2 + sen(10x)
dx/dy = 2x + 10 cos(10x)

teste: variar x = -2:2 e deltax
"""

function min2(x0, deltax)
    x = x0
    xbest = x # Save best point
    fbest = x^2 + sin(10*x) # Best value up to now
    println(" Initial point: ",xbest," ",fbest)
    deltaf = -1.
    while deltaf < 0.
        # Move x in the descent direction, with step deltax
        dfdx = 2*x + 10*cos(10*x) # Computing the derivative
        x = x - deltax * dfdx/abs(dfdx) # Move x in the -f' direction
        # Test new point
        deltaf = (x^2 + sin(10*x)) - fbest
        # Write current point
        println("Current point: ",x," ",(x^2 + sin(10*x))," ",deltaf)
        # If the function decreased, save best point
        if deltaf < 0.
            xbest = x
            fbest = x^2 + sin(10*x)
        else
            println(" Function is increasing. ")
            println(" Best solution found: x = ", xbest, " f(x) = ",fbest)
            return xbest, fbest
        end
    end
end

#xbest, fbest = min2(-2.,0.01)
#xbest, fbest = min2(-1.,0.01)
#xbest, fbest = min2(0.,0.1)
xbest, fbest = min2(0.,0.01)
#xbest, fbest = min2(0.,100)
#xbest, fbest = min2(1.,0.01)
#xbest, fbest = min2(2.,0.01)
