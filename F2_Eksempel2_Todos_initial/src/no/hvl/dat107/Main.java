package no.hvl.dat107;

import java.util.List;

public class Main {

	//-------------------------------------------------------------------------

	/*
	 *  Hjelpeklasse for å snakke med databasen.
	 *  DAO er en forkortelse for Data Access Object,
	 *  og er et vanlig navn på slike.
	 */
	private static final TodoDAO todoDAO = new TodoDAO();

	public static void main(String[] args) {

		/*
		 * Databasen i utgangspunktet:
		 * 	1, 'Handle mat'
		 * 	2, 'Vaske opp'
		 *  3, 'Ta ut bosset'
		 */

		// a) Hente ut alle todos
		List<Todo> todos = todoDAO.finnAlleTodos();
		System.out.println("Alle elementer i tabell for øyeblikket: ");
		todos.forEach(System.out::println);


		// b) Hente ut todo med pk=2
		System.out.println("\nLeter etter elementer med id 1-5");
		for (int i = 1; i <= 5; i++) {
			Todo todoMedPk = todoDAO.finnTodoMedPk(i);
			if (todoMedPk != null) {
				System.out.println(todoMedPk);
			} else {
				System.out.println("Fant ikke todo element med pk " + i);
			}
		}

		// c.i)   Hente ut SINGLE todo med tekst="Handle mat"
		Todo todoMedTekst = todoDAO.finnTodoMedTekst("Handle mat");
		if (todoMedTekst != null) {
			System.out.println("\nFant denne todo: " + todoMedTekst + " ved å søke etter: Handle mat");
		}

		// c.ii)  Hente ut SINGLE todo med tekst="Vaske bilen" (som ikke finnes)
		Todo todoMedTekstSomIkkeFinnes = todoDAO.finnTodoMedTekst("Vaske bilen");
		if (todoMedTekstSomIkkeFinnes == null) {
			System.out.println("\nFant ingen todo ved å søke etter: Vaske bilen");
		}

		// c.iii) Hente ut LISTE av todos med tekst="Handle mat"
		List<Todo> todoListeMedTekst = todoDAO.finnTodosMedTekst("Handle mat");
		System.out.println("\nFant denne listen ved å søke etter: Handle mat\n" + todoListeMedTekst);

		// c.iv)  Hente ut LISTE av todos med tekst="Vaske bilen" (som ikke finnes)
		List<Todo> todoListeMedTekstSomIkkeFinnes = todoDAO.finnTodosMedTekst("Vaske bilen");
		if (todoListeMedTekstSomIkkeFinnes.isEmpty()) {
			System.out.println("\nFant ingen todo elementer ved å søke etter: Vaske bilen");
		}

		// d) Legge til en ny todo med pk=4
		Todo nyTodoMedPK4 = todoDAO.lagreNyTodo(new Todo(4, "Handle mat"));
		System.out.println("\nLa til element: " + nyTodoMedPK4);
		System.out.println("Fant denne listen ved å søke etter: Handle mat\n" + todoDAO.finnTodosMedTekst("Handle mat"));
		pauseOgSjekkPgAdmin("La til et element");

		// e) Slette todo med pk=4
		Todo slettetTodo = todoDAO.slettTodoMedPk(4);
		System.out.println("\nSlettet todo med pk 4: " + slettetTodo);
		pauseOgSjekkPgAdmin("Slettet element");

		// f) Endre tekst på todo med pk=3
		System.out.println("\nForsøker å endre todo med pk=3:\n\tSuksess: " + todoDAO.oppdaterTodo(3, "Spise 14 liter brus"));
		System.out.println("Todo ser nå slik ut: " + todoDAO.finnTodoMedPk(3));
		pauseOgSjekkPgAdmin("Endret på element");

		// g) Endre tekst på todo med pk=3, alternativ måte
		System.out.println("\nForsøker å endre todo med pk=3:\n\tSuksess: " + todoDAO.oppdaterTekst(3, "Drikke 1 liter brus"));
		System.out.println("Todo ser nå slik ut: " + todoDAO.finnTodoMedPk(3));
		pauseOgSjekkPgAdmin("Endret på element, metode 2");


		// Reset elementer tilbake til "standard"
		todoDAO.oppdaterTodo(3, "Ta ut bosset");
	}

	//-------------------------------------------------------------------------
	private static void pauseOgSjekkPgAdmin(String sisteAction) {
		System.out.println("\n" + sisteAction);
		System.out.println("Todo-objekter i persistence context nå:");
		todoDAO.finnAlleTodos().forEach(System.out::println);
	}
}
