import operator

from functools import reduce
from math import *

import pandas as pd


def prod(x):
    return reduce(operator.mul, x, 1)


def seq(a, b):
    return range(a, b + 1)


def a(r, n):
    return (r ** n) / factorial(n)


def N(r, epsilon):
    cr = ceil(r)
    assert cr > r
    numer = log(epsilon) + (1 - cr) * log(cr)
    denom = log(r) - log(cr)
    return ceil(numer/denom)


def main(r, nmax):
    assert floor(r) < r < ceil(r)
    assert nmax > r
    rows = []

    c = ceil(r)

    for n in seq(floor(r) + 1, nmax):
        fac1 = prod(r/i for i in seq(1, c - 1))
        fac2 = prod(r/i for i in seq(c, n))
        bound1 = r ** (c - 1)
        bound2 = (r/c) ** (n - c + 1)
        a_n = a(r, n)
        bound3 = ((r/c) ** n) * (c ** (c - 1))

        row = {
            'n': n,
            'a': a_n,
            'fac1': fac1,
            'bound1': bound1,
            'fac2': fac2,
            'bound2': bound2,
            'bound3': bound3,
        }
        assert fac1 <= bound1, ('fac1', fac1, bound1)
        assert fac2 <= bound2, ('fac2', fac2, bound2)
        assert a_n < bound1 * bound2
        # assert a_n < bound3

        row['fac1 x fac2'] = fac1 * fac2
        row['bound1 x bound2'] = bound1 * bound2
        rows.append(row)

    return pd.DataFrame.from_records(
        rows,
        columns=[
            'n',
            'fac1',
            'bound1',
            'fac2',
            'bound2',
            'fac1 x fac2',
            'bound1 x bound2',
            'bound3',
            'a',
        ],
        index='n',
    )


if __name__ == '__main__':
    import sys
    r = float(sys.argv[1])
    nmax = int(sys.argv[2])
    sys.stderr.write(f'r = {r}\n')
    print(main(r, nmax).to_csv())
