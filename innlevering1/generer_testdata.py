""" Lager all testdata
    alle filene under kan også kjøres seperat
"""
import subprocess
import sys
import os


def main():
    """main funksjon"""

    frznmodulestr = "-Xfrozen_modules=off"

    newcwd = os.getcwd() + "/testdata"

    subprocess.run(
        ["python", frznmodulestr, "./generer_navneliste.py"],
        stdout=sys.stdout,
        check=True,
        cwd=newcwd,
    )
    subprocess.run(
        ["python", frznmodulestr, "./generer_regnr.py"],
        stdout=sys.stdout,
        check=True,
        cwd=newcwd,
    )
    subprocess.run(
        ["python", frznmodulestr, "./generer_kundedata.py"],
        stdout=sys.stdout,
        check=True,
        cwd=newcwd,
    )
    subprocess.run(
        [
            "python",
            frznmodulestr,
            "./generer_passeringerdata.py",
        ],
        stdout=sys.stdout,
        check=True,
        cwd=newcwd,
    )


if __name__ == "__main__":
    main()
