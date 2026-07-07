On run ceci dans le terminal:

photo

on clique sur ce site: http://localhost:8080/

*EXERCICE 1
#EXERCICE 1

| Cas de Test | Résultats Escomptés | Résultats Actuels | Verdict (Succès, Échec, Non-concluant) |
| :--- | :--- | :--- | :--- |
| **TC 1 : Cas nominal valide** <br>*(Entrées : ClarkT, Clark, Tahe, clark.tahe@uottawa.ca, 20, Gatineau, J8X 3X8)* | Inscription réussie (Accepte) | ![TC1](assets/tc01.png) | |
| **TC 2 : Âge limite inférieur invalide** <br>*(Entrées : identiques au TC1 sauf Age = -1)* | Message d'erreur (Erreur) | ![TC2](assets/tc02.png) | |
| **TC 3 : Âge limite supérieur invalide** <br>*(Entrées : identiques au TC1 sauf Age = 150)* | Message d'erreur (Erreur) | ![TC3](assets/tc03.png) | |
| **TC 4 : Âge contenant des caractères non-numériques** <br>*(Entrées : identiques au TC1 sauf Age = 20ans)* | Message d'erreur (Erreur) | ![TC4](assets/tc04.png) | |
| **TC 5 : Format de courriel invalide (sans @)** <br>*(Entrées : identiques au TC1 sauf Email = clark.tahe_uottawa.ca)* | Message d'erreur (Erreur) | ![TC5](assets/tc05.png) | |
| **TC 6 : Code postal invalide (Format US)** <br>*(Entrées : identiques au TC1 sauf Postal Code = 12345)* | Message d'erreur (Erreur) | ![TC6](assets/tc06.png) | |
| **TC 7 : Code postal canadien mal formaté** <br>*(Entrées : identiques au TC1 sauf Postal Code = J8X3X8 - sans espace)* | Message d'erreur ou correction automatique (À vérifier) | ![TC7](assets/tc07.png) | |
| **TC 8 : Champ obligatoire manquant (UserName)** <br>*(Entrées : identiques au TC1 sauf UserName = vide)* | Message d'erreur (Erreur) | ![TC8](assets/tc08.png) | |

