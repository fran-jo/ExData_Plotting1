data<- read.table(file="./household_power_consumption.txt", header=TRUE,sep=";",na.strings="?", stringsAsFactors=FALSE)
doi<- subset(data, data$Date=="1/2/2007" | data$Date=="2/2/2007")
rm(data)
sample<- as.POSIXct(paste(doi$Date, doi$Time), format="%d/%m/%Y %H:%M:%S")
png(filename = "./plot2.png", width = 480, height = 480)
plot(sample,doi$Global_active_power,type="l",xlab="", ylab="Global Active Power (kilowatts)")
dev.off()
