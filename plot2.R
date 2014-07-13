library(sqldf)
if(file.exists("project1.Rda")){
  load(file="project1.Rda")
}else{
  sub1 <- read.csv2.sql("household_power_consumption.txt",sql="SELECT * FROM file WHERE Date='1/2/2007' OR Date='2/2/2007'",sep=";",na.strings="?" )
  save(sub1,file="project1.Rda")
}


# plot 2
par(mar = c(4,4,4,4))
par(mfrow=c(1,1))
dates <- c(weekdays(as.Date("1-2-2007",'%d-%m-%Y'),abbreviate=TRUE),weekdays(as.Date("2-2-2007",'%d-%m-%Y'),abbreviate=TRUE),weekdays(as.Date("3-2-2007",'%d-%m-%Y'),abbreviate=TRUE))
plot(sub1$Global_active_power,xaxt="n",type="n",ylab="",xlab="")
mtext("Global Active Power (kilowatts)", side=2, line=2.2, cex=.7)
lines(sub1$Global_active_power)
axis(1,at=c(1,nrow(sub1)/2,nrow(sub1)), labels=dates,tick=TRUE,cex.axis=.7)
