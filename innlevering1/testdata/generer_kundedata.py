""" Lager en sql fil med 1000 kunder som kan legges inn i databasen
"""
import random


def main():
    """main funksjon"""

    # navnefil må genereres fra generer_navneliste.py
    # husk å sette range i for løkken til å være lik som i regnr fil
    navnefil = open("./navneliste.txt", "rt", encoding="utf-8")
    naveliste = navnefil.readlines()

    # regnr fil må genereres fra generer_regnr.py
    # husk å sette range i for løkken til å være lik som i navneliste fil
    regnrfil = open("./regnr.txt", "rt", encoding="utf-8")

    eposter = ["@gmail.com", "@hotmail.com", "@outlook.com", "@live.no", "@example.com"]
    gatested = [
        "Elm",
        "Main",
        "Oak",
        "Park",
        "Maple",
        "Pine",
        "Cedar",
        "Sunset",
        "River",
        "Mountain View",
        "Central Park",
        "Hillside",
        "Bongaville",
    ]
    gatetype = ["Street", "Avenue", "Boulevard", "Place", "Drive", "Lane", "Road"]

    utfil = open("../testkundedata.sql", "w", encoding="utf-8")
    utfil.write(
        f"-- Dette er en automatisk generert fil. Legger inn {len(naveliste)} brukere inn i kundedata tabell\n"
    )

    for line in naveliste:
        fornavn, etternavn = line.strip().split(" ")
        epost = f"{fornavn}.{etternavn}" + random.choice(eposter)
        tlfnr = random.randint(10000000, 99999999)
        postnr = random.randint(1000, 9999)
        adresse = (
            ""
            + random.choice(gatested)
            + " "
            + random.choice(gatetype)
            + " "
            + str(random.randint(1, 174))
        )
        regnr = regnrfil.readline().strip()
        utlinje = f"insert into kundedata (regnr, etternavn, fornavn, adresse, postnr, tlf, epost) values('{regnr}','{etternavn}','{fornavn}','{adresse}','{postnr}','{tlfnr}','{epost}');\n"
        utfil.write(utlinje)

    navnefil.close()
    regnrfil.close()
    utfil.close()


if __name__ == "__main__":
    main()
