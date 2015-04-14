read_data <- function (filename) { 
  data = read.table(filename, sep=';', header=TRUE, na.strings="?")
  data$Date <- as.Date(data$Date, "%d/%m/%Y")
  data[data$Date >= "2007-02-01" & data$Date <= "2007-02-02",]
}

data <- read_data("household_power_consumption.txt")

par(mfrow=c(2,2))
par(las=2)
plot(data$Global_active_power, type="l", ylab="Globa Active Power(kilowatts)", xlab= "", xaxt="n")
axis(1,at=c(1, 1400, 2800), labels=c("Thursday", "Friday", "Satuday"))


par(las=2)
plot(data$Voltage, type="l", ylab="Voltage", xlab= "datetime", xaxt="n")
axis(1,at=c(1, 1400, 2800), labels=c("Thursday", "Friday", "Satuday"), cex.axis=0.5)


par(las=2)
plot(data$Sub_metering_1, type="l", ylab="Energy Submetering", xlab= "", xaxt="n")
lines(data$Sub_metering_2, col="blue")
lines(data$Sub_metering_3, col="red")
axis(1,at=c(1, 1400, 2800), labels=c("Thursday", "Friday", "Satuday"))
 legend("topright", legend=c("Sub_metering_1", "Sub_metering_2", "Sub_metering_3"), col=c("black", "blue", "red"), lwd=2)



par(las=2)
plot(data$Global_reactive_power, type="l", ylab="Global_reactive_power", xlab= "datetime", xaxt="n")
axis(1,at=c(1, 1400, 2800), labels=c("Thursday", "Friday", "Satuday"), cex.axis=0.5)

dev.copy(png,"plot4.png", width=480, height=480)
dev.off()