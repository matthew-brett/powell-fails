% Octave reproducer.
% https://octave.sourceforge.io/optim/package_doc/powell.html
%
% pkg install -forge statistics struct optim
pkg load optim

in_data = csvread('xy.csv')
x = in_data(:, 1)
y = in_data(:, 2)

function res = calc_sse(c_s, x, y)
    errors = y - (c_s(1) + c_s(2) * x);
    res = sum(errors .^ 2);
end

start = [2.25, 0.47];

% Parameters for equivalence with default fmin_powell values.
o = optimset('MaxIter', length(x) * 1000, 'TolFun', 0.0001, 'TolX', 0.0001);

[x_optim, y_min, conv, iters, nevs] = powell(@(c_s) calc_sse(c_s, x, y), start, o)
