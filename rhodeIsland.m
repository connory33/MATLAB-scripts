function [capitalDensity, nonCapitalDensity, totalDensity]= rhodeIsland()

A= dataInCellArray();
fid= fopen('populationByZipcode.txt', 'r');
k= 1;
capitalPop= 0;
capitalArea= 0;
nonCapitalPop= 0;
nonCapitalArea= 0;
totalPop= 0;
totalArea= 0;

while~feof(fid)
    s=fgetl(fid);
    if strcmp(s(1),'0')== 1 && strcmp(s(2),'2')== 1 && strcmp(s(3),'9')== 1
       capitalPop= capitalPop + A{k,2};
       capitalArea= (capitalArea + A{k,4})/(10^6);
       totalPop= totalPop + A{k,2};
       totalArea= (totalArea + A{k,4})/(10^6);
       
    elseif strcmp(s(1),'0')== 1 && strcmp(s(2),'2')== 1 && strcmp(s(3),'8')== 1
       nonCapitalPop= nonCapitalPop + A{k,2};
       nonCapitalArea= (nonCapitalArea + A{k,4})/(10^6);
       totalPop= totalPop + A{k,2};
       totalArea= (totalArea + A{k,4})/(10^6);
        
    end
    k=k+1;
end

capitalDensity= capitalPop/capitalArea;
nonCapitalDensity= nonCapitalPop/nonCapitalArea;
totalDensity= totalPop/totalArea;
disp(totalPop)
disp(totalArea)
