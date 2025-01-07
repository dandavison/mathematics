import sys


def inversion_matrix(cycles: list[list[int]], n: int) -> None:
    """
    Given a permutation in cycle notation, return the inversion matrix.
    """

    # Form one-line representation
    perm = {i: i for i in range(1, n + 1)}
    for cycle in cycles:
        first, *rest = cycle
        prev = new = first
        for new in rest:
            perm[prev] = new
            prev = new
        perm[new] = first

    # Form inversion matrix
    inversions = [[0] * n for _ in range(n)]
    for i in range(1, n + 1):
        for j in range(i + 1, n + 1):
            if perm[i] > perm[j]:
                inversions[i - 1][j - 1] = 1

    # Print matrix
    print("   " + " ".join(str(i) for i in range(1, n + 1)))
    for i, row in enumerate(inversions):
        print(f"{i + 1}  " + "  " * i + "- " + " ".join(map(str, row[i + 1 :])))


cycles = [[int(c) for c in s] for s in sys.argv[1:-1]]
n = int(sys.argv[-1])
inversion_matrix(cycles, n)
