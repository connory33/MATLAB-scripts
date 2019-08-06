function imNew = blemishCorrector1(im, x, y, r)
imNew= im; 

smallx= x-2*r; largex= x+2*r; smally= y+2*r; largey= y-2*r;

mRGB = findMedReplacement1(im, x, y, r); 

 

if smallx <1 
    smallx= 1; 
elseif largex> size(im,2)
    largex= size(im,2);
end

if smally<1
    smally=1; 
elseif largey>size(im, 1)
    largey= 1; 
end

for i= smallx:largex
    for j= largey:smally
        if sqrt((x-i)^2 + (y-j)^2)<= r...
                && i<= size(im,2) && j<=size(im,1) && i>=0 && j>=0

            imNew(i,j,:)= mRGB;
        end
    end
end
