library(RSQLite)
con<-dbConnect("SQLite", dbname="sample_db.sqlite")
dbWriteTable(con, name="sample_table", value="household_power_consumption.txt", row.names=FALSE, header=TRUE, sep=";")
mydata3<-dbGetQuery(con, "SELECT * FROM sample_table where Date='1/2/2007' or Date='2/2/2007'")

mydata3$PTime<-as.POSIXct(strptime(paste(mydata3$Date, mydata3$Time),"%d/%m/%Y %H:%M:%S"))
png(filename="plot2.png")
plot(mydata3$PTime, mydata3$Global_active_power,type="l", xlab="", ylab="Global Active Power (kilowatts)")
dev.off()

