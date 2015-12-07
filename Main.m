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
initAng = 28.8*pi/180;                                    %rad
energySpent = 0;
priorAngle = initAng;

%Second iteration
%Friction Variables
dragCoefficient = 5;
airDensity = 1.225;                                 %kg/m^3

options = odeset('Events',@events,'RelTol', 1e-5);

initParams = [initAng;initV;energySpent];
[T,U,TE, YE, IE] = ode45(@move,[0,howTime],initParams,options);
b = TE;
%clf;
%subplot(2,1,1);
%plot(T,U(:,1));
%subplot(2,1,2);
%plot(T,U(:,3));
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
        dangV = (-(gravity*length)*sin(angle)+ drag)/((length^2));
        
        res = [dAng;dangV;abs(loss)];
    end

    function [value,isterminal,direction] = events(t,y)
       value  = abs(y(1)) + abs(y(2)) - 0.05;
       isterminal = 1;
       direction = 0;
    end

res = b;
end