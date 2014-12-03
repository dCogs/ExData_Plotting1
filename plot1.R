# read the table into epc (Electric Power Consumption)
epc <- read.table("household_power_consumption.txt", sep=";", header=TRUE, na.strings="?")
epc <- epc[epc$Date=="2/2/2007" | epc$Date=="1/2/2007",]
epc$Date <- as.Date(epc$Date, "%d/%m/%Y")

# create the assigned plot as a png file
png(filename = "plot1.png",
    width = 480, height = 480, units = "px")
with(epc, hist(Global_active_power, main="Global Active Power", 
               col="red", xlab="Global Active Power (kilowatts)"))
dev.off()