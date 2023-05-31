package no.hvl.dat107.oppg5;

import jakarta.persistence.*;

@Entity
public class Adresse {
	@Id
	@GeneratedValue(strategy = GenerationType.IDENTITY)
	private int id;

	private String gateadresse;
	private int postnummer;
}
