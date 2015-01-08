library(data.table)
library(datasets)
power <- fread("grep ^[12]/2/2007 household_power_consumption.txt",na.strings=c("?",""))
power$DateTime <- as.POSIXct(paste(power$V1, power$V2), format="%d/%m/%Y %H:%M:%S") 

hist(power$V3,main="Global Active Power",col="red",xlab="Global Active Power(kilowatts)")

dev.copy(png,file="plot1.png")
dev.off()





