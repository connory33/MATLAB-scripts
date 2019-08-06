function [xvec, yvec]= fourBarCRPin(lenFrame,lenCrank,lenCoupler,lenRocker)
% Compute the path made by the Coupler-Rocker (CR) pin of a 4-bar linkage.
% Assume that the crank is the shortest bar--the crank-rocker condition.
% lenFrame, lenCrank, lenCoupler, lenRocker are the lengths of the length
%   of the frame, crank, coupler, and rocker, respectively.
% xvec and yvec are each a vector of length 360 and (xvec(k),yvec(k)) is
%   the position of the CR pin when the crank angle is k degrees from the
%   frame.
%           coupler
%        P2----------P3
% crank /            / rocker
%      P1-----------P4
%           frame
% Assume pin P1 is at position (0,0)

% initializing vectors
xvec=[];
yvec=[];

hold on           % keeps same set of axes while plotting

for i=1:360 % angle changing from 0-360 degrees
    theta = i * pi / 180; % changing theta from angles to radians
    d = sqrt(lenFrame^2 + lenCrank^2 - 2 * lenFrame * lenCrank * cos(theta)); % solving for d
    alpha = asin(sin(theta) * lenCrank / d); % solving for alpha
    beta = acos( (d^2 + lenRocker^2 - lenCoupler^2 ) / (2 * d * lenRocker) ); % solving for beta 

    % coordinates of CR (P3) pin
    xvec(i) = lenFrame - lenRocker * cos(alpha+beta); % storing coordinate values
    yvec(i) = lenRocker * sin(alpha+beta);            % for each angle in
                                                      % xvec and yvec
    
end  

plot(xvec,yvec) % plots vectors

hold off