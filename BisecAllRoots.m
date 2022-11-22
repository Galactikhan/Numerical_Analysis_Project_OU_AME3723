function R = BisecAllRoots(Fun,a,b,TolMax)
n = 10;
c = 1; 
is = 1;
j = 0;
while c==1
    c = 0;
    h = (b - a)/n;
    j=j+1;
    if j==5.
        break
    end
    for i=1:n
    ai=a+h*(i-1);
    bi=ai+h;
    Fai = Fun(ai);
    Fbi = Fun(bi);   
%Sign change detection
    if Fai*Fbi<0
%Sign Change Detected, Call Root Computation Function
        xs=BisectionRoot(Fun,ai,bi,TolMax);
% Set the root to matrix R
        if n==10 & is==1
            R(is)=xs;
            is=is+1;
        else
            nr=length(R);
            e=0;
            for ka=1:nr
                if abs(R(ka)-xs)<TolMax
                    e=1;
                end
            end
            if e==0
% If root isn't known, add it to R
                R(is)=xs;
                is=is+1;
                c=1;
            end
        end
    end
end
n = 10*n;
end