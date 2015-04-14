read_data <- function (filename) { 
  data = read.table(filename, sep=';', header=TRUE, na.strings="?")
  data$Date <- as.Date(data$Date, "%d/%m/%Y")
  data[data$Date >= "2007-02-01" & data$Date <= "2007-02-02",]
}

data <- read_data("household_power_consumption.txt")
par(las=2)
plot(data$Global_active_power, type="l", ylab="Globa Active Power(kilowatts)", xlab= "", xaxt="n")
axis(1,at=c(1, 1400, 2800), labels=c("Thursday", "Friday", "Satuday"))
dev.copy(png,"plot2.png", width=480, height=480)
dev.off()