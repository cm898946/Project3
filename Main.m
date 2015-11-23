%Carl Moser and Jonathan Jacobs
%Project 3 - Spherical pendulum with air resistance and hinge friction
function res = Main(howLong,howBig,howTime)

%First iteration
%Pendulum Variables
mass = howBig;                                           %kg
density = 7.80*1000;                                %kg/m^3
volume = mass/density;                              %m^3
radius = (.75*volume/pi)^(1/3);                     %m
crossSectionalArea = pi*radius^2;                   %m^2
gravity = 9.80551;                                  %m/s^2
length = howLong;                                        %m
initV = 0;                                          %m/s
initAng = -pi/2;                                    %rad
cableWeightperLength = .179;                        %kg/m
cableWeight = cableWeightperLength * length;        %kg

%Second iteration
%Friction Variables
bearingCoefficientFriction = .0015;
dragCoefficient = 0.5;
airDensity = 1.225;                                 %kg/m^3

initParams = [initAng;initV];
[T,U] = ode45(@move,[0,howTime],initParams);
b = [T,U];
clf;
plot(T,U(:,1));
%Equations of motion
    
    function res = move(t,params)
    angle = params(1);
    velocity  = params(2);
    dAng = velocity;
    centrifugal = (mass*velocity^2)/length;                 %N
    tension = centrifugal + mass*gravity*cos(angle);       %N
    if velocity > 0
        drag  = -.5*length*airDensity*dragCoefficient*crossSectionalArea*velocity^2;
        hinge = -tension*bearingCoefficientFriction;        %N
    elseif velocity < 0
        drag  = .5*length*airDensity*dragCoefficient*crossSectionalArea*velocity^2;
        hinge = tension*bearingCoefficientFriction;         %N
    else
        drag = 0;
        hinge = 0;
    end

    dangV = (-(gravity*length)*sin(angle) + drag)/(mass*(length^2));
    
    res = [dAng;dangV];
    end

res = b;
end