# Dante Distribuicao ----

# Distribuicao de emocoes sobre as bases do Dante

rm(list = ls())

# Pacotes ----

library(dplyr)
library(ggplot2)

# Carregando bases ----

setwd('C:\\Users\\ianba\\OneDrive\\Desktop\\shenanigans\\usp\\ic\\poetisa\\data\\')
npreds_emot = read.csv('npreds_emot.csv')
dante_emot = read.csv('dante_completo_com_eixos.csv')

# Criando variavel com o nome das colunas que contem os eixos emocionais
emots = colnames(dante_emot)[4:11]

# Tabelas ----

# Precisamos criar um vetor com a contagem do numero de ocorrencias
# de cada eixo emocional tanto no corpus como um todo quanto no subconjunto
# de tweets como nomes predicativos

# Lembrando que:
  # 1 indica ocorrencia da emocao
  # 0 indica ausencia de emocao
  # -1 indica que os anotadores nao sabiam o que anotar para o par emocional
  # -2 indica que houve um empate entre os anotadores

count_emots = function(df, emot_columns){
  
  # Funcao cria vetor que conta numero de ocorrencias de 1
  # em cada coluna de eixos emocionais
  
  # dataframe apenas com os eixos
  df_emots = df[emot_columns]
  
  # vetor a ser retornado
  vec = c(rep(0, length(emot_columns)))
  
  for(i in 1:nrow(df_emots)){
    
    for(j in 1:ncol(df_emots)){
      
      if(df_emots[i, j] == 1){
        
        vec[j] = vec[j] + 1
        
      }
    }
  }
  return(vec)
}

# Frequencias de ocorrencia de emocoes
dante_counts = count_emots(dante_emot, emots)
npreds_counts = count_emots(npreds_emot, emots)

freq_df = data.frame(emots, dante_counts/nrow(dante_emot), npreds_counts/nrow(npreds_emot))

# Graficos ----

ggplot(freq_df, aes(x=emots)) +
  geom_col(aes(y=dante_counts)) +
  geom_col(aes(y=npreds_counts), position=position_dodge())
