# Script: 01_basics.R
# Author: [Ton Nom]
# Date: [Aujourd'hui]

# 1. Assignation de variables (On utilise <- et pas =)
age <- 35
poids <- 85
taille_cm <- 180

# 2. Calcul simple
bmi <- poids / (taille_cm / 100)^2

# 3. Création de vecteurs (c = combine)
# Supposons 5 patients
systolic_bp <- c(120, 130, 145, 110, 160)
diastolic_bp <- c(80, 85, 90, 70, 100)

# 4. Opérations vectorielles (La puissance de R)
# R calcule pour tout le vecteur d'un coup. Pas besoin de boucle.
mean_bp <- (systolic_bp + diastolic_bp) / 2

# 5. Afficher les résultats
print(paste("Mon BMI est :", round(bmi, 2)))
print("Pression artérielle moyenne des 5 patients :")
print(mean_bp)
