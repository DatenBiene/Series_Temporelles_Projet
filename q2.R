#install.packages('tseries')
library(tseries)


#Données
data = data[-349,1:2] #Ici on ne veut pas Fevrier 2019
serie <- ts(data$indice)
serieD <- (serie - lag(serie,-12)) # On enleve la saisonnalite D=1
serieD2 = (serieD - lag(serieD,-1)) #on rajoute une différence : d=1, toujours D=1

#Autocorrélogrammes
acf_serie = acf(serie, lag.max = 36)
acf_serieD = acf(serieD, lag.max = 36)
acf_serieD2 = acf(serieD2, lag.max = 36)

#Tests 
##Test de Dickey-Fuller
adf1<-adf.test(serieD) #L'hypothèse de non-stat est rejetée à 1%, pas de racine unitaire
adf2<-adf.test(serieD2) #L'hypothèse de non-stat est rejetée à 1%, pas de racine unitaire


##Test de Phillips-Perron
pp1 <- pp.test(serieD) #Mieux que DF car par d'hyp sur les résidus, H0 rejetée -> stationnaire
pp2 <- pp.test(serieD2) #Mieux que DF car par d'hyp sur les résidus, H0 rejetée -> stationnaire

##Test de KPSS
kpss1 <- kpss.test(serieD, null='Trend') # PAS STATIONNAIRE : H0 = stationnaire
kpss2 <- kpss.test(serieD, null='Level') # PAS STATIONNAIRE : H0 = stationnaire
kpss3 <- kpss.test(serieD2, null='Trend') # STATIONNAIRE : H0 = stationnaire
kpss4 <- kpss.test(serieD2, null='Level') # STATIONNAIRE : H0 = stationnaire

#adf1
#adf2
#pp1
#pp2
#kpss1
#kpss2
#kpss3
#kpss4
