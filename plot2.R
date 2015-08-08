#setwd("D:\\ritesh\\data-science\\JohnHopkins\\course-4-ED\\project-week-1")
x<-read.table("household_power_consumption.txt",sep=";",header=TRUE,as.is=T)
x<-x[x$Date != "?",]
x$Date<-as.Date(x$Date,"%d/%m/%Y")
x<-x[x$Date >= as.Date("01/02/2007","%d/%m/%Y") & x$Date <= as.Date("02/02/2007","%d/%m/%Y"),]
library(datasets)
library(lubridate)
x$DateTime <- paste(as.character(x$Date), as.character(x$Time))
x$DateTime <- strptime(x$DateTime, format='%Y-%m-%d %H:%M:%S')
#x<-cbind(x,x$DateTime)
with(x,plot(x$DateTime,x$Global_active_power,type="l",xlab="",ylab="Global Active Power (Kilowatts)"))
dev.copy(png,file="plot2.png",width=480,height=480)
dev.off()