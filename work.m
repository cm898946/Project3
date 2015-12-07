%color plot! Nice!

clear;

options = 30;
lengths = linspace(1,7,options);
masses = linspace(1,7,options);
stopTime = zeros(options,options);

for i = 1:options
    for j = 1:options
        stopTime(i,j) = Main(lengths(i),masses(j),86400);
        display(i);
        display(j);
    end
end

clf;
pcolor(lengths,masses,stopTime);
hold on;
contour(lengths,masses,stopTime,[3600,3600],'r');
