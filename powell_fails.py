#!/usr/bin/env python

import numpy as np
import scipy.optimize as spo
import scipy.stats as sps

x, y = np.loadtxt('xy.csv', delimiter=',').T

def calc_sse(c_s, x, y):
    errors = y - (c_s[0] + x * c_s[1])
    return np.sum(errors ** 2)

ls_res = sps.linregress(x, y)
print(f'LS inter: {ls_res.intercept}')
print(f'LS slope: {ls_res.slope}')
ls_sse = calc_sse((ls_res.intercept, ls_res.slope), x, y)
print(f'LS SSE error: {ls_sse}')

start = [2.25, 0.47]

print('\nBGFS minimization:')
print(spo.fmin_bfgs(calc_sse, start, args=(x, y)))

print('\nPowell minimization:')
print(spo.fmin_powell(calc_sse, start, args=(x, y)))
