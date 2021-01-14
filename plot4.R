## Cargar datos y pasar dato a formato fecha

setwd("D:/Flia. Rubio Toro/Documentos/GitHub/ExData_Plotting1")
data1 <- "household_power_consumption.txt"
data <- read.table(data1, header=TRUE, sep=";", stringsAsFactors=FALSE, dec=".")
subSetData <- data[data$Date %in% c("1/2/2007","2/2/2007") ,]
datetime <- strptime(paste(subSetData$Date, subSetData$Time, sep=" "), "%d/%m/%Y %H:%M:%S") 

##### PLOT 4 #######

GlobalActivePower <- as.numeric(subSetData$Global_active_power)
GlobalReactivePower <- as.numeric(subSetData$Global_reactive_power)
Voltage <- as.numeric(subSetData$Voltage)
SubMetering1 <- as.numeric(subSetData$Sub_metering_1)
SubMetering2 <- as.numeric(subSetData$Sub_metering_2)
SubMetering3 <- as.numeric(subSetData$Sub_metering_3)


png("plot4.png", width=480, height=480)
par(mfrow = c(2, 2)) 

plot(datetime, GlobalActivePower, type="l", xlab="", ylab="Global Active Power", cex=0.2)
plot(datetime, Voltage, type="l", xlab="datetime", ylab="Voltage")
plot(datetime, SubMetering1, type="l", ylab="Energy Sub metering", xlab="")
lines(datetime, subMetering2, type="l", col="red")
lines(datetime, subMetering3, type="l", col="blue")
legend("topright", c("Sub_metering_1", "Sub_metering_2", "Sub_metering_3"), lty=, lwd=2.5, col=c("black", "red", "blue"), bty="o")
plot(datetime, GlobalReactivePower, type="l", xlab="datetime", ylab="Global_reactive_power")

dev.off() 