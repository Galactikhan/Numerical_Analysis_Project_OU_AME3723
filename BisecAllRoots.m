%%%%%%%%%%%%%%%%%%%%%%%
% Set output Vector R %
%%%%%%%%%%%%%%%%%%%%%%%
% This sets R, as a vector containing the desired 
% roots of the given: function, points a & b, and 
% the Maximum Tolerance.
function R = BisecAllRoots(fun, a, b, TolMax)
%
%%%%%%%%%%%%%%%%%%%%%
% Main Calculations %
%%%%%%%%%%%%%%%%%%%%%
% This sets h1 is the first Sub-Interval.
SubI1 = 10;
h1 = abs((b-a)/SubI1);
%
%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%
% Setup Sub-Interval Matrix Size %
%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%
% This is for the first Sub-Interval
% matrix.
RSub1 = zeros(1;SubI1)
%
%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%
% Populating Sub-Interval Matrix %
%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%
% This fills the Sub-Interval Matrix with 
% integers from point a to point b using 
% h as length.
for i = 0:(SubI1/2);
    RSub1(i) = a + sum(h(i));
   for i = (SubI1/2):SubI1;
       RSub1(i) = b - sum(h(i));       
   end
end
%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%
% Sign Check in Sub-Interval %
%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%
% This multiplies each point within
% the Sub-Interval and checks for a 
% negative sign.
for j = 1:SubI1-1;   
if F(RSub1(j))*F(j+1) < 0 
    disp(' Sign change detected in Sub-Interval ');
