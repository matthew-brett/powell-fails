# Powell failure reproducer

```
python powell_fails.py
```

## Explanation

The take-home is that, for a simple least-squares problem, and ordinary-looking
data, for a particular starting value, `fmin_powell` stops on a not-minimum
value and claims success, where other optimizers do find the minimum, as does
the Octave implementation.

Here is the output from the reproducer:

```
LS inter: 2.114798570871842
LS slope: 0.5088641205763367
LS SSE error: 1.0674470960898728

BGFS minimization:
Optimization terminated successfully.
         Current function value: 1.067447
         Iterations: 3
         Function evaluations: 15
         Gradient evaluations: 5
[2.11480099 0.50886336]

Powell minimization:
Optimization terminated successfully.
         Current function value: 1.074363
         Iterations: 6
         Function evaluations: 152
[2.22069108 0.47457665]
```

As you can see, the Powell result has a higher sum of squared error, different
parameters, and claims success.  I get this for Scipy 1.10.1 on Mac M2, Intel,
and Ubuntu 22.04 amd64.
