# seg3503_playground

Dépôt de laboratoire 1 pour le cours SEG3503 — Université d'Ottawa.

---

## Contenu

- `newmath_java/` — Implémentation Java avec tests JUnit
- `newmath_ex/` — Implémentation Elixir avec tests ExUnit

---

## Java + JUnit

### Prérequis
- Java JDK 17+

### Compiler

```bash
cd newmath_java
javac -encoding UTF-8 --source-path src -d dist src/*.java
javac -encoding UTF-8 --source-path test -d dist -cp "dist;lib/junit-platform-console-standalone-1.7.1.jar" test/*.java
```

### Lancer le programme

```bash
bash bin/run
```

### Lancer les tests

```bash
java -jar lib/junit-platform-console-standalone-1.7.1.jar --class-path dist --scan-class-path
```

### Screenshot — Tests JUnit

<img width="1408" height="702" alt="CaptureTEST1" src="https://github.com/user-attachments/assets/90e8c980-c8a4-474c-8c33-936c90d62866" />

### Screenshot — Exécution Java

<img width="1128" height="226" alt="Java_run" src="https://github.com/user-attachments/assets/faabb7ff-435f-45d1-b1f4-6b0026e17359" />

---

## Elixir + ExUnit

### Prérequis
- Elixir 1.14+

### Compiler

```bash
cd newmath_ex
mix compile
```

### Lancer le programme

```bash
bash bin/run
```

Dans la console `iex` :
```elixir
NewmathEx.div(5, 2)   # {:ok, 2.5}
NewmathEx.div(5, 0)   # {:error, "Cannot divide by zero"}
```

### Lancer les tests

```bash
mix test
```

### Screenshot — Tests ExUnit

<img width="2362" height="1070" alt="CaptureTEST2" src="https://github.com/user-attachments/assets/cb5ac56d-24f5-4710-9c5a-7914d033f386" />

### Screenshot — Exécution Elixir

<img width="1132" height="264" alt="Elixir_run" src="https://github.com/user-attachments/assets/864d0224-39dc-43e2-b296-7ff0f0c67ce5" />

---

## Auteur

- Tahe clark
