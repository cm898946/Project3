%Carl Moser and Jonathan Jacobs
%Project 3 - Spherical pendulum with air resistance and hinge friction
function Main()

%First iteration
%Pendulum Variables
mass = 2;                                           %kg
density = 7.80*1000;                                %kg/m^3
volume = mass/density;                              %m^3
radius = (.75*volume/pi)^(1/3);                     %m
crossSectionalArea = pi*radius^2;                   %m^2
gravity = 9.80551;                                  %m/s^2
length = .3;                                        %m
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
[T,U] = ode45(@move,[0,100],initParams);

plot(T,U(:,1));
%Equations of motion
    
    function res = move(t,params)
    angle = params(1);
    velocity  = params(2);
    dAng = velocity;
    drag = 0;
    centrifugal = (mass*velocity^2)/radius;                 %N
    tension = centrifugal + gravity/length*cos(angle);       %N
    if velocity > 0
        drag  = -.5*airDensity*dragCoefficient*crossSectionalArea*velocity^2;
        hinge = -tension*bearingCoefficientFriction;        %N
    elseif velocity < 0
        drag  = .5*airDensity*dragCoefficient*crossSectionalArea*velocity^2;
        hinge = tension*bearingCoefficientFriction;         %N
    else
        drag = 0;
        hinge = 0;
    end
    dangV = -(gravity/length)*sin(angle) + drag/mass + hinge/mass;
    
    res = [dAng;dangV];
    end

end