function Xs= BisectionRoot(Fun,a,b,TolMax)

imax=20;
Fa= Fun(a);
Fb= Fun(b);
if Fa*Fb>0
disp('Error: the function has the same sign at point a and b\n');
else
for i=1:imax
xNS = (a+b)/2;
toli = (b-a)/2;
FxNS = Fun(xNS);
if FxNS == 0
fprintf('An exact solution x = %11.6f was found', xNS)
Xs=xNS;
break
else
if toli < TolMax
break
   
elseif Fun(a)*FxNS <0
          b = xNS;
else
          a = xNS;
end
end
end
Xs=xNS;
if i == imax
    fprintf('Solution was not obtained in %i iterations', imax)
    Xs=xNS;
end
end
end