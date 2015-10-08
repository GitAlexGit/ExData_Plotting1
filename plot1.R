
#read in the data
tbl<-read.table("household_power_consumption.txt", sep=";", stringsAsFactors = FALSE, header = TRUE, na.strings = "?")
# reduce the rows to the ones which contain the date of interest
tb2<-tbl[grepl("^[12]\\/2\\/2007$", tbl$Date),] # result is correct, 2880 = 2 * 24 * 60
tbl<-NULL

#concatenate time and date, and convert to date format and store in new variable
tb2$timedate<-strptime(paste(tb2$Date, tb2$Time, sep=" "), "%d/%m/%Y %T")

#plot1
png(filename="plot1.png",  width = 480, height = 480, units = "px")
hist(tb2$Global_active_power, col="red", xlab = "Global Active Power (kilowatts)", main = "Global Active Power")
dev.off()




