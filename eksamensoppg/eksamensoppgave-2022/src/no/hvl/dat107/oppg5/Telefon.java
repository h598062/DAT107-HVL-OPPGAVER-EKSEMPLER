package no.hvl.dat107.oppg5;

import jakarta.persistence.*;

@Entity
public class Telefon {
	@Id
	private int nummer;

	private String alias;

	@ManyToOne
	@JoinColumn(name = "person_id")
	private Person person;
}
