# Script: 05_mutate.R
# Objectif: Créer et Recoder des variables (mutate & case_when)

library(tidyverse)

# 1. Données simulées : Une cohorte de patients
df_patients <- data.frame(
  id = 1:5,
  poids_kg = c(70, 95, 50, 105, 60),
  taille_cm = c(175, 180, 160, 170, 165),
  statut_fumeur = c("Oui", "Non", "Ex-fumeur", "Oui", "Non")
)

print("--- Données Brutes ---")
print(df_patients)

# 2. Utilisation de MUTATE pour des calculs mathématiques
# On veut l'IMC. Formule : Poids / Taille(m)^2
# Problème : La taille est en cm. Il faut la convertir à la volée.

df_calcule <- df_patients %>% 
  mutate(
    taille_m = taille_cm / 100,            # Étape 1 : Créer taille en mètres
    bmi = poids_kg / (taille_m ^ 2),       # Étape 2 : Calculer l'IMC
    bmi = round(bmi, 2)                    # Étape 3 : Arrondir (on écrase la colonne bmi)
  )

print("--- Avec IMC calculé ---")
print(df_calcule)

# 3. Utilisation de CASE_WHEN pour la catégorisation
# C'est le "If / Else" des pros.
# Si BMI < 18.5 -> Maigreur
# Si BMI >= 30 -> Obésité
# Sinon -> Normal

df_final <- df_calcule %>% 
  mutate(
    categorie_bmi = case_when(
      bmi < 18.5 ~ "Maigreur",
      bmi >= 30  ~ "Obésité",
      TRUE       ~ "Normal"   # Le "TRUE" ici signifie "Pour tout le reste (Else)"
    )
  )

print("--- Avec Catégories ---")
print(df_final)

# 4. Le piège classique : Oublier de sauvegarder
# Si tu fais juste : df_final %>% mutate(...)
# R va t'afficher le résultat dans la console, mais df_final ne changera pas !
# Tu dois toujours faire : df_final <- df_final %>% mutate(...)

df_risque_cardio <- df_final %>% 
  mutate(
    categorie_risque_cardio = case_when(
      statut_fumeur == "Oui" | categorie_bmi == "Obésité" ~ "Élevé",
      TRUE ~ "Faible"
    )
  )

print(df_risque_cardio)