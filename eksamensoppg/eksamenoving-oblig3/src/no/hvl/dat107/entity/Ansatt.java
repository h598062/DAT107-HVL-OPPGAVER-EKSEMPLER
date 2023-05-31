package no.hvl.dat107.entity;

import jakarta.persistence.*;

import java.util.Date;
import java.util.List;

@Entity
@Table(schema = "EKSOVOBLIG3")
public class Ansatt {

	@Id
	@GeneratedValue(strategy = GenerationType.IDENTITY)
	private int    ansatt_id;
	private String navn;
	private String stilling;
	private Date   startdato;
	private int    lonn;

	@OneToMany(mappedBy = "ansatt")
	private List<Prosjektdeltagelse> deltagelser;

	public Ansatt() {
	}

	public Ansatt(String navn, String stilling, Date startdato, int lonn) {
		this.navn      = navn;
		this.stilling  = stilling;
		this.startdato = startdato;
		this.lonn      = lonn;
	}
}
