function [x,y,r]=centroidCalculator1(im,ux,uy)
hold on
plot(ux,uy,'b*')
[nr,nc]=size(im);
[xn,yn]=ginput(1);
k=1;
xvec(k)=ux;
yvec(k)=uy;

while xn>=0 && xn<=nc && yn>=0 && yn<=nr %&& round(xn)~=round(ux)...
        %&& round(yn)~=round(uy)
    k=k+1;
    xvec(k)=xn;
    yvec(k)=yn;
    plot([xvec(k-1),xn],[yvec(k-1),yn],'b-')
    plot(xn,yn,'b*')
    [xn,yn]=ginput(1);
end

plot([xvec(k),ux],[yvec(k),uy],'b-')
avgXvec=xvec/length(xvec);
avgYvec=yvec/length(yvec);
x=0; y=0;

for i=1:length(xvec)
    x=x+avgXvec(i);
    y=y+avgYvec(i);
end

rvec=zeros(1,length(xvec));

for j=1:length(yvec)
    rvec(j)=sqrt((x-xvec(i))^2+(y-yvec(i))^2);
end

avgRvec=rvec/length(rvec);
r=0;

for n=1:length(rvec)
    r=r+avgRvec(n);
end

x=round(x);
y=round(y);
r=round(r);
    








