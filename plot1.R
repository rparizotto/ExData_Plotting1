# plot1
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

png('plot1.png', width = 480, height = 480)
hist(df$Global_active_power, col='red', xlab='Global Active Power (kilowatts)', main = 'Global Active Power')
dev.off()


