%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%
% Author: Evan Blosser                                %
% Email: evan.a.blosser@ou.edu/galactikhan@gmail.com  %
% GitHub: Galactikhan                                 %
%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%
%%%%%%%%%%%%%
% Read ME!! %
%%%%%%%%%%%%%
% To run this ensure that the programs
% BisectionRoot.m & fun.m are present within 
% the current directory, and all 3 are saved 
% properly.
% 
% Then simply type in the copmmand line: (For class Project)
%  R = BisecAllRoots(@fun, -3, 6, 0.0001)
% were a = -3, b = 6, TolMax=0.0001, and the function call '@fun'
% is defined within the included programs.
%%%%%%%%%%%%%%%%%%%
% Define Function %
%%%%%%%%%%%%%%%%%%%
% This defines an output matrix R
% as dependant on Function (fun), 
% points a & b, and the Maximum 
% tolerance desired.
function R = BisecAllRoots(Fun,a,b,TolMax)
%%%%%%%%%%%%%%%%%
% Set the Clock %
%%%%%%%%%%%%%%%%%
SubI = 10;  % Sub-Interval
Clock = 1;  % While Loop Counter
is = 1;     % Matrix Position Counter
count = 0;  % Sub-Interval Counter
%%%%%%%%%%%%%
% Main/Sart %
%%%%%%%%%%%%%
% While loop will start calculating 
% the length h for any given points
% a & b; then add the length h through
% a for each i from 1 to 10. Note:
% h must start at zero (i-1) so that 
% both points a & b are not lost.
%%%%%%%%%%%%%%%%%%%%%%
while Clock==1       % -Start the Clock
    Clock = 0;       % -While 0 continue 
    h = (b - a)/SubI;% -h calculation
    count=count+1;   % -Add to Sub-Interval Counter
    if count==5.     %
        break        % This is a Tale of Captain Jack Sparrow!
    end              % That was weird, but this ends the loop 
    for i=1:SubI     %
    ai=a+h*(i-1);    % -Calculates the integers within the 
    bi=ai+h;         %   Sub-Interval.
%%%%%%%%%%%%%%%%%%%%%%
% Define a Subscript %
%%%%%%%%%%%%%%%%%%%%%%
% This allows the Function of a_i & b_i 
% to be called as Fai & Fbi respectivly.
    Fai = Fun(ai);
    Fbi = Fun(bi);
%%%%%%%%%%%%%%%%%%%%%%%%% 
% Sign change detection %
%%%%%%%%%%%%%%%%%%%%%%%%%
% This will check each integer in the new 
% Sub-Interval for a sign change, which 
% coralates to the two points being candidates 
% to find the solution to the root.
    if Fai*Fbi<0
%%%%%%%%%%%%%%%%%%%
% Call in back up %
%%%%%%%%%%%%%%%%%%%
% A sign change detection will call
% the root computation function, and
% send the points that set it off to
% the function for solution calculation.
        xs=BisectionRoot(Fun,ai,bi,TolMax);
%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%
% Populating Matrix R with Solutions %
%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%
% Set any root found by the function 'BisectionRoot'
% to the output matrix R. The Matrix Position Counter
% will increase the size of R with new given solutions
% top the function defined; thus the size of R is 
% dependant upon the total number of solutions.
%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%
        if SubI==10 & is==1             % -Start if statment
            R(is)=xs;                   % -Set new solution to R
            is=is+1;                    % -Add a new space in R
        else                            %
            nr=length(R);               % -Use length of R for Tol. check
            Sol_found=0;                % -Set solution found to false
            for Tc=1:nr                 % -Tol. Check Counter
                if abs(R(Tc)-xs)<TolMax % -Checking values in R with the 
                    Sol_found=1;        %   Maximum Tolerance; Designate
                end                     % -Solution found = Ture/1 End
            end                         %
            if Sol_found==0             % -Solution found = false/0 
                R(is)=xs;               %  conintue populationg R
                is=is+1;                %
                Clock=1;                % -End the while loop
            end       %%%%%%%%%%%%%%%%%%%
        end          %
    end             %
end                %
%%%%%%%%%%%%%%%%%%%%
% Sub-Sub-Interval %
%%%%%%%%%%%%%%%%%%%%
% Set a new Sub-Interval of 100, and since
% the old Sub-Interval was 10, simply mulitply
% by ten and update Sub-Interval
SubI = 10*SubI;
%%%%%%%%%%%%%%%%%%%%%%%%%%
% End / Nighty Night CPU %
%%%%%%%%%%%%%%%%%%%%%%%%%%
end                      %
%%%%%%%%%%%%%%%%%%%%%%%%%%
