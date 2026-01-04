# Script: 02_dataframes.R
# Objectif: Comprendre la structure Tabulaire (Lignes/Colonnes)

# 1. Création des vecteurs (Les briques)
patient_id <- c("P001", "P002", "P003", "P004", "P005")
age <- c(25, 30, 45, 28, 50)
groupe <- c("Placebo", "Traitement", "Placebo", "Traitement", "Traitement")
reponse_clinique <- c(FALSE, TRUE, FALSE, TRUE, TRUE) # TRUE = Guéri

# 2. Assemblage du Dataframe (Le ciment)
# data.frame() colle les vecteurs en colonnes
df_etude <- data.frame(patient_id, age, groupe, reponse_clinique)

# 3. Inspection (Le Diagnostic)
# str() est la fonction la plus importante de R. Elle te montre la structure.
print("--- Structure des données ---")
str(df_etude) 

# 4. Accès aux données avec le signe $ (Le Scalpel)
# Le $ permet d'extraire une seule colonne
print("--- Âges des patients ---")
print(df_etude$age)

# Calculer la moyenne d'âge via le dataframe
moyenne_age <- mean(df_etude$age)
print(paste("Âge moyen de la cohorte :", moyenne_age))

# 5. Indexation Matricielle [Ligne, Colonne] (Le Laser)
# C'est la syntaxe : Dataframe[ QUI , QUOI ]
# Avant la virgule = les lignes. Après la virgule = les colonnes.

print("--- Patient de la ligne 2, colonne 3 ---")
print(df_etude[2, 3]) # Doit afficher "Traitement"

print("--- Toutes les infos du Patient 4 ---")
print(df_etude[4, ]) # On laisse vide après la virgule pour dire "toutes les colonnes"

print("--- Seulement l'âge de tous les patients ---")
print(df_etude[ , 2]) # On laisse vide avant la virgule pour dire "toutes les lignes"
df_etude$score_sante<- c(80, 95, 70, 88, 60)
str(df_etude)