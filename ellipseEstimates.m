% introducing program function
fprintf([' An ellipse with semiaxes a and b is specified by a known equation. If a\n ',... 
   'does not equal b, then the perimeter of the ellipse must be calculated\n ',...
   'via approximation. This program will give you a range of approximations\n ',...
   'based on your chosen values of a and b.\n\n']);

% asking user for inputs
hAxis= input('Enter your value for the horizontal semiaxis (a): '); % horizontal axis 'a'
vAxis= input('Enter your value for the vertical semiaxis (b): ');   %vertical axis 'b'

% defining perimeter and h formulas
peri1= pi*(hAxis+vAxis);
peri2= pi*sqrt(2*(hAxis^2+vAxis^2));
peri3= pi*sqrt(2*(hAxis^2+vAxis^2)-((hAxis-vAxis)^2)/2);
h=((hAxis-vAxis)/(hAxis+vAxis))^2;
peri4= pi*(hAxis+vAxis)*(1+(h/8))^2;
peri5= pi*(hAxis+vAxis)*(1+((3*h)/(10+sqrt(4-3*h))));
peri6= pi*(hAxis+vAxis)*((64-3*h^2)/(64-16*h));
peri7= pi*(hAxis+vAxis)*((256-48*h-21*h^2)/(256-112*h+3*h^2));
peri8= pi*(hAxis+vAxis)*((3-sqrt(1-h))/2);

% returning results
fprintf('The range of perimeter approximations are:\n')
fprintf('    Approx. 1: %10.3f\n', peri1');
fprintf('    Approx. 2: %10.3f\n', peri2');
fprintf('    Approx. 3: %10.3f\n', peri3');
fprintf('    Approx. 4: %10.3f\n', peri4');
fprintf('    Approx. 5: %10.3f\n', peri5');
fprintf('    Approx. 6: %10.3f\n', peri6');
fprintf('    Approx. 7: %10.3f\n', peri7');
fprintf('    Approx. 8: %10.3f\n', peri8');
fprintf('The h value, which represents the departure from circlehood, is equal to: %.2f\n', h);

% done