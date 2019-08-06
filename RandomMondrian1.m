function RandomMondrian1(a,b,L,W,level)
% Display an L-by-W random Mondrian with lower left corner (a,b) using
% RECURSION.
% Level is the level of partitioning, 0<level<7.
% Assume that hold is on and that the figure window is appropriately set.

%pHalt= 0.3;
MyColor= [ 1.0 0.0 0.0;...
           0.5 0.5 0.5;...
           1.0 0.0 1.0;...
           0.0 1.0 0.0;...
           0.0 0.0 1.0;...
           1.0 0.5 0.5;...
           0.33 0.33 0.33;...
           1.0 1.0 0.0]; 
bWidth= 2;
xDivisPoint= 0;
yDivisPoint= 0;
%condition=rand;

if level== 0 %|| condition < pHalt
    fill(a, b, MyColor(round(1+rand*7)))
    plot(a, b, 'k', 'Linewidth', bWidth)
else
    fill([a a+L a+L a a], [b b b+W b+W b], MyColor(round(1+rand*8)))
    plot([a a+L a+L a a], [b b b+W b+W b], 'k', 'Linewidth', bWidth)
    
    xDivisPoint= rand*((3*L)/4-(L/4))+(L/4);
    yDivisPoint= rand*((3*W)/4-(W/4))+(W/4);
            
    xBotLeft= [a a+xDivisPoint a+xDivisPoint a a];
    yBotLeft= [b b b+yDivisPoint b+yDivisPoint b];
    xBotRight= [a+xDivisPoint a+L a+L a+xDivisPoint a+xDivisPoint];
    yBotRight= [b b b+yDivisPoint b+yDivisPoint b];
    xTopLeft= [a a+xDivisPoint a+xDivisPoint a a];
    yTopLeft= [b+yDivisPoint b+yDivisPoint b+W b+W b+yDivisPoint];
    xTopRight= [a+xDivisPoint a+L a+L a+xDivisPoint a+xDivisPoint];
    yTopRight= [b+yDivisPoint b+yDivisPoint b+W b+W b+yDivisPoint];
            
            disp(a)
            disp(L)
            disp(xDivisPoint)
            
    fill(xBotLeft, yBotLeft, MyColor(round(1+rand*7)))
    plot(xBotLeft, yBotLeft, 'k', 'Linewidth', bWidth)
    fill(xBotRight, yBotRight, MyColor(round(1+rand*7)))
    plot(xBotRight, yBotRight, 'k', 'Linewidth', bWidth)
    fill(xTopLeft, yTopLeft, MyColor(round(1+rand*7)))
    plot(xTopLeft, yTopLeft, 'k', 'Linewidth', bWidth)
    fill(xTopRight, yTopRight, MyColor(round(1+rand*7)))
    plot(xTopRight, yTopRight, 'k', 'Linewidth', bWidth)
    pause
            
    RandomMondrian1(a, 0, xDivisPoint, yDivisPoint,... %L is assigned xdivs length here
        level-1) % bottom left this one works
                
    %RandomMondrian1(xDivisPoint, 0, a+L-xDivisPoint,...
     %    yDivisPoint, level-1) % bottom right
                
    %RandomMondrian1(a, b+yDivisPoint, xDivisPoint,...
     %   W-yDivisPoint, level-1) % top left
                
    %RandomMondrian1(a+xDivisPoint, b+yDivisPoint,...
     %   L-xDivisPoint, W-yDivisPoint, level-1) % top right

end