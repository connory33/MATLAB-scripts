function multipleBlemishes(imfile)
% function shows a called image and allows you to select regions to be
% replaced by the surrounding colors, then saves the fixed file as
% blemishfixed.jpeg

im=imread(imfile); % reads, shows, and renames image file
imshow(im);
imNew=im;
% displays instructions to user
title('Click outside the image to quit or click around blemishes to fix them')
[nr,nc,np]=size(im);
hold on
[a,b]=ginput(1); % stores first mouse click input

while a>=0 && a<=nc && b>=0 && b<=nr % checking that click is inside image
    [x,y,r]=centroidCalculator(imNew,a,b); % calls function to determine
                                           % centroid coordinates and
                                           % radius
    imNew=blemishCorrector(imNew,x,y,r); % calls function to replace blemish
                                         % area with correct color
    imshow(imNew); % shows image for each click
    imwrite(imNew,'blemishfixed.jpeg'); % saves fixed image
    title('Select another blemish or end by clicking outside the window')
    [a,b]=ginput(1); % stores mouse click input
end

hold off
imshow('blemishfixed.jpeg'); % shows final fixed image