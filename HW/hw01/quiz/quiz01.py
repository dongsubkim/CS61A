def multiple(a, b):
    """Return the smallest number n that is a multiple of both a and b.

    >>> multiple(3, 4)
    12
    >>> multiple(14, 21)
    42
    """
    k = a * b
    while k > 1:
        if k % a == 0 and k % b == 0:
            return k
        k -= 1

def unique_digits(n):
    """Return the number of unique digits in positive integer n

    >>> unique_digits(8675309) # All are unique
    7
    >>> unique_digits(1313131) # 1 and 3
    2
    >>> unique_digits(13173131) # 1, 3, and 7
    3
    >>> unique_digits(10000) # 0 and 1
    2
    >>> unique_digits(101) # 0 and 1
    2
    >>> unique_digits(10) # 0 and 1
    2
    """
    # digits = []
    # a, counts = 0, 0
    # while n > 0:
    #     a, n = n % 10, n // 10
    #     digits = digits + [a]
    # for m in range(10):
    #     if m in digits:
    #         counts = counts + 1
    # return counts


    unique = 0
    while n > 0:
        last, n = n % 10, n // 10
        if not has_digit(n, last):
            unique += 1
    return unique

    # unique, i = 0, 0
    # while i < 10:
    #     if has_digit(n, i):
    #         unique += 1
    #     i += 1
    # return unique

def has_digit(n, k):
    while n > 0:
        last, n = n % 10, n //10
        if last == k:
            return True
    return False
