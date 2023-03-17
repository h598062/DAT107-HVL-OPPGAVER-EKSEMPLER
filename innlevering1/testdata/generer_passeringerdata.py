""" Lager en sql fil med passeringer som kan legges inn i database
"""
import random
import datetime


def main():
    """main funksjon"""
    utfil = open("../testpasseringerdata.sql", "w", encoding="utf-8")
    utfil.write(
        "-- Dette er en automatisk generert fil. Legger inn 300 passeringer inn i passeringer tabell\n"
    )

    regnrfil = open("./regnr.txt", "rt", encoding="utf-8")
    regnrliste = regnrfil.readlines()

    start_date = datetime.datetime(2023, 1, 15)
    end_date = datetime.datetime(2023, 1, 27)

    start_time = datetime.datetime.combine(
        datetime.datetime.today(), datetime.time(0, 0, 0)
    )
    end_time = datetime.datetime.combine(
        datetime.datetime.today(), datetime.time(23, 59, 59)
    )

    for i in range(0, 300):
        regnr = random.choice(regnrliste).strip()
        bomnr = random.randint(100, 131)
        pris = 5 * round(random.randint(20, 50) / 5)

        random_date = start_date + datetime.timedelta(
            seconds=random.randint(0, int((end_date - start_date).total_seconds()))
        )
        dato = random_date.strftime("%Y-%m-%d")

        delta = datetime.timedelta(
            seconds=random.randint(0, int((end_time - start_time).total_seconds()))
        )
        random_datetime = start_time + delta
        random_time = random_datetime.time()
        tid = random_time.strftime("%H:%M:%S")

        tidspunkt = f"{dato} {tid}"

        utlinje = f"insert into passeringer (bomnr, tidspunkt, regnr, pris) values('{bomnr}','{tidspunkt}','{regnr}',{pris});\n"
        utfil.write(utlinje)

    # legg inn noen passeringer uten regnr
    for i in range(0, 20):
        bomnr = random.randint(100, 131)
        pris = 5 * round(random.randint(20, 50) / 5)

        random_date = start_date + datetime.timedelta(
            seconds=random.randint(0, int((end_date - start_date).total_seconds()))
        )
        dato = random_date.strftime("%Y-%m-%d")

        delta = datetime.timedelta(
            seconds=random.randint(0, int((end_time - start_time).total_seconds()))
        )
        random_datetime = start_time + delta
        random_time = random_datetime.time()
        tid = random_time.strftime("%H:%M:%S")

        tidspunkt = f"{dato} {tid}"

        utlinje = f"insert into passeringer (bomnr, tidspunkt, pris) values('{bomnr}','{tidspunkt}',{pris});\n"
        utfil.write(utlinje)

    regnrfil.close()
    utfil.close()


if __name__ == "__main__":
    main()
