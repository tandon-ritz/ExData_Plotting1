#setwd("D:\\ritesh\\data-science\\JohnHopkins\\course-4-ED\\project-week-1")
x<-read.table("household_power_consumption.txt",sep=";",header=TRUE,as.is=T)
x<-x[x$Date != "?",]
x$Date<-as.Date(x$Date,"%d/%m/%Y")
x<-x[x$Date >= as.Date("01/02/2007","%d/%m/%Y") & x$Date <= as.Date("02/02/2007","%d/%m/%Y"),]
library(datasets)
library(lubridate)
x$DateTime <- paste(as.character(x$Date), as.character(x$Time))
x$DateTime <- strptime(x$DateTime, format='%Y-%m-%d %H:%M:%S')
par(mfrow=c(2,2),mar=c(4,4,1,1),oma=c(0,0,1,1))

with(x, {
  
  plot(x$DateTime,x$Global_active_power,type="l",xlab="",ylab="Global Active Power")
  
  plot(x$DateTime,x$Voltage,type="l",xlab="datetime",ylab="Voltage")
  
  plot(x$DateTime,x$Sub_metering_1,type="n",xlab="",ylab="Energy sub metering")
  lines(x$DateTime,x$Sub_metering_1,type="l",xlab="",ylab="Energy Sub Metering")
  lines(x$DateTime,x$Sub_metering_2,type="l",col="red",xlab="",ylab="Energy Sub Metering")
  lines(x$DateTime,x$Sub_metering_3,type="l",col="blue",xlab="",ylab="Energy Sub Metering")
  legend("topright",pch=NA,lwd=1,cex=0.5,bty="n",col=c("black","red","blue"),legend=c("sub_metering_1","sub_metering_2","sub_metering_3"))
  
  plot(x$DateTime,x$Global_reactive_power,type="l",xlab="datetime",ylab="Global_reactive_power")
  
})

dev.copy(png,file="plot4.png",width=480,height=480)
dev.off()
