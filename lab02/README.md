
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
| **1** | Inscription réussie | Formulaire rempli avec des données valides.<br>![Formulaire valide]<img width="860" height="576" alt="C1" src="https://github.com/user-attachments/assets/12e796f1-1638-485f-998d-17c78a857afc" /><br>![Message de succès]<img width="904" height="498" alt="CC1" src="https://github.com/user-attachments/assets/f5d0bc32-4894-49e4-a12f-0c7f37579045" /> | Pass |
| **2** | Erreur UserName & Email | UserName trop court (<6 chars) et format d'Email invalide (`515@_AA`).<br>![Erreur UserName et Email]<img width="996" height="736" alt="C9" src="https://github.com/user-attachments/assets/1dd15b31-2db6-4354-8a40-8e685ccd522e" /> | Pass |
| **3** | Erreur Code Postal | Code postal au format invalide (`12345`).<br>![Erreur Code Postal]<img width="1006" height="648" alt="CC6" src="https://github.com/user-attachments/assets/b39f5f93-ca57-4230-86ff-6a216855ba29" /> | Pass |
| **4** | Erreur Email vide | Champ Email laissé vide.<br>![Erreur Email vide] <img width="902" height="662" alt="CC5" src="https://github.com/user-attachments/assets/ce0704b6-8249-40f2-b719-ad6c60ffaf90" /> | Pass |
| **5** | Erreur Âge obligatoire | Champ Âge laissé vide.<br>![Erreur Age obligatoire]<img width="922" height="730" alt="CC4" src="https://github.com/user-attachments/assets/acdc2c10-5b97-4a2b-9a44-419b01178185" /> | Pass |
| **6** | Erreur Âge > 64 | Âge supérieur à la limite autorisée (`150`).<br>![Erreur Age trop grand]<img width="1064" height="800" alt="CC3" src="https://github.com/user-attachments/assets/fda05236-097c-46e8-99f7-398cf67d0a5e" /> | Pass |
| **7** | Erreur Âge < 18 | Âge inférieur à la limite autorisée (`-1`).<br>![Erreur Age negatif]<img width="984" height="746" alt="CC2" src="https://github.com/user-attachments/assets/5b22d0e3-3737-4548-bfe0-11c9200e7903" /> | Pass |

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
