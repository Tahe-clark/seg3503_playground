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

| Test Case | Expected Results | Actual Results | Verdict(Pass,Fail,Inconclusive) |
| --- | --- | --- | --- |
| **1** | accepted | Formulaire rempli avec des données valides.<br>

<br>

 | Pass |
| **2** | Err3 | UserName trop court (<6 chars) et format d'Email invalide (`515@_AA`).<br>

 | Pass |
| **3** | Err Postal Code | Code postal au format invalide (`12345`).<br>

 | Pass |
| **4** | Err Email | Champ Email laissé vide.<br>

 | Pass |
| **5** | Err Age | Champ Âge laissé vide.<br>

 | Pass |
| **6** | Err Age | Âge supérieur à la limite autorisée (`150`).<br>

 | Pass |
| **7** | Err Age | Âge inférieur à la limite autorisée (`-1`).<br>

 | Pass |

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
