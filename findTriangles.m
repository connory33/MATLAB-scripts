% finds right triangles with given perimeter

p= 1; leg1= 1; leg2= 1; combos=0; % initiating variables (perimeter, legs, combo possibilities)
while p>=1000 || p<=3 || rem(p,1)~=0 % repeats until chosen perimeter meets given conditions
    p= input('Enter an integer greater than 3 and less than 1000: ');
end

for leg1= 1:p % counts through all possible integers for leg 1
    for leg2= 1:p % counts through all possible integers for leg 2
        hyp= sqrt(leg1^2+leg2^2); % calculating hypotenuse
        if leg1+leg2+hyp==p && rem(hyp,1)==0 % checking if legs add to perimeter 
                                             % and if calculated hypotenuse
                                             % is whole number
           fprintf('{%.0f,%.0f,%.0f}\n',leg1,leg2,hyp); % prints length list
           combos=combos+1; % tracks number of possible combinations
        end
    end
end

fprintf('Found %.0f right triangles with integral sides and perimeter %.0f\n',combos,p);
% prints number of combos
