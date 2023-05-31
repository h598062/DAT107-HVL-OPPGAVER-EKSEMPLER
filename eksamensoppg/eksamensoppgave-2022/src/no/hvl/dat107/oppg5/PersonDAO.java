package no.hvl.dat107.oppg5;

import jakarta.persistence.EntityManager;

public class PersonDAO {
	public Person hentUtPersonMedId(int id) {
		EntityManager em = emf.createEntityManager();
		Person        p;
		try {
			p = em.find(Person.class, id);
		} finally {
			em.close();
		}
		return p;
	}
}
