function m = BisecAllRoots(f, a, b, TolMax)

disp('Bisection Method');

% Evaluate both ends of the interval

y1 = feval(f, a);

y2 = feval(f, b);

i = 0;

% Display error and finish if signs are not different

if y1 * y2 > 0

disp('Have not found a change in sign. Will not continue...');

m = 'Error'

return

end

% Work with the limits modifying them until you find

% a function close enough to zero.

disp('Iter a b x0');

while (abs(b - a) >= TolMax)

i = i + 1;

% Find a new value to be tested as a root

m = (b + a)/2;

y3 = feval(f, m);

if y3 == 0

fprintf('Root at x = %f \n\n', m);

return

end

fprintf('%2i \t %f \t %f \t %f \n', i-1, a, b, m);

% Update the limits

if y1 * y3 > 0

a = m;

y1 = y3;

else

b = m;

end

end

% Show the last approximation considering the tolerance

w = feval(f, m);

fprintf('\n x = %f produces f(x) = %f \n %i iterations\n', m, y3, i-1);

fprintf(' Approximation with tolerance = %f \n',TolMax);