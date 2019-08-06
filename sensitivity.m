close all   % close all figure windows
figure      % start a new figure

%%%% sensitivity to frame length %%%%

subplot(2,1,1) % top subplot in the figure window
hold all
                 
for i = 6:2:14 % frame lengths from 6 to 14 by 2
    fourBarCRPin(i,5,10,9); % running trajectory plotting function 
                            % for the varying frame lengths
end
legend('Length 6','Length 8','Length 10','Length 12','Length 14') % naming and showing
legend('show')                                                    % data titles
title('CR Trajectory with Varying Frame Lengths') % plot title
hold off % needed before rocker sensitivity


%%%% sensitivity to rocker length %%%%

subplot(2,1,2) % bottom subplot in the figure window
hold all

for i = 6:2:14 % rocker lengths 6-14 by 2
    fourBarCRPin(10,5,10,i); % trajectory plotting function for varying rockers
end
legend('Length 6','Length 8','Length 10','Length 12','Length 14') % naming and showing
legend('show')                                                    % data titles
title('CR Trajectory with Varying Rocker Lengths') % plot title
