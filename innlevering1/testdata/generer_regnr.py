""" Lager registreringsnumre og lagrer dem i filen regnr.txt
"""
import random
import string


def main():
    """main funksjon"""

    def lag_regnr():
        letters = string.ascii_uppercase
        return "".join(random.choices(letters, k=2)) + str(random.randint(10000, 99999))

    f = open("./regnr.txt", "w", encoding="utf-8")

    for i in range(0, 100):
        regnr = lag_regnr()
        f.write(f"{regnr}\n")
    f.close()


if __name__ == "__main__":
    main()
