%% Project 5 answers
% This script file calls your functions in order to compute the requested
% answers.  The displaying of results may be done in this script or in your
% functions.

%% Use CELL ARRAY to house the census data

% 1. Read data and print the number of zipcodes include in the cell array
fprintf('\n1. Read data from file and store in cell array\n')
A= dataInCellArray();
nZips= size(A,1);
fprintf('There are %d non-00 zipcodes\n', nZips) 


% 2. Calculate centroid of population, print the latitude and longitude
% (degrees) to the Command Window, and show the location on a map.
[b,c]=popCenter();
fprintf('\n2. Centroid of US population (2010) is at %f degrees N and %f degrees W\n',b,c)
% ---- Add your code here ----

url= sprintf('http://www.findlatitudeandlongitude.com/?lat=%f&lon=%f', b, c);
status= web(url, '-browser');



% 3. To shift the centroid north by 0.01 degree, how many people need to 
% move from Brunswick, Georgia (31520) to Ithaca, NY (14850)?  Display the
% order of magnitude of the people to be moved, e.g., 10, 100, 1000, or ... 
fprintf('\n3. Can we shift the centroid .01 degree north by moving people')
fprintf(' from 31520 to 14850?\n')
fromZip= '31520';
toZip=   '14850';
degree= .01;
% ---- Add your code here ----


% 4. Calculate and display two population densities for Rhode Island:  
% capital region and non-capital regions.  Compute and display another 
% Rhode Island statistic of your choice.
fprintf('\n4. Explore Rhode Island ...\n')
% ---- Add your code here ----
[capitalDensity, nonCapitalDensity, totalDensity]= rhodeIsland();
fprintf('Capital region population density: %.f people per square km', capitalDensity)
fprintf('Non-capital region population density: %.f people per square km', nonCapitalDensity)
fprintf('Population density for whole state: %.f people per square km', totalDensity)

%% Use STRUCT ARRAY to house the census data

% Read data from file and store in struct array
% ---- UNCOMMENT the nex three statements -------
% ---- after you implement dataInStructArray ----
% S = dataInStructArray();
% nS= length(S);  % Value should be the same as nZips from (1)
% fprintf('\nNow using struct array.  There are %d non-00 zipcodes\n', nS) 

% 5. Calculate and display the ratio of water area to land area for Utah and
% Arizona.  Arizona zipcodes begin with '85' and '86'; Utah zipcodes begin 
% with '84'.
fprintf('\n5. What are the ratios of water area to land area')
fprintf(' for Utah and Arizona?\n') 
% ---- Add your code here ----
