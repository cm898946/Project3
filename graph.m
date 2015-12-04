
points = [1.22, 2.424, 3.61, 4.78, 5.984, 7.171, 8.358, 9.545, 10.732, 11.918];
yVal1 = [-0.6,-0.6,-0.6,-0.6,-0.6,-0.6,-0.6,-0.6,-0.6,-0.6,];
yVal2 = [0.6,0.6,0.6,0.6,0.6,0.6,0.6,0.6,0.6,0.6];
hold on;
for i = 1:length(points)
   line([points(i) points(i)], [yVal1(i) yVal2(i)],'Color',[1,0,0]);
end

title('Comparison to actual pendulum');
xlabel('Time in seconds');
ylabel('Angle in radians');
legend('Model','Minimums and Maximums');
