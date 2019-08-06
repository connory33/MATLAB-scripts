function nPeople = shiftNorth()

[initialLat,~]=popCenter;
[newLat,~]=popCenter;
movedPop=0;
southZipPop=22336;
northZipPop=63886;
A=dataInCellArray;

while abs(newLat-initialLat)<.01
    %southZipPop=southZipPop-100;
    %northZipPop=northZipPop+100;
    A{6647,2}=A{6647,2}-100;
    A{1508,2}=A{1508,2}+100;
    [newLat,~]=popCenter;
    movedPop=movedPop+100;
    disp(abs(newLat-initialLat))
    
end

nPeople=movedPop;
