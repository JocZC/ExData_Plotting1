## Read the data set
pwr<- read.table("household_power_consumption.txt",header=T, sep=";", na.strings="?")
#convert into date format
pwr$ndate<- paste(pwr$Date,pwr$Time)
pwr$ndate<- strptime(pwr$ndate,"%d/%m/%Y %H:%M:%S")
pwr$Date<- as.Date(pwr$Date,"%d/%m/%Y" )
## subset the two days fron the data set
s<-pwr$Date=="2007/02/01" |pwr$Date=="2007/02/02"
x<- pwr[s,]

# Second graph
plot(x$ndate,x$Global_active_power,
     type="l",
     ylab="Global Active Power (Kilowatts)",
     xlab=""
     )

#Creates the graph file

dev.copy(png, file="plot2.png")
dev.off()
