#!/usr/bin/env python

import numpy as np
# https://github.com/pdfo/pdfo/blob/main/README_py.md
# pip install pdfo
from pdfo import pdfo

x, y = np.loadtxt('xy.csv', delimiter=',').T

def calc_sse(c_s, x, y):
    errors = y - (c_s[0] + x * c_s[1])
    return np.sum(errors ** 2)

start = [2.25, 0.47]

for method in ['UOBYQA', 'NEWUOA', 'BOBYQA', 'LINCOA', 'COBYLA']:
    print(f'\nPDFO minimization with {method}:')
    print(pdfo(calc_sse, start, args=(x, y), method=method))

# Try classical mode
print('\nPDFO Powell, classical mode')
print(pdfo(calc_sse, start, args=(x, y), options={'classical': True}))
