#install.packages("lubridate")
library(lubridate)

#Données
data_0 = read.csv('valeurs_mensuelles.csv',sep=';')

#Dimensions 
dim(data_0) # (352,3)
data = data_0[352:4,1:2] #Remplacer 4 par 3 si on veut Fevrier 2019

#Noms Colonnes
names(data) <- c("date","indice")

#On transforme les dates en format timestamp
date_format <- function(x) paste(x,"-01 00:00:00",sep="")
data$date<-ymd_hms(sapply(data$date,date_format))

#Graphique 
plot(x=data$date, y=data$indice, type='l', ylab='Indice de production',xlab='Date')


