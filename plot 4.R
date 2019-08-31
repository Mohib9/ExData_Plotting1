house_power <- read.table("household_power_consumption.txt", sep = ";", header = TRUE)

house_power$Date <- as.character(house_power$Date)

house_power$Date <- as.Date(house_power$Date, "%d/%m/%Y")

house_power_req <- filter(house_power, house_power$Date >= "2007-02-01", house_power$Date <= "2007-02-02")

house_power_req <- mutate(house_power_req, datetime = as.POSIXct(paste(house_power_req$Date, house_power_req$Time), format = "%Y-%m-%d %H:%M:%S"))

house_power_req$Sub_metering_1 <- as.numeric(as.character(house_power_req$Sub_metering_1))

house_power_req$Sub_metering_2 <- as.numeric(as.character(house_power_req$Sub_metering_2))

house_power_req$Sub_metering_3 <- as.numeric(as.character(house_power_req$Sub_metering_3))

house_power_req$Global_reactive_power <- as.numeric(as.character(house_power_req$Global_reactive_power))

house_power_req$Voltage <- as.numeric(as.character(house_power_req$Voltage))

house_power_req$Global_active_power <- as.numeric(as.character(house_power_req$Global_active_power))

par(mfcol = c(2,2))


plot(house_power_req$datetime, house_power_req$Global_active_power, type= "l", xlab = "", ylab = "Global Active Power")


plot(house_power_req$datetime, house_power_req$Sub_metering_1, type = "n", xlab = "", ylab = "Energy Sub Metering")

points(house_power_req$datetime, house_power_req$Sub_metering_1, type = "l")

points(house_power_req$datetime, house_power_req$Sub_metering_2, type = "l", col = "red")

points(house_power_req$datetime, house_power_req$Sub_metering_3, type = "l", col = "blue")

legend("topright", c("Sub_metering_1", "Sub_metering_2", "Sub_metering_3"), lty = c(1,1,1), col = c("black", "red", "blue"), bty = "n")


plot(house_power_req$datetime, house_power_req$Voltage, type= "l", xlab = "datetime", ylab = "Voltage")


plot(house_power_req$datetime, house_power_req$Global_reactive_power, type= "l", xlab = "datetime", ylab = "Global_reactive_power")

dev.copy(png, "plot 4.png")

dev.off()