%color plot! Nice!

clear;

options = 100;
lengths = linspace(0.01,10);
masses = linspace(0.01,10);
stopTime = zeros(100,100);

for i = 1:options
    for j = 1:options
        stopTime(i) = Main(lengths(i),masses(j),10000000);
    end
end
pcolor(lengths,masses,stopTime);