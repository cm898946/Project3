library(deSolve)
library(plotrix)

setwd('C:/Users/cmoser/Documents/GitHub/Project3/images')

mass <- 2
density <- 7.8*1000
volume <- mass/density
radius <- (.75*volume/pi)^(1/3)
crossSectionalArea <- pi*radius^2
gravity <- 9.80551
length <- .3
velocity0 <- 0
angle0 <- -pi/2
cableWeightperLength <- .179
cableWeight <- cableWeightperLength*length

bearingCoefficientFriction <- .0015
dragCoefficient <- .5
airDensity <- 1.225

parms <- c(mass, crossSectionalArea, gravity, length, bearingCoefficientFriction, dragCoefficient, airDensity)

initParams <- c(angle0, velocity0)

move <- function(t, y, parms){
	with(as.list(y), {
	angle <- y[1]
	velocity <- y[2]
	dAng <- velocity
	centrifugal <- (mass*velocity^2)/length
	tension <- centrifugal + mass*gravity*cos(angle)

	if(velocity > 0){
		drag  <- -.5*length*airDensity*dragCoefficient*crossSectionalArea*velocity^2
      	hinge <- -tension*bearingCoefficientFriction 
	}
	else if (velocity < 0){
     	drag  <- .5*length*airDensity*dragCoefficient*crossSectionalArea*velocity^2
      	hinge <- tension*bearingCoefficientFriction
    }
    else{
    	drag <- 0
        hinge <- 0
    }
    dangV <- (-(gravity*length)*sin(angle) + drag + hinge)/(mass*(length^2))

	list(c(dAng, dangV)) })
}

times <- seq(from = 0, to = 30, by = .01)
out <- ode(times = times, y = initParams, parms = parms, func = move, method = rkMethod("ode45"))

png(file="example%03d.png", width=800, heigh=800)
for(i in 1:(nrow(out)/3)){
	plot(x=0, y=0, xlim=c(-10,10), ylim=c(-9,1), xaxt='n', yaxt='n', ann=FALSE)
	segments(0, 0, -8*sin(out[3*i,2]), -4*cos(out[3*i,2]))
	draw.circle(-8*sin(out[3*i,2]), -4*cos(out[3*i,2]),1,nv=100,border=NULL,col="black",lty=1,lwd=1)
	}
dev.off()