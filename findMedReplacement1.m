function mRGB = findMedReplacement1(im, x, y, r)

smallx= x-2*r; largex= x+2*r; smally= y+2*r; largey= y-2*r; 

d= zeros(1,1,3); a=1; 

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
        if sqrt((x-i)^2 + (y-j)^2)>= r && sqrt((x-i)^2 + (y-j)^2)<=2*r...
            && i<= size(im,2) && j<=size(im,1) && i>=0 && j>=0         

            d(:,a, :)= rgb2hsv(im(i,j,:)); 

            a=a+1; 
        end
    end
end

mRGB= uint8(median(255*hsv2rgb(d))); 