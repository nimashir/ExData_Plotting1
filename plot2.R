#setwd("C:/Users/nima/Desktop/R/Explanatory analysis")
if(!file.exists("./project1")){dir.create("./project1")}
url<- "https://d396qusza40orc.cloudfront.net/exdata%2Fdata%2Fhousehold_power_consumption.zip"
dest<-"./project1/zippedFile.zip"
download.file(url, destfile = dest)
#read whole file
Original.Data<- read.table(unzip(dest,"household_power_consumption.txt"), header = T, sep = ";", stringsAsFactors = F,  na.strings="?")

Data<- subset(Original.Data, Date == "1/2/2007"|Date == "2/2/2007")
Data$DateTime <- paste(Data$Date,Data$Time)
Data$DateTime <- strptime(Data$DateTime, format = "%d/%m/%Y%H:%M:%S")

png(filename = "./project1/plot2.png", width = 480, height = 480, units = "px")


par("mar"=c(3,4.5,3,3));

plot(Data$DateTime ,Data$Global_active_power, type = "n", xlab = "", ylab = "Global Active Power (kilowatts)")
lines(Data$DateTime ,Data$Global_active_power)


dev.off()



