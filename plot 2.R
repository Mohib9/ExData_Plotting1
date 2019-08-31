house_power <- read.table("household_power_consumption.txt", sep = ";", header = TRUE)

house_power$Date <- as.character(house_power$Date)

house_power$Date <- as.Date(house_power$Date, "%d/%m/%Y")

house_power_req <- filter(house_power, house_power$Date >= "2007-02-01", house_power$Date <= "2007-02-02")

house_power_req <- mutate(house_power_req, datetime = as.POSIXct(paste(house_power_req$Date, house_power_req$Time), format = "%Y-%m-%d %H:%M:%S"))

house_power_req$Global_active_power <- as.numeric(as.character(house_power_req$Global_active_power))

plot(house_power_req$datetime, house_power_req$Global_active_power, type= "l", xlab = "", ylab = "Global Active Power (kilowatts)")

dev.copy(png, "plot 2.png")

dev.off()