library(RSQLite)
con<-dbConnect("SQLite", dbname="sample_db.sqlite")
dbWriteTable(con, name="sample_table", value="household_power_consumption.txt", row.names=FALSE, header=TRUE, sep=";")
mydata3<-dbGetQuery(con, "SELECT * FROM sample_table where Date='1/2/2007' or Date='2/2/2007'")


png(filename = "plot4.png")
par(mfrow=c(2,2))

plot(mydata3$PTime,mydata3$Global_active_power,type="l", xlab="",ylab="Global Active Power")
plot(mydata3$PTime,mydata3$Voltage,type="l", xlab="datetime",ylab="Voltage")

plot(x=mydata3$PTime,y=mydata3$Sub_metering_1,type="l", xlab="",ylab="Energy Sub Metering")
lines(x=mydata3$PTime,y=mydata3$Sub_metering_2, type="l",col="red")
lines(x=mydata3$PTime,y=mydata3$Sub_metering_3, type="l",col="blue")
legend("topright",c("Sub Metering 1","Sub Metering 2", "Sub Metering 3"),lty=c(1,1,1),lwd=c(2.5,2.5,2.5),col=c("black","blue","red"))

plot(mydata3$PTime,mydata3$Global_reactive_power,type="l", xlab="datetime",ylab="Global_reactive_power")
dev.off()
