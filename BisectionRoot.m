%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%
% Author: Evan Blosser                                %
% Email: evan.a.blosser@ou.edu/galactikhan@gmail.com  %
% GitHub: Galactikhan                                 %
%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%
%%%%%%%%%%%%%
% Read ME!! %
%%%%%%%%%%%%%
% This is a package/function made to run with
% BisecAllRoots.m and fun.m
% 
% 
%%%%%%%%%%%%%%%%%%%
% Define Function %
%%%%%%%%%%%%%%%%%%%
% This defines a final solution/root
% of the function Xs, with respect to:
% the function (fun), points a & b, and 
% the Maximum tolerance desired.
function Xs= BisectionRoot(Fun,a,b,TolMax)
%%%%%%%%%%%%%%%%%%%%%%%
% Set Iteration limit %
%%%%%%%%%%%%%%%%%%%%%%%
% 20 seems about right, but can be
% increased for moer difficult equations.
imax=20;
%%%%%%%%%%%%%%%%%%%%%%
% Define a Subscript %
%%%%%%%%%%%%%%%%%%%%%%
% This allows the Function of a & b 
% to be called as Fa & Fb respectivly.
Fa= Fun(a);
Fb= Fun(b);
%%%%%%%%%%%%%%%%%%
% Idiot Proofing %
%%%%%%%%%%%%%%%%%%
% Double checks that these values sent from
% BisecAllRoots.m did in fact trigger sign 
% change detection
if Fa*Fb>0
disp('Error: the function has the same sign at point a and b\n');
%%%%%%%%%%%%%%%%%%%%%%%%%
% Main/Bisection Method %
%%%%%%%%%%%%%%%%%%%%%%%%%
% This is pretty much verbatim
% from our class walkthrough on
% the Bisection Method
%%%%%%%%%%%%%%%%%%%%%%
else                 % -If Idiot Proofing isn't
for i=1:imax         %   triggered, then proceed
xNS = (a+b)/2;       %   with the given values.
toli = (b-a)/2;      %
FxNS = Fun(xNS);     %
if FxNS == 0         %
Xs=xNS;              %
break                %
else                 %
if toli < TolMax     %
break                %
elseif Fun(a)*FxNS <0%
          b = xNS;  %
else               %
          a = xNS;%
end              %
end             %
end            %
Xs=xNS;       %
if i == imax  %%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%
    fprintf('Solution was not obtained in %i iterations', imax) %
    Xs=xNS;  %%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%
end         %
end        %
end       %
