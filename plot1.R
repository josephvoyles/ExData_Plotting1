library(sqldf) 
if(file.exists("project1.Rda")){
  load(file="project1.Rda")
}else{
  sub1 <- read.csv2.sql("household_power_consumption.txt",sql="SELECT * FROM file WHERE Date='1/2/2007' OR Date='2/2/2007'",sep=";",na.strings="?" )
  save(sub1,file="project1.Rda")
}

# plot1
par(mar = c(4,4,4,4))
par(mfrow=c(1,1))
hist(x=sub1$Global_active_power,col="red",xlab="Global Active Power (kilowatts)",main="Global Active Power",cex.main=1)








