package no.hvl.dat107.entity;

import jakarta.persistence.*;

import java.math.BigDecimal;

@Entity
@Table(schema = "EKSOVOBLIG3")
@IdClass(ProsjektdeltagelsePK.class)
public class Prosjektdeltagelse {
	private BigDecimal timer;

	@Id
	@ManyToOne
	@JoinColumn(name = "ansatt_id")
	private Ansatt ansatt;

	@Id
	@ManyToOne
	@JoinColumn(name = "prosjekt_id")
	private Prosjekt prosjekt;

	public Prosjektdeltagelse() {
	}

	public Prosjektdeltagelse(BigDecimal timer) {
		this.timer = timer;
	}
}
