function imNew = blemishCorrector2(im,x,y,r)

imNew=im;
mRGB=findMedReplacement2(im,x,y,r);

[nr,nc,np]=size(im);
for column=(x-r):(x+r)
    for row=(y-r):(y+r)
        if column<=nc && row<=nr && column>=1 && row>=1
            distance=sqrt((column-x)^2+(row-y)^2);
            if distance<=r
                imNew(row,column,:)=mRGB;
            end
        end
    end
end