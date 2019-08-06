function multipleBlemishes2(imfile)

im=imread(imfile);
imshow(im);
imNew=im;
title('Click outside the image to exit or click inside to remove blemishes')
[nr,nc,np]=size(im);
hold on
[ux,uy]=ginput(1);

while ux>=0 && ux<=nc && uy>=0 && uy<=nr
    [x,y,r]=centroidCalculator(imNew,ux,uy);
    imNew=blemishCorrector(imNew,x,y,r);
    imshow(imNew);
    imwrite(imNew,'blemishfixed.jpeg');
    title('Click another blemish to continue or click outside the image to end the program')
    [ux,uy]=ginput(1);
end
hold off
imshow('blemishfixed.jpeg');