function [latbar, longbar]= popCenter()

A= dataInCellArray();
fid=fopen('populationByZipcode.txt', 'r'); % not sure if im supposed to use this, what else coul
                                           %d the while loop guard be
xCartesian= 0;
yCartesian= 0;
zCartesian= 0;
pop=0;
k=1;
lat=0;
long=0;

xBar=0;
yBar=0;
zBar=0;

while ~feof(fid)
    s=fgetl(fid);
    if(strcmp(s(1),'0')~= 1 && strcmp(s(2),'0')~= 1)
        lat= (A{k,6})*pi/180;
        long= (A{k,7})*pi/180;
        xCartesian= xCartesian + A{k,2}*cos(lat)*cos(long);
        yCartesian= yCartesian + A{k,2}*cos(lat)*sin(long);
        zCartesian= zCartesian + A{k,2}*sin(lat);
        pop= pop + A{k,2};
        k=k+1;
    end
end

xBar= xCartesian/pop;
yBar= yCartesian/pop;
zBar= zCartesian/pop;

r= sqrt(xBar^2 + yBar^2 + zBar^2);
sphericalX= xBar/r;
sphericalY= yBar/r;
sphericalZ= zBar/r;
centLatRad= asin(sphericalZ);
centLongRad= atan2(sphericalY, sphericalX);
latbar=  centLatRad*180/pi;
longbar= centLongRad*180/pi;