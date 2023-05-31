package no.hvl.dat107.oppg5;

import jakarta.persistence.EntityManager;
import jakarta.persistence.TypedQuery;

import java.util.List;

public class AdresseDAO {
	public List<Person> hentUtAlleSomBorPaaAdresseId(int id) {
		EntityManager em = emf.createEntityManager();
		try {
			TypedQuery<Person> q = em.createQuery("SELECT p from Person p where p.adresse.id = :adresse_id",
					                 Person.class)
			                 .setParameter("adresse_id", id);
			return q.getResultList();
		} finally {
			em.close();
		}
	}
}
