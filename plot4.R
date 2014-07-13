library(sqldf)

if(file.exists("project1.Rda")){
  load(file="project1.Rda")
}else{
  sub1 <- read.csv2.sql("household_power_consumption.txt",sql="SELECT * FROM file WHERE Date='1/2/2007' OR Date='2/2/2007'",sep=";",na.strings="?" )
  save(sub1,file="project1.Rda")
}

# plot 4
par(mar = c(4,4,2,2))
par(mfrow=c(2,2))
dates <- c(weekdays(as.Date("1-2-2007",'%d-%m-%Y'),abbreviate=TRUE),weekdays(as.Date("2-2-2007",'%d-%m-%Y'),abbreviate=TRUE),weekdays(as.Date("3-2-2007",'%d-%m-%Y'),abbreviate=TRUE))
plot(sub1$Global_active_power,xaxt="n",type="n",xlab="",ylab="",yaxt="n")
mtext("Global Active Power", side=2, line=2.2, cex=.5)
lines(sub1$Global_active_power)
axis(1,at=c(1,nrow(sub1)/2,nrow(sub1)), labels=dates,tick=TRUE,cex.axis=.5,padj=-2)
axis(2,cex.axis=.5)


plot(sub1$Voltage,xaxt="n",type="n",xlab="",ylab="",yaxt="n")
mtext("Voltage", side=2, line=2.2, cex=.5,padj=0)
mtext("datetime", side=1, line=2.2, cex=.5,padj=-2)
lines(sub1$Voltage)
axis(1,at=c(1,nrow(sub1)/2,nrow(sub1)), labels=dates,tick=TRUE,cex.axis=.5,padj=-2)
axis(2,cex.axis=.5)


plot(sub1$Sub_metering_1,xaxt="n",xlab="",ylab="",type="n",yaxt="n")
mtext("Energy Sub Metering", side=2, line=2.2, cex=.5,padj=0)
lines(sub1$Sub_metering_1)
lines(sub1$Sub_metering_2,col="Red")
lines(sub1$Sub_metering_3,col="Blue")
axis(1,at=c(1,nrow(sub1)/2,nrow(sub1)), labels=dates,tick=TRUE,cex.axis=.5,padj=-2)
axis(2,cex.axis=.5)
legend("topright", bty="n", cex=0.4,lty=c(1,1,1),col=c("black","red","blue"),legend=c("Sub_metering_1","Sub_metering_2","Sub_metering_3"))


plot(sub1$Global_reactive_power,xaxt="n",type="n",xlab="",ylab="",yaxt="n")
lines(sub1$Global_reactive_power)
axis(2,cex.axis=.5)
axis(1,at=c(1,nrow(sub1)/2,nrow(sub1)), labels=dates,tick=TRUE,cex.axis=.5,padj=-2)
mtext("Global_reactive_power", side=2, line=2.2, cex=.5,padj=0)
mtext("datetime", side=1, line=2.2, cex=.5,padj=-2)
