% 4-bar linkage simulation with animation
% The crank is the shortest bar--the crank-rocker condition
%
%             coupler 
%         P2----------P3
%  crank /            / rocker
%       P1-----------P4
%            frame

% Bar lengths
lenFrame = 6;     % p
lenCrank = 5;      % q
lenCoupler = 10;   % r
lenRocker = 9;     % s

if lenFrame<=0 || lenCrank<=0 || lenCoupler<=0 || lenRocker<=0
    error('All bar lengths must be positive.')
end
if lenFrame<=lenCrank || lenCoupler<=lenCrank || lenRocker<=lenCrank
    error('The crank must be the shortest bar.')
end

% Pin positions
P1_x = 0; 
P1_y = 0;
P4_x = lenFrame;
P4_y = 0;

% Set up figure window
close all         % Close all previous figure windows
figure            % Start a new figure window
hold on           % Keep the same set of axes (multiple plots on same axes)
axis([-5 15 -10 10]) % x-axis limits [0,10], y-axis limits [0,10]

%%% Do not change the code above %%%
%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%
%%% Modify the code below %%%%%%%%%%


% Simulate 4-bar system where rocker angle changes from 0 to 360 degrees

for theta = deg2rad(0:1:360) %Theta increases by 1 degree from 0 to 360
    
plot(P1_x, P1_y, 'ko') 
plot(P4_x, P4_y, 'ko')       
plot([P1_x P4_x],[P1_y P4_y],'r') %lines 44-46 plot unmoving points (P1,P4)
                                  %and line between them

d= sqrt(lenCrank^2 + lenFrame^2 - lenFrame*lenCrank*2*cos(theta));
                                                    %calculates d
a= asin((lenCrank*sin(theta))/d);           % calculates unknown value a
b= acos((d^2 + lenRocker^2 - lenCoupler^2)/(2*d*lenRocker)); %calculate b
gamma= pi - a - b; %calculate gamma

P2_x= P1_x + 5*cos(theta);
P2_y= P1_y + 5*sin(theta); % finds point P2
P3_x= P4_x + 9*cos(gamma);
P3_y= P4_y + 9*sin(gamma); % finds point P3
plot (P2_x, P2_y, 'ko') 
plot (P3_x, P3_y, 'ko') % plots P2 and P3

plot([P1_x P2_x],[P1_y P2_y],'b')  % Plots lines between points  
plot([P2_x P3_x],[P2_y P3_y],'g')  
plot([P3_x P4_x],[P3_y P4_y],'y')

pause(.00001)  %allows animation with tiny pause

cla
axis([-5 15 -10 10])

end 

hold off