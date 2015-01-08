library(data.table)
library(datasets)
power <- fread("grep ^[12]/2/2007 household_power_consumption.txt",na.strings=c("?",""))
power$DateTime <- as.POSIXct(paste(power$V1, power$V2), format="%d/%m/%Y %H:%M:%S") 

with(power,plot(DateTime,V3,type="l",xlab="",ylab="Global Active Power(kilowatts)"))

dev.copy(png,file="plot2.png")
dev.off()

