function runAll()

    g = 9.80551;
    l = 0.3;
    initV = 0;
    initAng = -pi/2;
    initParams = [initAng;initV];


    [T,U] = ode45(@move,[0,10000],initParams);
    plot(T,U(:,1));

    function res = move(t,params)
    angle = params(1);
    velocity  = params(2);
    dAng = velocity;
    dangV = -(g/l)*sin(angle) - .5*(velocity*l)^2;
   
    res = [dAng;dangV];
    end



end