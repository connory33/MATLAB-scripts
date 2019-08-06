function [x, y, r] = centroidCalculator(im, ux, uy)
% function returns the centroid coordinates and mean distance from the
% centroid of a set of points inputted via clicks by the user

% initializing all variables and vectors
hold on
count=1;
a=0;
b=0;
r=0;
xtotal=0;
ytotal=0;
xcoords=ux;
ycoords=uy;
distances=[];
tolerance=25; % how close click must be to first point to cancel selection
[nr,nc]=size(im);
plot(ux,uy,'m*') % plots first point

% loop running as long as user does not click too close to first point or
% outside of the image
while sqrt((ux-a)^2+(uy-b)^2)>tolerance && a>=0 && a<=nc && b>=0 && b<=nr 
    [a,b]=ginput(1); % sets coordinates of mouse input to a and b
    xcoords=[xcoords,a]; % stores each click coordinate to the corresponding vector
    ycoords=[ycoords,b];
    plot(xcoords(count+1),ycoords(count+1),'m*') % plots newly clicked point
    plot([xcoords(count) xcoords(count+1)],[ycoords(count)...
        ycoords(count+1)],'m') % plots line between new and last point
    count=count+1; % adds one to counter variable
end
xtotal=sum(xcoords); % sums up all coordinates of each vector
ytotal=sum(ycoords);
x=xtotal/count; % divides by number of coordinate values to give centroid coordinates
y=ytotal/count;

for k=1:length(xcoords) % iterates through lengths of coordinate vectors
    distCalc=sqrt((x-xcoords(k))^2+(y-ycoords(k))^2); % calculates distance
                                                      % between centroid
                                                      % and clicked point
    distances=[distances,distCalc]; % adds all distances to a vector
end

rAvg=distances/length(distances); % averages all the values in the distance vector
                               

for k=1:length(distances)
    r=r+rAvg(k); % adds up all the average distances to achieve total average
end
if count==1 % checking that if first click is outside image, initial point is
            % not used for average distance calculation
    r=0;
end
r=round(r); % rounding and designating output results
x=round(x);
y=round(y);




