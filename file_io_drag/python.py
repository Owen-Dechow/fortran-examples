from timeit import timeit

def main():
    with open("iter.txt") as iter_file:
        iter_count = int(iter_file.readline())

    for i in range(iter_count):
        with open(f"output/{i}.txt", "w") as f:
            for p in range(iter_count):
                f.write(f"Python number: {p}\n")

if __name__ == "__main__":
    print("Python: ",timeit(main, number=1))