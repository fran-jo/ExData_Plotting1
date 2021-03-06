data<- read.table(file="./household_power_consumption.txt", header=TRUE,sep=";",na.strings="?", stringsAsFactors=FALSE)
doi<- subset(data, data$Date=="1/2/2007" | data$Date=="2/2/2007")
rm(data)
sample<- as.POSIXct(paste(doi$Date, doi$Time), format="%d/%m/%Y %H:%M:%S")
png(filename = "./plot4.png", width = 480, height = 480)
par(mfrow=c(2,2))
# first plot (1,1)
plot(sample,doi$Global_active_power,type="l",xlab="", ylab="Global Active Power (kilowatts)")
# second plot (1,2)
plot(sample,doi$Voltage,type="l",xlab="datetime", ylab="Voltage")
# third plot (2,1)
plot(sample,doi$Sub_metering_1,type="n",xlab="", ylab="Energy sub metering")
lines(sample,doi$Sub_metering_1,type="l", col="black")
lines(sample,doi$Sub_metering_2,type="l", col="red")
lines(sample,doi$Sub_metering_3,type="l", col="blue")
legend("topright", lty=c(1,1), col= c("black","red","blue"), legend= c("Sub_metering_1", "Sub_metering_2","Sub_metering_3"))
# forth plot (2,2)
with(doi,plot(sample,Global_reactive_power,type="l",xlab="datetime"))
dev.off()
