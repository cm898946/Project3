%color plot! Nice!

clear;

options = 200;
lengths = linspace(1,7,options);
masses = linspace(1,5,options);
stopTime = zeros(options,options);

parfor i = 1:options
    for j = 1:options
        stopTime(i,j) = Main(lengths(i),masses(j),86400);
        display(i);
        display(j);
    end
end

clf;
h = pcolor(lengths,masses,stopTime);
set(h, 'EdgeColor', 'none');
hold on;
contour(lengths,masses,stopTime,[3600,3600],'r');
