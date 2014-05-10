## plot3.R
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
png(filename="plot3.png",width=480,height=480,units="px")

#plot data
plot(data$Date,data$Sub_metering_1,
     type="l",
     ylab="Energy sub metering",
     xlab="")
lines(data$Date,data$Sub_metering_2,col="red")
lines(data$Date,data$Sub_metering_3,col="blue")
legend("topright",
       legend=c("Sub_metering_1","Sub_metering_2","Sub_metering_3"),
       col=c("black","red","blue"),
       lty=1)


#close graphics device
dev.off()