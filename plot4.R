#setwd("C:/Users/srapun/Documents/Privat/COURSERA/Courses/R-DataScience/R-Mod04-ExploratoryDataAnalysis/Projects/CursProject1")

#libraries

library(lubridate)

#source functions

source("buildDataSet.R")

#1 Load Dataset

data<-buildDataSet()    #2880 obs. of 9 variables

#2 Handle Date

date<-as.Date(dmy(data$Date))

c_timeDate<-paste(date,data$Time)
#ex: "2007-02-01 00:00:00", character

po_timeDate<-strptime(c_timeDate, format="%Y-%m-%d %H:%M:%S")
#ex: "2007-02-01 00:00:00 CET", "POSIXlt" "POSIXt"

#3 Create plotting dataset

newData<-cbind(po_timeDate,data)

newData<-newData[,-c(2,3)]

names(newData)<-c("timeDate",names(data)[3:9])

#4 Create plots in jpeg-device

png(file="plot4.png")
#width and height of 480 are standard

par(mfrow=c(2,2), mar=c(4,4,2,1))

with(newData, {
  
  # Topleft
  
  plot(timeDate,Global_active_power, col = "black", type = "l",
                             xlab="", ylab="Global Active Power (kilowatts)")
  
  # Topright
  
  plot(timeDate,Voltage, col = "black", type = "l",xlab="datetime")
  
  # Downleft
  
  plot(timeDate,Sub_metering_1, col = "black", type = "l", 
                             xlab="", ylab="Energy sub metering")

  lines(timeDate,Sub_metering_2, col = "red")

  lines(timeDate,Sub_metering_3, col = "blue")
  
  legend("topright", lty=1, col=c("black","red","blue"), 
         legend=c("Sub_metering_1","Sub_metering_2","Sub_metering_3"))
  
  # Downright
  
  plot(timeDate,Global_reactive_power, col = "black", type = "l",xlab="datetime")
    
})

dev.off()
