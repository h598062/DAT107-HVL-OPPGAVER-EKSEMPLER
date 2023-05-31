package no.hvl.dat107.entity;

import jakarta.persistence.*;

import java.util.List;

@Entity
@Table(schema = "EKSOVOBLIG3")
public class Prosjekt {

	@Id
	@GeneratedValue(strategy = GenerationType.IDENTITY)
	private int    prosjekt_id;
	private String prosjekt_navn;
	private String prosjekt_beskrivelse;

	@OneToMany(mappedBy = "prosjekt")
	private List<Prosjektdeltagelse> deltagelser;

	public Prosjekt() {
	}

	public Prosjekt(String prosjekt_navn, String prosjekt_beskrivelse) {
		this.prosjekt_navn        = prosjekt_navn;
		this.prosjekt_beskrivelse = prosjekt_beskrivelse;
	}
}
