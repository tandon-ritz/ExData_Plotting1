#setwd("D:\\ritesh\\data-science\\JohnHopkins\\course-4-ED\\project-week-1")
x<-read.table("household_power_consumption.txt",sep=";",header=TRUE,as.is=T)
x<-x[x$Date != "?",]
x$Date<-as.Date(x$Date,"%d/%m/%Y")
x<-x[x$Date >= as.Date("01/02/2007","%d/%m/%Y") & x$Date <= as.Date("02/02/2007","%d/%m/%Y"),]
library(datasets)
hist(as.numeric(x$Global_active_power), xlab="Global Active Power (Kilowatts)", col="red",main="Global Active Power")
dev.copy(png,file="plot1.png",width=480,height=480)
dev.off()
