
read_data <- function (filename) { 
    data = read.table(filename, sep=';', header=TRUE, na.strings="?")
    data$Date <- as.Date(data$Date, "%d/%m/%Y")
    data[data$Date >= "2007-02-01" & data$Date <= "2007-02-02",]
}

data <- read_data("household_power_consumption.txt")
hist(data$Global_active_power,col="red", main="Global Active power", xlab="Global Active Power (kilowats)", labels=c(0,200,400,600,800,1000,1100,1200), cex.axis=0.5)
dev.copy(png, "plot1.png", width=480, height=480)
dev.off()

