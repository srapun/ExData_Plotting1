#setwd("C:/Users/srapun/Documents/Privat/COURSERA/Courses/R-DataScience/R-Mod04-ExploratoryDataAnalysis/Projects/CursProject1")

#libraries

#source functions

source("buildDataSet.R")

#1 Load Dataset

data<-buildDataSet()    #2880 obs. of 9 variables

#2 Plotting in jpeg-Device

png(file="plot1.png")
#width and height of 480 are standard

hist(data$Global_active_power,co="red", 
     main="Global Active Power", xlab="Global Active Power (kilowatts)")

dev.off()
