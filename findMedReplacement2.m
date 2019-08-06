function mRGB = findMedReplacement2(im,x,y,r)

hsvDouble=rgb2hsv(im);
[nr,nc,np]=size(im);
h=[];
s=[];
v=[];
k=1;

for column=(x-(2*r)):(x+(2*r))
    for row=(y-(2*r)):(y+(2*r))
        if column<=nc && row<=nr && row>=1 && column>=1
            distance=sqrt((row-y)^2+(column-x)^2);
            if distance>=r && distance<=(2*r)
                h(k)=hsvDouble(row,column,1);
                s(k)=hsvDouble(row,column,2);
                v(k)=hsvDouble(row,column,3);
                k=k+1;
            end
        end
    end
end

hMed=median(h);
sMed=median(s);
vMed=median(v);

mHSV(1,1,1)=hMed;
mHSV(1,1,2)=sMed;
mHSV(1,1,3)=vMed;

rgbDouble=hsv2rgb(mHSV);
mRGB=uint8(255*rgbDouble);