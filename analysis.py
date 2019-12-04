from math import *


def a(r, n):
    return (r ** n) / factorial(n)


def N(r, epsilon):
    assert ceil(r) > r
    return ceil(log(epsilon) / (log(r) - log(ceil(r))))



def approx(p, n):
    return sum((1 / (k * (k + p))) for k in range(1, n + 1))


def exact(p):
    return sum((1 / (p * k)) for k in range(1, p + 1))


In [3]: exact(p=7)
Out[3]: 0.3704081632653061

In [4]: approx(p=7, n=1000)
Out[4]: 0.36941214337664163

In [5]: approx(p=7, n=10000)
Out[5]: 0.3703082032453168

In [6]: approx(p=7, n=100000)
Out[6]: 0.3703981636652773



def s1(n):
    total = 0
    for i in range(1, n + 1):
        if i % 2 == 1:
            total += 1/i
        else:
            total -= 1/i
    return total



def s2(n):
    total = 0
    power_of_2 = 2
    for i in range(1, n + 1):
        if i % 2 == 1:
            total += 1/i
            stdout.write(' +1/%d' % i)
        elif i == power_of_2:
            total -= 1/i
            power_of_2 *= 2
            stdout.write(' -1/%d' % i)
    stdout.write('\n')
    return total


import itertools



def s2(n):
    seq_1 = (1/j for j in itertools.count(1) if j % 2 == 1)
    seq_2 = (1/(2**j) for j in itertools.count(1))
    total = 0
    for i in range(1, n+1):
        total += next(seq_1)
        total += next(seq_1)
        total -= next(seq_2)

    print(total)



def s3(n):
    seq_1 = (1/j for j in itertools.count(1) if j % 2 == 1)
    seq_2 = (1/j for j in itertools.count(1) if j % 2 == 0)
    total = 0
    for i in range(1, n+1):
        total += next(seq_1)
        total += next(seq_1)
        total -= next(seq_2)

    print(total)


def s4(n):
    seq_1 = (1/j for j in itertools.count(1) if j % 2 == 1)
    seq_2 = (1/j for j in itertools.count(1) if j % 2 == 0)
    total = 0
    for i in range(1, n+1):
        total += next(seq_1)
        total += next(seq_1)
        total += next(seq_1)
        total -= next(seq_2)

    return total


def s(n, q):
    seq_1 = (1/i for i in itertools.count(1) if i % 2 == 1)
    seq_2 = (1/i for i in itertools.count(1) if i % 2 == 0)
    total = 0
    for i in range(1, n+1):
        for j in range(q):
            total += next(seq_1)
        total -= next(seq_2)

    return total


for q in list(range(1, 10 + 1)) + [10, 20, 100]:
    L = s(10000, q)
    print('%10d %10.6f %.6f' % (q, L, L / log(2)))


def s2(n):
    seq_1 = (1/j for j in itertools.count(1) if j % 2 == 1)
    sseq_1 = (('+1/%d' % j) for j in itertools.count(1) if j % 2 == 1)
    seq_2 = (1/(2**j) for j in itertools.count(1))
    sseq_2 = (('-1/%d' % (2**j)) for j in itertools.count(1))
    total = 0
    for i in range(1, n+1):
        total += next(seq_1)
        print(next(sseq_1), end=' ')
        total += next(seq_1)
        print(next(sseq_1), end=' ')
        total -= next(seq_2)
        print(next(sseq_2), end=' ')

    print()

    return total




print((3/2) * log(2))

print([s1(n) for n in [10, 100, 1000]])

print([s2(n) for n in [10, 100, 1000]])


def s4q6(alpha, beta, c):
    assert 0 < alpha < beta
    assert c > alpha
    def a_next(a):
        return (a**2 + alpha*beta)/(alpha + beta)

    a = c
    for i in range(100):
        a = a_next(a)
        print(a)
