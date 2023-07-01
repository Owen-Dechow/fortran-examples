from random import randint
from os import remove
import csv
from timeit import timeit


def main():
    with open("iter.txt") as iter_file:
        iter_count = int(iter_file.readline())
        
    nums = []
    for i in range(iter_count):
        nums.append(randint(1, i + 1))

    for i in range(iter_count):
        nums[i] *= randint(1, i+1)

    with open("out.txt", "w") as out:
        out.write(nums.__str__())


if __name__ == "__main__":
    print("Python: ", timeit(main, number=1))