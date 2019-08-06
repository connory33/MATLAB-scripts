function mRGB = findMedReplacement(im, x, y, r)
% function examines ring outside of selected blemish area and takes
% the median color from it to be used for blemish correction

hsvVals=rgb2hsv(im); % saves hsv values of converted image
[nr,nc]=size(im);
hueVals=[]; % initializing value vectors for hue, saturation, value
satVals=[];
valVals=[];
count=1;

for j=x-(2*r):x+(2*r) % iterating from left to right across box of twice the radius
    for k=y-(2*r):y+(2*r) % iterating vertically across the same box
        if j<=nc && k<=nr && k>=1 && j>=1 % checking if pixel is inside array
            distance=sqrt((x-j)^2+(y-k)^2);
            if distance>=r && distance<=(2*r) % checking if in correct ring
                hueVals(count)=hsvVals(k,j,1); % storing values to the proper
                                               % index in each vector
                satVals(count)=hsvVals(k,j,2);
                valVals(count)=hsvVals(k,j,3);
                count=count+1;
            end
        end
    end
end

hueMed=median(hueVals); % calculating medians of each value vector
satMed=median(satVals);
valMed=median(valVals);

mHSV(1,1,1)=hueMed; % assigning hsv values to 1x1x3 array
mHSV(1,1,2)=satMed;
mHSV(1,1,3)=valMed;

rgbVals=hsv2rgb(mHSV); % converting back to rgb
mRGB=uint8(255*rgbVals); % scaling back to 0-255 range

