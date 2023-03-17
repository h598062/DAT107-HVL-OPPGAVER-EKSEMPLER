""" Genererer en liste med navn fra etternavn.txt og fornavn.txt
"""
import random


def main():
    """main funksjon"""
    etternavn_fil = open("./etternavn.txt", "rt", encoding="utf-8")
    fornavn_fil = open("./fornavn.txt", "rt", encoding="utf-8")

    etternavn_liste = etternavn_fil.readlines()
    fornavn_liste = fornavn_fil.readlines()

    utfil = open("./navneliste.txt", "w", encoding="utf-8")

    for i in range(0, 100):
        etternavn = random.choice(etternavn_liste).strip()
        fornavn = random.choice(fornavn_liste).strip()
        utfil.write(f"{fornavn} {etternavn}\n")

    etternavn_fil.close()
    fornavn_fil.close()
    utfil.close()


if __name__ == "__main__":
    main()
