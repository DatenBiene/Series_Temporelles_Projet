## Question 7

serieQ7 <- ts(data$indice, start=0, end=346)
predQ7 = sarima.for(serieQ7,n.ahead=2,8,1,1,4,1,0,S=12)

ypred7 = predQ7$pred

inf7 = ypred7 -1.96*predQ7$se #int conf 95%
sup7 = ypred7 +1.96*predQ7$se

plot(x=seq(2018+6/12,2019+1/12,1/12),data$indice[342:349],col='blue',type='o', ylim=c(50,150), ylab='Index',xlab='Date (year)') # bleu = vraie serie
lines(x=seq(2018+6/12,2019+1/12,1/12), c(rep('',6),ypred7),type="o",col='red',lwd=2)
lines(x=seq(2018+6/12,2019+1/12,1/12),c(rep('',6),as.vector(inf7)),col='green', type='c')
lines(x=seq(2018+6/12,2019+1/12,1/12),c(rep('',6),as.vector(sup7)),col='green', type='c')
legend('topleft', legend=c("Index","Confidence interval (95%)","Forecasting"),
       col=c("blue","green","red"),lty=1:2, cex=0.8)

sqrt(mean((data$indice[348:349]-ypred42)**2))