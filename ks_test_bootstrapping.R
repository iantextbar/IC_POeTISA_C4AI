# DanteStocks - Emotion Distribution on npreds ----

rm(list = ls())

library(twosamples)
library(KSgeneral)

# Data ----

path = 'C:\\Users\\ianba\\OneDrive\\Desktop\\shenanigans\\usp\\ic\\poetisa\\data'

npreds_emot = read.csv(paste0(path, '\\npreds_emot.csv'))
dante_emot_nonpreds = read.csv(paste0(path, '\\dante_nonpreds.csv'))

# Creating the emotion frequencies ----

{emot_freq_npred = c(rep(0, 8))
emot_freq_dante = c(rep(0, 8))

# creating the frequencies of emotions
# of tweets with npreds
for (i in 1:nrow(npreds_emot)) {

  for (j in 3:(ncol(npreds_emot_same_shape) - 6)) {
    
    if (npreds_emot_same_shape[i, j] == 1) {
      emot_freq_npred[j-2] = emot_freq_npred[j-2] + 1
    }
  }
}

# creating the frequencies of emotions
# for the tweets without npreds
for (i in 1:nrow(dante_emot_nonpreds)) {

  for (j in 3:(ncol(dante_emot_nonpreds) - 6)) {

    if (dante_emot_nonpreds[i, j] == 1) {
      emot_freq_dante[j-2] = emot_freq_dante[j-2] + 1
    }
  }
}

}

{
  emot_freq_npred_rel = emot_freq_npred/nrow(npreds_emot)
  emot_freq_dante_rel = emot_freq_dante/nrow(dante_emot_nonpreds)
}

# Two-Sample Kolmogorov-Smirnov Test ----
ks.test(emot_freq_dante_rel, emot_freq_npred_rel, B = 50000)
ks.test(emot_freq_dante, 'punif')
ks.test(emot_freq_npred, 'punif')

# ver implementacao e formula para entender como R calcula
ks_test(emot_freq_dante_rel, emot_freq_npred_rel, nboots=100000)
ks_test(emot_freq_dante, emot_freq_npred, nboots=100000)

ks_test(emot_freq_dante_rel, 'punif', nboots=10000)

ks_test(emot_freq_npred_rel, 'punif', nboots=10000)

# Anderson-Darling Test
ad_test(emot_freq_dante_rel, emot_freq_npred_rel, nboots=100000)

# Teste Chi-Quadrado
amostras = data.frame(emot_freq_dante, emot_freq_npred, row.names = c('TRU', 'DIS', 'JOY', "SAD","ANT", "SUR", "ANG", "FEA"))
chisq.test(amostras)

# testar com o pacote KSgeneral

KSgeneral::disc_ks_test(emot_freq_dante, 'punif', exact=TRUE)
