%color plot! Nice!

clear;

options = 15;
lengths = linspace(0.01,10,options);
masses = linspace(0.01,10,options);
stopTime = zeros(options,options);

for i = 1:options
    for j = 1:options
        stopTime(i,j) = Main(lengths(i),masses(j),86400);
        display(i);
        display(j);
    end
end
pcolor(lengths,masses,stopTime);