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

newData<-data.frame(po_timeDate,data$Global_active_power)

names(newData)<-c("timeDate","Global_active_power")

#4 Plotting in jpeg-device

png(file="plot2.png")
#width and height of 480 are standard

with(newData, plot(timeDate,Global_active_power, col = "black", type = "l",
                   xlab="", ylab="Global Active Power (kilowatts)"))

dev.off()




