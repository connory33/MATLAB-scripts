% Demonstrate RandomMondrian

close all
figure
set(gcf,'color','k','position',[50 50 800 600])  % Fixed
hold on
axis equal off manual
RandomMondrian(0,0,1,1,4)  % Different arguments may be used
                           % Recursion level will be >0 and <7
shg

