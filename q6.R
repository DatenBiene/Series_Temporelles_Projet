## Question 6
# limite : normalite residus

qqnorm(est4$fit$residuals, main='Q-Q Plot pour le modele SARIMA{12}[(8,1,1),(4,1,0)]')
qqline(est4$fit$residuals) #residus normaux

jarque.bera.test(est4$fit$residuals)