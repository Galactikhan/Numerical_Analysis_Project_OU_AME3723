F=@(x) 8-4.5*(x-sin(x));
a=2;b=3;imax=20;tol=0.0001;
Fa=F(a);Fb=F(b);
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
        end
        if F(a)*FxNS<0
              b=xNS;
        else
            a=xNS;
        end
    end
end