Write a function greet() that prints "Hello, python Learner!" when called


def greet():
    print("Hello, python Learner!")


greet()

# Write a function square(num) that returns the square of a given number. Test it with different numbers


def square(num):
    return num * num


print(square(4))
print(square(7))


# Write a function full_name(first_name, last_name) that takes first and last names as arguments and returns the full name in the format "First Last".
def full_name(first_name, last_name):
    return first_name + " " + last_name


print(full_name("John", "Doe"))


def calculate_area(length, width=10):
    return length * width


print(calculate_area(5))  # Uses default width of 10
print(calculate_area(5, 4))  # Uses provided width of 4


def add(x, y): return x + y


print(add(3, 5))  # Output: 8


def square(x): return x * x


List = [1, 2, 3, 4, 5]
print(list(map(square, List)))  # Output: <map object at ...>


def factorial(n):
    if n == 0 or n == 1:
        return 1
    else:
        return n * factorial(n - 1)


print(factorial(5))  # Output: 120


def sum_of_digits(n):
    if n == 0:
        return 0
    else:
        return (n % 10) + sum_of_digits(n // 10)


print(sum_of_digits(1234))  # Output: 10
