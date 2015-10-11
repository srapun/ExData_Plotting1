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

newData<-data.frame(po_timeDate,data[,7:9])

names(newData)<-c("timeDate",names(data)[7:9])

#4 Plotting in jpeg-device

png(file="plot3.png")
#width and height of 480 are standard

with(newData, plot(timeDate,Sub_metering_1, col = "black", type = "l",
                                  xlab="", ylab="Energy sub metering"))

with(newData, lines(timeDate,Sub_metering_2, col = "red"))

with(newData, lines(timeDate,Sub_metering_3, col = "blue"))

legend("topright", lty=1, col=c("black","red","blue"), 
                legend=c("Sub_metering_1","Sub_metering_2","Sub_metering_3"))

dev.off()