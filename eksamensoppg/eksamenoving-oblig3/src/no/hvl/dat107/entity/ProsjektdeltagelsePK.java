package no.hvl.dat107.entity;

import java.io.Serializable;

public class ProsjektdeltagelsePK implements Serializable {
	private int ansatt_id;
	private int prosjekt_id;
	public ProsjektdeltagelsePK() {}

	public ProsjektdeltagelsePK(int ansatt_id, int prosjekt_id) {
		this.ansatt_id = ansatt_id;
		this.prosjekt_id = prosjekt_id;
	}
}
