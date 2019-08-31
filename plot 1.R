##reading data from text file
house_power <- read.table("household_power_consumption.txt", sep = ";", header = TRUE)

house_power$Date <- as.character(house_power$Date)

house_power$Date <- as.Date(house_power$Date, "%d/%m/%Y")

house_power_req <- filter(house_power, house_power$Date >= "2007-02-01", house_power$Date <= "2007-02-02")

house_power_req$Global_active_power <- as.numeric(as.character(house_power_req$Global_active_power))

hist(house_power_req$Global_active_power, main = "Global Active Power", xlab = "Global Active Power (killowatts)", ylab = "Frequency", col = "red")

dev.copy(png, "plot 1.png")

dev.off()