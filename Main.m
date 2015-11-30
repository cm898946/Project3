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
energySpent = 0;
priorAngle = initAng;

%Second iteration
%Friction Variables
dragCoefficient = 0.5;
airDensity = 1.225;                                 %kg/m^3

options = odeset('RelTol', 1e-5);

initParams = [initAng;initV;energySpent];
[T,U] = ode45(@move,[0,howTime],initParams,options);
b = [T,U];
clf;
subplot(2,1,1);
plot(T,U(:,1));
subplot(2,1,2);
plot(T,U(:,3));
%Equations of motion
    
    function res = move(t,params)
    angle = params(1);
    velocity  = params(2);
    
    
    dAng = velocity;
    
    if velocity > 0
        drag  = -.5*length*airDensity*dragCoefficient*crossSectionalArea*velocity^2;
    elseif velocity < 0
        drag  =  .5*length*airDensity*dragCoefficient*crossSectionalArea*velocity^2;
    else
        drag = 0;
    end
 
    loss = length*drag*(angle-priorAngle)/(2*pi);
    
    priorAngle = angle;
    dangV = (-(gravity*length)*sin(angle))/(mass*(length^2));
    
    res = [dAng;dangV;abs(loss)];
    end

res = b;
end