sol=ddesd(@dydt,@delay,@ddehist,[0,10])

%output units Pi bar, N krpm, Mfdot kg/sec,
%sol.y
lambda=sol.y(4,:);
plot(sol.x, sol.y(4,:));
%yint = deval(sol,10);
%yint(4);
%title({'MVEM'});
%xlabel('time t');
%ylabel('Lambda');
%legend('y_1','y_2','y_3','y_4','Location','NorthWest');
