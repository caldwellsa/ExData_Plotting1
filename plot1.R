## plot1.R
## For Coursera Exploratory Data Analysis, Course project 1
#
#
# read data from local file
data<-read.table("household_power_consumption.txt",header=TRUE,
                 sep=";",na.strings="?")

#reduce dataset to only include the days we care about
data<-data[data$Date=="1/2/2007"|data$Date=="2/2/2007",]

#open PNG device
png(filename="plot1.png",width=480,height=480,units="px")

#plot data
hist(data$Global_active_power,
     xlab="Global Active Power (kilowatts)",
     main="Global Active Power",
     col="red")

#close graphics device
dev.off()