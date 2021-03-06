# plot3
library(lubridate)
library(dplyr)
path <- 'C:/POC/R_project/quiz_exploring_week1/datahousehold_power_consumption'

if(!exists('path')) {path <- getw}
setwd(path)

df0 <- read.table('household_power_consumption.txt', sep = ';', header = TRUE, colClasses = c('character','character','numeric','numeric','numeric','numeric','numeric','numeric'), na.strings = "?")
df <- df0 %>% 
  mutate(DateTime = dmy_hms(paste(Date, Time))) %>% 
  select(DateTime, Global_active_power:Sub_metering_3) %>%
  filter(DateTime >= ymd_hms('2007-02-01 00:00:00'), DateTime <= ymd_hms('2007-02-02 23:59:59'))

png('plot3.png', width = 480, height = 480)
plot(df$DateTime, df$Sub_metering_1, type='l',col='black', ylab='Energy Sub Metering', xlab='')
lines(df$DateTime, df$Sub_metering_2, type='l', col='red')
lines(df$DateTime, df$Sub_metering_3, type='l', col='blue')
legend('topright', legend=c('Sub_metering_1','Sub_metering_2','Sub_metering_3'), lty=c(1,1,1),
       lwd=c(2.5,2.5,2.5),col=c('black','red','blue')) 
dev.off()
