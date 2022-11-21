%%%%%%%%%%%%%%%%%%%
% Define Function %
%%%%%%%%%%%%%%%%%%%
% R will be the output, and is a matrix composed
% of the function, points a & b, and maximum tolerance.
function R = BisecAllRoots(fun, a, b, TolMax)
%
%
% Set Sub-Interval
SubI1 = 10;
h1 = abs((b-a)/SubI1);
%
RSub1 = zeros(1;SubI1)
%
for i = 1:(SubI1/2);
    RSub1(i) = a + h;
   for i = (SubI1/2):SubI1;
       RSub1(i) = b - h;       
   end
end
for j = 1:SubI1-1;
    
if F(RSub1(j))*F(j+1) < 0 
    disp(' Sign change detected in Sub-Interval ');
    
