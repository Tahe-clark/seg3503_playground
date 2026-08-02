defmodule Grades.Calculator do
  @moduledoc """
  Calcule la note finale (pourcentage, note numérique sur 4.0, lettre)
  à partir des travaux pratiques, laboratoires, intra et final.

  NOTE POUR GLORIA : les pondérations ci-dessous (homework 20%, labs 20%,
  intra 25%, final 35%) sont une hypothèse raisonnable, PAS le contenu
  exact de ton assignment #2 (ce code-là n'était pas dans l'archive du
  lab). Remplace `@weights` par les pondérations réelles de ton
  assignment #2 si elles diffèrent — le reste (parsing, moyenne,
  barème de lettres) reste valide peu importe la pondération.
  """

  @weights %{homework: 0.20, labs: 0.20, midterm: 0.25, final: 0.35}

  @doc """
  Retourne la note finale en pourcentage (float, arrondi à 1 décimale).
  """
  def percentage_grade(grades) do
    homework_avg = average(grades[:homework])
    labs_avg = average(grades[:labs])
    midterm = parse_grade(grades[:midterm]) || 0.0
    final = parse_grade(grades[:final]) || 0.0

    total =
      homework_avg * @weights.homework +
        labs_avg * @weights.labs +
        midterm * @weights.midterm +
        final * @weights.final

    Float.round(total, 1)
  end

  @doc """
  Retourne la note numérique sur une échelle de 0.0 à 4.0, à partir du
  pourcentage, selon le barème de conversion de l'Université d'Ottawa.
  """
  def numeric_grade(grades) do
    grades
    |> percentage_grade()
    |> percentage_to_numeric()
  end

  @doc """
  Retourne la note en lettre, selon le barème de l'Université d'Ottawa.
  """
  def letter_grade(grades) do
    grades
    |> percentage_grade()
    |> percentage_to_letter()
  end

  # -- Helpers ---------------------------------------------------------

  defp average(nil), do: 0.0

  defp average(values) do
    parsed = values |> Enum.map(&parse_grade/1) |> Enum.reject(&is_nil/1)

    case parsed do
      [] -> 0.0
      _ -> Enum.sum(parsed) / length(parsed)
    end
  end

  # Parse une entrée de formulaire (string) en nombre. "" ou nil ou une
  # valeur non numérique donnent nil (au lieu de planter).
  defp parse_grade(nil), do: nil
  defp parse_grade(""), do: nil

  defp parse_grade(value) when is_binary(value) do
    case Float.parse(value) do
      {number, _rest} -> number
      :error -> nil
    end
  end

  defp parse_grade(value) when is_number(value), do: value * 1.0

  defp percentage_to_numeric(pct) when pct >= 90, do: 4.0
  defp percentage_to_numeric(pct) when pct >= 85, do: 3.9
  defp percentage_to_numeric(pct) when pct >= 80, do: 3.7
  defp percentage_to_numeric(pct) when pct >= 75, do: 3.3
  defp percentage_to_numeric(pct) when pct >= 70, do: 3.0
  defp percentage_to_numeric(pct) when pct >= 65, do: 2.7
  defp percentage_to_numeric(pct) when pct >= 60, do: 2.3
  defp percentage_to_numeric(pct) when pct >= 55, do: 2.0
  defp percentage_to_numeric(pct) when pct >= 50, do: 1.7
  defp percentage_to_numeric(pct) when pct >= 45, do: 1.3
  defp percentage_to_numeric(pct) when pct >= 40, do: 1.0
  defp percentage_to_numeric(_pct), do: 0.0

  defp percentage_to_letter(pct) when pct >= 90, do: "A+"
  defp percentage_to_letter(pct) when pct >= 85, do: "A"
  defp percentage_to_letter(pct) when pct >= 80, do: "A-"
  defp percentage_to_letter(pct) when pct >= 75, do: "B+"
  defp percentage_to_letter(pct) when pct >= 70, do: "B"
  defp percentage_to_letter(pct) when pct >= 65, do: "B-"
  defp percentage_to_letter(pct) when pct >= 60, do: "C+"
  defp percentage_to_letter(pct) when pct >= 55, do: "C"
  defp percentage_to_letter(pct) when pct >= 50, do: "C-"
  defp percentage_to_letter(pct) when pct >= 45, do: "D+"
  defp percentage_to_letter(pct) when pct >= 40, do: "D"
  defp percentage_to_letter(_pct), do: "F"
end
