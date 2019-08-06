classdef  LocalWeather < handle
% Weather data (monthly low, high, and precip) for a city from a standard
% city weather data file.
   
    properties
        city= '';  % City name string
        temps= Interval.empty();
                % array of 12 Intervals, each (monthly low, monthly high)
        precip  % numeric vector of length 12, each monthly precipitation
    end
    
    methods
        function lw = LocalWeather(fname)
            if nargin==1
                fid= fopen(fname, 'r');
                % Get city name
                s= fgetl(fid);
                lw.city= s(3:length(s));
                % Read pass headers lines (next 3 lines)
                for k=1:3
                    s= fgetl(fid);
                end
                % Read monthly data (next 12 lines)
                for k= 1:12
                    s= fgetl(fid);
                    lw.temps(k)= Interval(str2double(s(4:8)), ...
                                          str2double(s(12:16)));
                    lw.precip(k)= str2double(s(20:24));                
                end
                fclose(fid);
            end
        end
        
        function showMonthData(self, m)
        % Show data for month m.  m is an integer and 1<=m<=12.
            mo= {'Jan','Feb','Mar','Apr','May','June',...
                 'July','Aug','Sep','Oct','Nov','Dec'};
            fprintf('%s Data\n', mo{m})
            fprintf('Temperature range: ')
            disp(self.temps(m))
            fprintf('Average precipitation: %.2f\n', self.precip(m))
        end
        
        function p = getAnnualPrecip(self)
        % If any month is missing precip data, display a warning message
        % and p is NaN.  Otherwise p is annual precipitation.
            p=0;
            for m=1:12
                p=p + self.precip(m);
                if isnan(self.precip(m))==1
                    disp('One of the months is missing precip data')
                end
            end
        end
        
        function tempVec = getMonthlyAveTemps(self)
        % tempVec is length 12 vector of monthly average temperatures.
        % tempVec(m) is average between month m's high and low temps.
        % If a month is missing either high or low temp (NaN), then that
        % month's average is also NaN.
            tempVec= zeros(1,12);
            for m=1:12
                tempVec(m)= (self.temps(m).right + self.temps(m).left)/2;
            end
        end
        
        function showCityName(self)
            disp(self.city)
        end
        
    end %methods
    
end %classdef