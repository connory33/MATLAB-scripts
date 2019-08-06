function RandomMondrian(a,b,L,W,level)
% Display an L-by-W random Mondrian with lower left corner (a,b) using
% RECURSION.
% Level is the level of partitioning, 0<level<7.
% Assume that hold is on and that the figure window is appropriately set.

pHalt= 0.3; % stopping condition
MyColor= [ 1.0 0.0 0.0;... % possible color array
           0.5 0.0 1.0;...
           1.0 0.0 1.0;...
           0.0 1.0 0.0;...
           0.0 0.0 1.0;...
           1.0 0.5 0.5;...
           0.33 0.33 0.33;...
           1.0 1.0 0.0]; 
bWidth= 2; % border thickness
xDivisPoint= 0; % initializing variables
yDivisPoint= 0;
condition=rand; % generating termination condition value to check

if level== 0 || condition < pHalt % termination condition after certain amount
                                  % of subdivisions or pHalt
    fill(a, b, MyColor(round(1+rand*7),:)) % fills with randomly selected color
    plot(a, b, 'k', 'Linewidth', bWidth) % draws black border around box
    
else
    % fills intial rectangle with random color
    fill([a a+L a+L a a], [b b b+W b+W b], MyColor(round(1+rand*7),:))
    %plots border around initial rectangle
    plot([a a+L a+L a a], [b b b+W b+W b], 'k', 'Linewidth', bWidth)
    
    
    xDivisPoint= rand*((3*L)/4-(L/4))+(L/4); % randomly selects subdivision
    yDivisPoint= rand*((3*W)/4-(W/4))+(W/4); % point far enough from edges
    
    
    % parametrizes the coordinates of the newly created rectangles
    xBotLeft= [a a+xDivisPoint a+xDivisPoint a a]; % bottom left corner
    yBotLeft= [b b b+yDivisPoint b+yDivisPoint b];
    
    xBotRight= [a+xDivisPoint a+L a+L a+xDivisPoint a+xDivisPoint]; % bottom right corner
    yBotRight= [b b b+yDivisPoint b+yDivisPoint b];
    
    xTopLeft= [a a+xDivisPoint a+xDivisPoint a a]; % top left corner
    yTopLeft= [b+yDivisPoint b+yDivisPoint b+W b+W b+yDivisPoint];
    
    xTopRight= [a+xDivisPoint a+L a+L a+xDivisPoint a+xDivisPoint]; % top right corner
    yTopRight= [b+yDivisPoint b+yDivisPoint b+W b+W b+yDivisPoint];
    
    
    % fills the newly created boxes with a random color and draws a border
    fill(xBotLeft, yBotLeft, MyColor(round(1+rand*7),:)) % bottom left corner
    plot(xBotLeft, yBotLeft, 'k', 'Linewidth', bWidth)
    
    fill(xBotRight, yBotRight, MyColor(round(1+rand*7),:)) % bottom right corner
    plot(xBotRight, yBotRight, 'k', 'Linewidth', bWidth)
    
    fill(xTopLeft, yTopLeft, MyColor(round(1+rand*7),:)) % top left corner
    plot(xTopLeft, yTopLeft, 'k', 'Linewidth', bWidth)
    
    fill(xTopRight, yTopRight, MyColor(round(1+rand*7),:)) % top right corner
    plot(xTopRight, yTopRight, 'k', 'Linewidth', bWidth)
    
    % records corner coordinate and length and height of new boxes   
    block1= [a; b; xDivisPoint; yDivisPoint]; % bottom left
    block2= [a+xDivisPoint; b; L-xDivisPoint; yDivisPoint]; % bottom right
    block3= [a; b+yDivisPoint; xDivisPoint; W-yDivisPoint]; % top left
    block4= [a+xDivisPoint; b+yDivisPoint; L-xDivisPoint; W-yDivisPoint]; % top right
    allBlocks= [block1, block2, block3, block4]; % stores all info in an array
        
    % iterates through to access data for each subdivided block
    for k= 1:4
        aNew= allBlocks(1,k); % gets corner x coordinate
        bNew= allBlocks(2,k); % gets corner y coordinate
        xDivisPointNew= allBlocks(3,k); % gets new subdivision x coordinate
        yDivisPointNew= allBlocks(4,k); % gets new subdivision y coordinate
        RandomMondrian(aNew, bNew, xDivisPointNew, yDivisPointNew,... 
            level-1) % recursively calls the function with the new data
    end
end