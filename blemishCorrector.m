function imNew = blemishCorrector(im, x, y, r)
% function replaces selected area of blemish with the correctly colored
% pixels from the surrounding area

imNew=im; % renames inputed image-representing array
medColor=findMedReplacement(im,x,y,r); % calls function to learn correct color
                                       % to replace blemish with
[nr,nc]=size(im);

for j=(x-r):(x+r) % iterates in a box from left edge toward right edge of circle
    for k=(y-r):(y+r) % iterates from bottom to top of previous box
        if j<=nc && j>=1 && k<=nr && k>=1 % checking that pixel is inside array
            distance=sqrt((x-j)^2+(y-k)^2);
            if distance<=r % checking that pixel is inside selected circle
                imNew(j,k,:)=medColor; % replaces correct pixels with correct color
            end
        end
    end
end
