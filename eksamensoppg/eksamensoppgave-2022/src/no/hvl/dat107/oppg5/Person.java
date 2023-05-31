package no.hvl.dat107.oppg5;

import jakarta.persistence.*;

import java.util.List;

@Entity
public class Person {

	@Id
	@GeneratedValue(strategy = GenerationType.IDENTITY)
	private int id;
	private String fornavn;
	private String etternavn;

	@ManyToOne
	@JoinColumn(name = "adresse_id")
	private Adresse adresse; // FK -> adresse: en person har kun en adresse, en adresse har flere beboere

	@OneToMany(mappedBy = "person", fetch = FetchType.EAGER)
	private List<Telefon> telefoner;
}
