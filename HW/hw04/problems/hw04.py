HW_SOURCE_FILE = 'hw04.py'

def g(n):
    """Return the value of G(n), computed recursively.

    >>> g(1)
    1
    >>> g(2)
    2
    >>> g(3)
    3
    >>> g(4)
    10
    >>> g(5)
    22
    >>> from construct_check import check
    >>> check(HW_SOURCE_FILE, 'g', ['While', 'For'])
    True
    """
    if n <= 3:
        return n
    else:
        return g(n-1) + 2*g(n-2) + 3*g(n-3)

def g_iter(n):
    """Return the value of G(n), computed iteratively.

    >>> g_iter(1)
    1
    >>> g_iter(2)
    2
    >>> g_iter(3)
    3
    >>> g_iter(4)
    10
    >>> g_iter(5)
    22
    >>> from construct_check import check
    >>> check(HW_SOURCE_FILE, 'g_iter', ['Recursion'])
    True
    """
    first, second, third = 1, 2, 3
    result = n
    while 3 < n:
        new = third + 2*second + 3*first
        result = new
        first, second, third = second, third, new
        n -= 1
    return result

def pingpong(n):
    """Return the nth element of the ping-pong sequence.

    >>> pingpong(7)
    7
    >>> pingpong(8)
    6
    >>> pingpong(15)
    1
    >>> pingpong(21)
    -1
    >>> pingpong(22)
    0
    >>> pingpong(30)
    6
    >>> pingpong(68)
    2
    >>> pingpong(69)
    1
    >>> pingpong(70)
    0
    >>> pingpong(71)
    1
    >>> pingpong(72)
    0
    >>> pingpong(100)
    2
    >>> from construct_check import check
    >>> check(HW_SOURCE_FILE, 'pingpong', ['Assign', 'AugAssign'])
    True
    """
    def adder(n):
        if n == 1:
            return 1
        if has_seven(n-1) or (n-1) % 7 == 0:
            return -1 * adder(n-1)
        else:
            return adder(n-1)
    if n == 1:
        return n
    return pingpong(n-1) + adder(n)

def has_seven(k):
    """Returns True if at least one of the digits of k is a 7, False otherwise.

    >>> has_seven(3)
    False
    >>> has_seven(7)
    True
    >>> has_seven(2734)
    True
    >>> has_seven(2634)
    False
    >>> has_seven(734)
    True
    >>> has_seven(7777)
    True
    """
    if k % 10 == 7:
        return True
    elif k < 10:
        return False
    else:
        return has_seven(k // 10)

def count_change(amount):
    """Return the number of ways to make change for amount.

    >>> count_change(7)
    6
    >>> count_change(10)
    14
    >>> count_change(20)
    60
    >>> count_change(100)
    9828
    """
    def max_two(amount):
        k = 0
        while pow(2, k) <= amount:
            if pow(2, k) == amount:
                return k
            k += 1
        return pow(2, k)
    max_coin_value = max_two(amount)
    def recur(amount, max_coin_value):
        if amount == max_coin_value:
            return 1 + recur(amount, (max_coin_value // 2))
        elif amount < 0:
            return 0
        elif max_coin_value == 1:
            return 1
        elif max_coin_value == 0:
            return 0
        else:
            return recur(amount - max_coin_value, max_coin_value) + recur(amount, (max_coin_value)//2)
    return recur(amount, max_coin_value)

"""
    def count_using(min_coin, amount):
        if amount < 0:
            return 0
        elif amount == 0:
            return 1
        elif min_coin > amount:
            return 0
        else:
            with_min = count_using(min_coin, amount - min_coin)
            without_min = count_using(2*min_coin, amount)
            return with_min + without_min
    return count_using(1, amount)
"""

###################
# Extra Questions #
###################

from operator import sub, mul

def make_anonymous_factorial():
    """Return the value of an expression that computes factorial.

    >>> make_anonymous_factorial()(5)
    120
    >>> from construct_check import check
    >>> check(HW_SOURCE_FILE, 'make_anonymous_factorial', ['Assign', 'AugAssign', 'FunctionDef', 'Recursion'])
    True
    """
    return (lambda f: lambda k: f(f, k))(lambda f, k: 1 if k == 1 else mul(k, f(f, sub(k,1))))
