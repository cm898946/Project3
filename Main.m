%Carl Moser and Jonathan Jacobs
%Project 3 - Spherical pendulum with air resistance and hinge friction

%First iteration
%Pendulum Variables
mass = 2;                                           %kg
density = 7.80*1000;                                %kg/m^3
volume = mass/density;                              %m^3
radius = (.75*volume/pi)^(1/3);                     %m
crossSectionalArea = pi*radius^2;                   %m^2
gravity = 9.80551;                                  %m/s^2
length = .3;                                        %m
angle = 0;                                          %degrees
acceleration = 0;                                   %m/s^2
velocity = 0;                                       %m/s
cableWeightperLength = .179;                        %kg/m
cableWeight = cableWeightperLength * length;        %kg

%Forces
gravitational = mass*gravity;                       %N
centrifugal = (mass*velocity^2)/radius;             %N
tension = centrifugal + gravitational*cos(angle);   %N
totalx = 0;
totaly = 0;

%Second iteration
%Friction Variables
bearingCoefficientFriction = .0015;
dragCoefficient = 0.5;
airDensity = 1.225;                                 %kg/m^3

%Friction Forces
drag = .5*airDensity*dragCoefficient*crossSectionalArea*velocity^2; %N
hinge = tension*bearingCoefficientFriction;                         %N


t = 2*pi*sqrt(length/gravity)
