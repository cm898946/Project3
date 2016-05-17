points = [0,1.22, 2.424, 3.61, 4.78, 5.984, 7.171, 8.358, 9.545, 10.732, 11.918];
yVals = [0.5,-0.45, 0.41,-0.42,0.38,-0.32,.33,-0.26,0.26,-0.29,.21];
yVal1 = [-0.6,-0.6,-0.6,-0.6,-0.6,-0.6,-0.6,-0.6,-0.6,-0.6,];
yVal2 = [0.6,0.6,0.6,0.6,0.6,0.6,0.6,0.6,0.6,0.6];
hold on;
%{
for i = 1:length(points)
   line([points(i) points(i)], [yVal1(i) yVal2(i)],'Color',[1,0,0]);
end
%}
plot(points,yVals,'r*-');
title('Comparison to actual pendulum');
xlabel('Time in seconds');
ylabel('Angle in radians');
legend('Model','Minimums and Maximums');
