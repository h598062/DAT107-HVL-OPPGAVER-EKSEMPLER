package no.hvl.dat107;

import java.util.List;
import java.util.Map;

import jakarta.persistence.*;

public class TodoDAO {

	private final EntityManagerFactory emf = Persistence.createEntityManagerFactory("todoPersistenceUnit",
			Map.of("jakarta.persistence.jdbc.password", Passwords.AZURE_PASSWORD));

	/* --------------------------------------------------------------------- */

	public List<Todo> finnAlleTodos() {

		try (EntityManager em = emf.createEntityManager()) {
			String           ql = "select t from Todo as t order by t.id";
			TypedQuery<Todo> q  = em.createQuery(ql, Todo.class);
			return q.getResultList();


		}
	}

	/* --------------------------------------------------------------------- */

	public Todo finnTodoMedPk(int pk) {

		try (EntityManager em = emf.createEntityManager()) {
			return em.find(Todo.class, pk);

		}
	}

	/* --------------------------------------------------------------------- */

	public Todo finnTodoMedTekst(String tekst) {

		try (EntityManager em = emf.createEntityManager()) {
			String           ql = "select t from Todo as t where t.tekst = '" + tekst + "'";
			TypedQuery<Todo> q  = em.createQuery(ql, Todo.class);
			return q.getSingleResult();
		} catch (NoResultException e) {
			return null;
		}
	}

	/* --------------------------------------------------------------------- */

	public List<Todo> finnTodosMedTekst(String tekst) {

		try (EntityManager em = emf.createEntityManager()) {
			String           ql = "select t from Todo as t where t.tekst = '" + tekst + "' order by t.id";
			TypedQuery<Todo> q  = em.createQuery(ql, Todo.class);
			return q.getResultList();
		}
	}

	/* --------------------------------------------------------------------- */

	public Todo lagreNyTodo(Todo t) {

		EntityManager     em = emf.createEntityManager();
		EntityTransaction tx = em.getTransaction();

		try (em) {

			tx.begin();
			em.persist(t);
			tx.commit();

		} catch (Exception e) {
			e.printStackTrace();
			if (tx.isActive()) {
				tx.rollback();
			}
		}

		return t;
	}

	/* --------------------------------------------------------------------- */

	public Todo slettTodoMedPk(int pk) {

		EntityManager     em = emf.createEntityManager();
		EntityTransaction tx = em.getTransaction();

		try (em) {
			tx.begin();
			Todo t = em.find(Todo.class, pk);
			em.remove(t);
			tx.commit();
			return t;
		} catch (Exception e) {
			e.printStackTrace();
			if (tx.isActive()) {
				tx.rollback();
			}
		}
		return null;
	}

	/* --------------------------------------------------------------------- */

	public boolean oppdaterTodo(int pk, String tekst) {

		EntityManager     em = emf.createEntityManager();
		EntityTransaction tx = em.getTransaction();

		boolean suksess = false;

		try (em) {
			tx.begin();
			Todo t = em.find(Todo.class, pk);
			t.setTekst(tekst);
			tx.commit();
			suksess = true;
		} catch (Exception e) {
			e.printStackTrace();
			if (tx.isActive()) {
				tx.rollback();
			}
		}

		return suksess;
	}

	/* --------------------------------------------------------------------- */

	public boolean oppdaterTekst(int pk, String tekst) {

		EntityManager     em = emf.createEntityManager();
		EntityTransaction tx = em.getTransaction();

		boolean suksess = false;

		try (em) {
			tx.begin();
			em.merge(new Todo(pk, tekst));
			tx.commit();
			suksess = true;
		} catch (Exception e) {
			e.printStackTrace();
			if (tx.isActive()) {
				tx.rollback();
			}
		}

		return suksess;
	}
}
