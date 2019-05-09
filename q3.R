# Serie X
plot(x=data$date, y=serie, type='l', ylab='X',xlab='Date')

# Serie Y
dates_seriesD2 <- data$date[(length(data$date)-length(serieD2)+1):length(data$date)]
plot(x=dates_seriesD2, y=serieD2, type='l', ylab='Y',xlab='Date')
