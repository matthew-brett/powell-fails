% Octave reproducer.
% pkg install -forge statistics struct optim
pkg load optim

in_data = [[3.16275414, 3.79136358],
    [3.06332232, 3.56686702],
    [2.71045949, 3.65764056],
    [3.31620986, 3.9009491 ],
    [3.0538026 , 3.77374607],
    [2.65205418, 3.46548462],
    [3.37982853, 3.87501873],
    [3.17203268, 3.6633317 ],
    [3.05775755, 3.75619677],
    [2.91007762, 3.43503791],
    [3.11535693, 3.69096722],
    [3.39581938, 3.74696218],
    [3.13272406, 3.42290705],
    [2.78470603, 3.53131451],
    [3.27740626, 3.84695112],
    [2.85441284, 3.56755741],
    [2.78566755, 3.38201978],
    [3.24804465, 3.70167436],
    [3.43091588, 3.75821148],
    [3.54227291, 3.81811405],
    [3.13807594, 3.67988712],
    [3.46801239, 3.89121322],
    [3.34413811, 3.81356879],
    [2.88571352, 3.389147  ],
    [3.46944009, 4.04670213],
    [3.24443329, 3.66727863],
    [3.19430041, 3.62833333],
    [3.33884561, 3.69026204],
    [3.14456693, 3.618733  ],
    [2.86876214, 3.72446602],
    [3.10657774, 3.75643054],
    [3.58450835, 3.85183673],
    [3.24242311, 3.80806151],
    [2.69351248, 3.39682342],
    [3.08693798, 3.69868217],
    [3.21788634, 3.76964108],
    [3.83225025, 4.05771948],
    [3.12537788, 3.82863089],
    [3.20272503, 3.49631319],
    [3.06877493, 3.71745014],
    [2.67606864, 3.61357254],
    [3.1096587 , 3.62928328],
    [3.34974315, 3.92875   ],
    [3.26829268, 3.80015679],
    [3.38762994, 3.55692308],
    [3.32415556, 3.77868889],
    [3.27641221, 3.646743  ],
    [3.18084615, 3.95869231],
    [3.42302139, 3.9386631 ],
    [3.67470085, 4.11934473],
    [3.31432177, 3.80624606],
    [3.19971609, 3.59706625],
    [2.97818182, 3.603367  ],
    [2.97725424, 3.64698305],
    [3.47149813, 3.71947566],
    [2.82501901, 3.4169962 ],
    [3.17886555, 3.75096639],
    [2.88793991, 3.57669528],
    [3.32315789, 3.99167464],
    [3.36554404, 3.96227979],
    [2.83045455, 3.48659091],
    [3.60608187, 3.97976608],
    [3.00285714, 3.69065476],
    [3.26709877, 3.86067901],
    [3.88263514, 4.1775    ],
    [3.2752381 , 3.9162585 ],
    [3.40239726, 3.82006849],
    [3.54143939, 3.98871212],
    [3.46833333, 3.8315    ],
    [2.96941667, 3.68858333],
    [2.86350427, 3.95418803],
    [3.10672727, 3.65509091],
    [3.30963636, 3.79818182],
    [2.79913462, 3.48932692],
    [3.10911765, 3.92911765]]
x = in_data(:, 1)
y = in_data(:, 2)

function res = calc_sse(c_s, x, y)
    predicted = c_s(1) + c_s(2) * x;
    errors = y - predicted;
    res = sum(errors .^ 2);
end

start = [2.25, 0.47];

o = optimset('MaxIter', 100, 'TolFun', 1E-10);
[x_optim, y_min, conv, iters, nevs] = powell(@(c_s) calc_sse(c_s, x, y), start, o)
