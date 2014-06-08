## Read the data set
pwr<- read.table("household_power_consumption.txt",header=T, sep=";", na.strings="?")
#convert into date format
pwr$ndate<- paste(pwr$Date,pwr$Time)
pwr$ndate<- strptime(pwr$ndate,"%d/%m/%Y %H:%M:%S")
pwr$Date<- as.Date(pwr$Date,"%d/%m/%Y" )
## subset the two days fron the data set
s<-pwr$Date=="2007/02/01" |pwr$Date=="2007/02/02"
x<- pwr[s,]


# Fourth graph
par(mfrow=c(2,2))

plot(x$ndate,x$Global_active_power,
     type="l",
     ylab="Global Active Power (Kilowatts)",
     xlab=""
)

plot(x$ndate,x$Voltage,
     type="l",
     ylab="Voltage",
     xlab="datetime")

plot(x$ndate,x$Sub_metering_1,type="l",
     ylab="Energy sub metering",
     xlab=""
)
lines(x$ndate,x$Sub_metering_2, col="red")
lines(x$ndate,x$Sub_metering_3, col="blue")
legend("topright", lwd=2,col=c("black","red","blue"),
       legend=c("Sub_metering_1","Sub_metering_2","Sub_metering_3"),
       bty="n"
)

plot(x$ndate,x$Global_reactive_power,
     type="h",
     xlab="datetime",
     ylab="Global_reactive_power")


#Creates the graph file

dev.copy(png, file="plot4.png")
dev.off()


