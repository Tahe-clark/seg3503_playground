```markdown
Team:
- Clark Tahe - 12345678
- Gloria Drafor - 300447461

# Equivalence Partition Tests Execution

We run the following in bash:
```bash
java --add-opens java.base/java.lang=ALL-UNNAMED -jar user-registration-app-0.1.0.jar

```

And visit http://localhost:8080/

---

## Exercise 1

| Test Case | Expected Results | Actual Results | Verdict |
| :---: | :--- | :--- | :---: |
| **1** | Inscription réussie | Formulaire rempli avec des données valides.<br>![Formulaire valide](images/C1.png)<br>![Message de succès](images/CC8.png) | **Pass** |
| **2** | Erreur UserName & Email | UserName trop court (<6 chars) et format d'Email invalide (`515@_AA`).<br>![Erreur UserName et Email](images/C9.png) | **Pass** |
| **3** | Erreur Code Postal | Code postal au format invalide (`12345`).<br>![Erreur Code Postal](images/CC6.png) | **Pass** |
| **4** | Erreur Email vide | Champ Email laissé vide.<br>![Erreur Email vide](images/CC5.png) | **Pass** |
| **5** | Erreur Âge obligatoire | Champ Âge laissé vide.<br>![Erreur Age obligatoire](images/CC4.png) | **Pass** |
| **6** | Erreur Âge > 64 | Âge supérieur à la limite autorisée (`150`).<br>![Erreur Age trop grand](images/CC3.png) | **Pass** |
| **7** | Erreur Âge < 18 | Âge inférieur à la limite autorisée (`-1`).<br>![Erreur Age negatif](images/CC2.png) | **Pass** |

---

## JUnit Parameterized Runner

Typical explicit test case that doesn't use exceptions:

```java
@Test
void test_2() {
    Date d = new Date(2005, 4, 15);
    assertEquals(new Date(2005, 4, 16), d.nextDate());
}

```

Explicit test cases that have exceptions:

```java
@Test
void test_16() {
    assertThrows(IllegalArgumentException.class, () -> { new Date(1500, 2, 31).nextDate(); }, "day must less than 28 for month February on a non leap year.");
}

@Test
void test_17() {
    assertThrows(IllegalArgumentException.class, () -> { new Date(1500, 2, 29).nextDate(); }, "day must less than 28 for month February on a non leap year.");
}

@Test
void test_18() {
    assertThrows(IllegalArgumentException.class, () -> { new Date(-1, 10, 20).nextDate(); }, "year must be greater or equal to 0.");
}

@Test
void test_19() {
    assertThrows(IllegalArgumentException.class, () -> { new Date(1458, 15, 12).nextDate(); }, "month must be between 1 and 12.");
}

@Test
void test_20() {
    assertThrows(IllegalArgumentException.class, () -> { new Date(1975, 6, -50).nextDate(); }, "day must equal to 1.");
}

```

> These test cases had to use `assertThrows` so that the test case could be executed. Else, the test cases would not work because we would throw an exception without catching it (illegal argument exception). This required using an in-line function, hence the `() -> {function;}` syntax.

---

### Parameterized test values for test cases that run OK and return a Date

```java
List<Date[]> params = new LinkedList<Date[]>();
params.add(new Date[] { new Date(1700, 6, 20), new Date(1700, 6, 21) });
params.add(new Date[] { new Date(2005, 4, 15), new Date(2005, 4, 16) });

```
