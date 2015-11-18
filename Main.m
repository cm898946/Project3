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
acceleration = 0;                                   %m/s^2
cableWeightperLength = .179;                        %kg/m
cableWeight = cableWeightperLength * length;        %kg

%Forces
gravitational = mass*gravity;                       %N
centrifugal = (mass*initV^2)/radius;             %N
tension = centrifugal + gravitational*cos(0);   %N
totalx = 0;
totaly = 0;

%Second iteration
%Friction Variables
bearingCoefficientFriction = .0015;
dragCoefficient = 0.5;
airDensity = 1.225;                                 %kg/m^3

%Friction Forces
drag = .5*airDensity*dragCoefficient*crossSectionalArea*initV^2; %N
hinge = tension*bearingCoefficientFriction;  %N

initParams = [initAng;initV];
[T,U] = ode45(@move,[0,10000],initParams);

plot(T,U(:,1));
%Equations of motion
    
    function res = move(t,params)
    angle = params(1);
    velocity  = params(2);
    dAng = velocity;
    dangV = -(gravity/length)*sin(angle) - .5*(velocity*length)^2;
   
    res = [dAng;dangV];
    end

end