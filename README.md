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

capture test

### Screenshot — Exécution Java

capture execution

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

capture test 

### Screenshot — Exécution Elixir

capture execution

---

## Auteur

- Tahe clark
