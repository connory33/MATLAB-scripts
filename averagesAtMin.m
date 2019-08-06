function [rAve, cAve] = averagesAtMin(M)
% Let r and c be the row and column indices of the minimum value in uint8 matrix M.
% rAve is the mean of the values in row r of matrix M.
% cAve is the mean of the values in column c of matrix M.
% rAve and cAve should be uint8 scalars (round as appropriate).

minSoFar=M(1,1);
sumRow=0;
sumColumn=0;

[nr,nc]=size(M);
for r=1:nr
    for c=1:nc
        if M(r,c)<minSoFar
           minSoFar=M(r,c);
           minRow=r;
           minColumn=c;
        end
    end
end

for k=1:nc
    sumRow=sumRow+M(minRow,k);
    rAve=sumRow/k;
end
for k=1:nr
    sumColumn=sumColumn+M(k,minColumn);
    cAve=sumColumn/k;
end

            


    


    