library(sqldf)

if(file.exists("project1.Rda")){
  load(file="project1.Rda")
}else{
  sub1 <- read.csv2.sql("household_power_consumption.txt",sql="SELECT * FROM file WHERE Date='1/2/2007' OR Date='2/2/2007'",sep=";",na.strings="?" )
  save(sub1,file="project1.Rda")
}

par(mar = c(4,4,4,4))
par(mfrow=c(1,1))
plot(sub1$Sub_metering_1,xaxt="n",xlab="",ylab="",type="n")
mtext("Energy Sub Metering", side=2, line=2.2, cex=1)
lines(sub1$Sub_metering_1)
lines(sub1$Sub_metering_2,col="Red")
lines(sub1$Sub_metering_3,col="Blue")
axis(1,at=c(1,nrow(sub1)/2,nrow(sub1)), labels=dates,tick=TRUE,cex.axis=.7)
legend("topright", cex=0.6,lty=c(1,1,1),col=c("black","red","blue"),legend=c("Sub_metering_1","Sub_metering_2","Sub_metering_3"))
