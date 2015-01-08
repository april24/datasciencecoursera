library(data.table)
library(datasets)
power <- fread("grep ^[12]/2/2007 household_power_consumption.txt",na.strings=c("?",""))
power$DateTime <- as.POSIXct(paste(power$V1, power$V2), format="%d/%m/%Y %H:%M:%S") 

with(power,plot(DateTime,V7,ylim=c(0,40),type="l",xlab="",ylab="Energy sub metering"))
par(new=TRUE)
with(power,plot(DateTime,V8,ylim=c(0,40),type="l",col="red",xlab="",ylab="Energy sub metering"))
par(new=TRUE)
with(power,plot(DateTime,V9,ylim=c(0,40),type="l",col="blue",xlab="",ylab="Energy sub metering"))
legend("topright",lty = c(1, 1, 1), col = c("black","red", "blue"),legend = c("Sub_metering_1       ", "Sub_metering_2       ","Sub_metering_3       "))

dev.copy(png,file="plot3.png")
dev.off()



