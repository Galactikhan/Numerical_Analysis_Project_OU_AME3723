%%%%%%%%%%%%%%%%%%%%%%%
% Set output Vector R %
%%%%%%%%%%%%%%%%%%%%%%%
% This sets R, as a vector containing the desired 
% roots of the given: function, points a & b, and 
% the Maximum Tolerance.
R=BisecAllRoots(fun,a,b,TolMax)
%
%
Fa=F(a);Fb=F(b);
%
%
% Iterations
imax=20;
tol=0.0001;

%%%%%%%%%%%%%%%%%%%%%
% Main Calculations %
%%%%%%%%%%%%%%%%%%%%%
%
% h1 is the first sub interval
h1 = abs((b-a)/10);
#
#

if Fa*Fb >0
     disp('Error')
else
    disp('iteration       a     b       (xNs)Solution  f(xNs)    Tolerance')
    for i=1:imax
    
        xNS=(a+b)/2;
        toli=(b-a)/2;
        
        FxNS=F(xNS);
        
        
        fprintf('%5i %11.6f %11.6f %11.6f %11.6f %11.6f\n',i,a,b,xNS,FxNS,toli);
        if toli<tol
            break
         %%% Sign check %%%
         
        end
        if F(a)*FxNS<0
              b=xNS;
        else
            a=xNS;
        end
    end
end
