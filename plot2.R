## Cargar datos y pasar dato a formato fecha

setwd("D:/Flia. Rubio Toro/Documentos/GitHub/ExData_Plotting1")
data1 <- "household_power_consumption.txt"
data <- read.table(data1, header=TRUE, sep=";", stringsAsFactors=FALSE, dec=".")
subSetData <- data[data$Date %in% c("1/2/2007","2/2/2007") ,]
datetime <- strptime(paste(subSetData$Date, subSetData$Time, sep=" "), "%d/%m/%Y %H:%M:%S") 

##### PLOT 2 #######

GlobalActivePower <- as.numeric(subSetData$Global_active_power)
png("plot2.png", width=480, height=480)
plot(datetime, GlobalActivePower, type="l", xlab="", ylab="Global Active Power (kilowatts)")
dev.off() 