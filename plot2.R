## plot2.R
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
png(filename="plot2.png",width=480,height=480,units="px")

#plot data
plot(data$Date,data$Global_active_power,
     type="l",
     ylab="Global Active Power (killowatts)",
     xlab="")

#close graphics device
dev.off()