## plot4.R
## For Coursera Exploratory Data Analysis, Course project 1
#
#
# read data from local file
data<-read.table("household_power_consumption.txt",header=TRUE,
                 sep=";",na.strings="?")

#reduce dataset to only include the days we care about
data<-data[data$Date=="1/2/2007"|data$Date=="2/2/2007",]

#convert Date and Time to R Date
data$Date<-strptime(paste(data$Date,data$Time,sep=" "),
                     "%d/%m/%Y %T")
#names(data)[names(data)=="Time"]<-"Weekday"
#data$Weekday<-as.character.Date(data$Date,"%a")

#open PNG device
png(filename="plot4.png",width=480,height=480,units="px")

par(mfrow=c(2,2))
#plot data upperleft
plot(data$Date,data$Global_active_power,
     type="l",
     ylab="Global Active Power (killowatts)",
     xlab="")

#plot data upperright
plot(data$Date,data$Voltage,
     type="l",
     ylab="Voltage",
     xlab="datetime")

#plot data lowerleft
plot(data$Date,data$Sub_metering_1,
     type="l",
     ylab="Energy sub metering",
     xlab="")
lines(data$Date,data$Sub_metering_2,col="red")
lines(data$Date,data$Sub_metering_3,col="blue")
legend("topright",
       legend=c("Sub_metering_1","Sub_metering_2","Sub_metering_3"),
       col=c("black","red","blue"),
       lty=1,
       bty="n")

#plot data lowerright
plot(data$Date,data$Global_reactive_power,
     type="l",
     ylab="Global_reactive_power",
     xlab="datetime")

#close graphics device
dev.off()