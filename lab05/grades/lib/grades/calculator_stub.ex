defmodule Grades.Calculator do
  @moduledoc """
  STUB VERSION — à committer AVANT d'ajouter la vraie logique.

  Chaque fonction retourne une valeur codée en dur ("stub") juste assez
  pour faire fonctionner l'appli (page_live.ex) sans planter. Ceci
  permet de valider l'intégration (le formulaire, le LiveView, l'appel
  de fonction) avant d'investir dans la vraie logique de calcul.
  """

  @doc "Stub — retourne toujours la même note en pourcentage."
  def percentage_grade(_grades) do
    75.0
  end

  @doc "Stub — retourne toujours la même note numérique (sur 4.0)."
  def numeric_grade(_grades) do
    3.0
  end

  @doc "Stub — retourne toujours la même lettre."
  def letter_grade(_grades) do
    "B+"
  end
end
