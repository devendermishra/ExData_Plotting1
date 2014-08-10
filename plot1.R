library(RSQLite)
#Get the data
con<-dbConnect("SQLite", dbname="sample_db.sqlite")
dbWriteTable(con, name="sample_table", value="household_power_consumption.txt", row.names=FALSE, header=TRUE, sep=";")
mydata3<-dbGetQuery(con, "SELECT * FROM sample_table where Date='1/2/2007' or Date='2/2/2007'")

png("plot1.png")
hist(x = mydata3$Global_active_power, main="Global Active Power", col="red", xlab="Global Active Power (kilowatts)")
dev.off()
