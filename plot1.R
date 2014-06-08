## Read the data set
pwr<- read.table("household_power_consumption.txt",header=T, sep=";", na.strings="?")
#convert into date format
pwr$ndate<- paste(pwr$Date,pwr$Time)
pwr$ndate<- strptime(pwr$ndate,"%d/%m/%Y %H:%M:%S")
pwr$Date<- as.Date(pwr$Date,"%d/%m/%Y" )
## subset the two days fron the data set
s<-pwr$Date=="2007/02/01" |pwr$Date=="2007/02/02"
x<- pwr[s,]

# First graph
hist(x$Global_active_power,
     main="Global Active Power",
     col="red",
     xlab="Global Active Power (kilowatts)"
)

#Creates the graph file

dev.copy(png, file="plot1.png")
dev.off()
