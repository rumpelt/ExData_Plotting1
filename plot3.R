read_data <- function (filename) { 
  data = read.table(filename, sep=';', header=TRUE, na.strings="?")
  data$Date <- as.Date(data$Date, "%d/%m/%Y")
  data[data$Date >= "2007-02-01" & data$Date <= "2007-02-02",]
}

data <- read_data("household_power_consumption.txt")
par(las=2)
plot(data$Sub_metering_1, type="l", ylab="Energy Submetering", xlab= "", xaxt="n")
lines(data$Sub_metering_2, col="blue")
lines(data$Sub_metering_3, col="red")
axis(1,at=c(1, 1400, 2800), labels=c("Thursday", "Friday", "Satuday"))
 legend("topright", legend=c("Sub_metering_1", "Sub_metering_2", "Sub_metering_3"), col=c("black", "blue", "red"), lwd=2)
dev.copy(png,"plot3.png", width=480, height=480)
dev.off()