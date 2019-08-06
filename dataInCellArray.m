function [A]=dataInCellArray()
A={};
fid=fopen('populationByZipcode.txt', 'r');
r=0;
while~feof(fid)
    s=fgetl(fid);
    if(strcmp(s(1),'0')~= 1 && strcmp(s(2),'0')~= 1)
        r=r+1;
        A{r,1}= s(1:5);
        A{r,2}= str2double(s(7:16));
        A{r,3}= str2double(s(18:27));
        A{r,4}= str2double(s(29:40));
        A{r,5}= str2double(s(42:53));
        A{r,6}= str2double(s(77:88));
        A{r,7}= str2double(s(90:101));
    end
end
fclose(fid);
end
