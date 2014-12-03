# read the table into epc (Electric Power Consumption)
epc <- read.table("household_power_consumption.txt", sep=";", header=TRUE, na.strings="?")
epc <- epc[epc$Date=="2/2/2007" | epc$Date=="1/2/2007",]
epc$Date <- as.Date(epc$Date, "%d/%m/%Y")
epc$Time <- strptime(paste(epc$Date, epc$Time, sep=" "), format="%Y-%m-%d %H:%M:%S")

# create the assigned plot as a png file
png(filename = "plot2.png", width = 480, height = 480, units = "px")
with(epc, plot(Time, Global_active_power, type="n", xlab="", ylab="Global Active Power (kilowatts)"))
with(epc, lines(Time, Global_active_power))
dev.off()