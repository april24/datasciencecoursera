library(data.table)
library(datasets)
power <- fread("grep ^[12]/2/2007 household_power_consumption.txt",na.strings=c("?",""))
power$DateTime <- as.POSIXct(paste(power$V1, power$V2), format="%d/%m/%Y %H:%M:%S") 

par(mfrow=c(2,2),mar=c(4,4,2,1),oma=c(0,0,2,0))
with(power,{
    plot(DateTime,V3,type="l",xlab="",ylab="Global Active Power")
    plot(DateTime,V5,type="l",xlab="datetime",ylab="Voltage")
    plot(DateTime,V7,ylim=c(0,40),type="l",xlab="",ylab="Energy sub metering")
    par(new=TRUE)
    plot(DateTime,V8,ylim=c(0,40),type="l",col="red",xlab="",ylab="Energy sub metering")
    par(new=TRUE)
    plot(DateTime,V9,ylim=c(0,40),type="l",col="blue",xlab="",ylab="Energy sub metering")
    legend("topright", pch = "_", box.col = "transparent",col = c("black","red", "blue"), legend = c("Sub_metering_1     ", "Sub_metering_2     ","Sub_metering_3     "))
    plot(DateTime,V4,type="l",xlab="datetime",ylab="Global_reactive_power")   
})

dev.copy(png,file="plot4.png")
dev.off()

