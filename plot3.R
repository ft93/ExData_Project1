## Getting full dataset
data_file <- read.csv("./ExData_Project1/household_power_consumption.txt", header=T, sep=';', na.strings="?", 
                      nrows=2075259, check.names=F, stringsAsFactors=F, comment.char="", quote='\"')
data_file$Date <- as.Date(data_file$Date, format="%d/%m/%Y")

## Subsetting the data
data <- subset(data_file, subset=(Date >= "2007-02-01" & Date <= "2007-02-02"))
rm(data_file)

## Converting dates
datetime <- paste(as.Date(data$Date), data$Time)
data$Datetime <- as.POSIXct(datetime)

## Plotting graph number  3
with(data, {
  plot(Sub_metering_1~Datetime, type="l", ylab="Energy sub metering", xlab="")
    lines(Sub_metering_2~Datetime,col="Red")
    lines(Sub_metering_3~Datetime,col="Blue")
})

## creating a legend
legend("topright", col=c("black","red","blue"), lty=1, lwd=2, 
       legend=c("Sub_metering_1","Sub_metering_2","Sub_metering_3"))

## Saving to file
dev.copy(png, file="plot3.png", height=480, width=480)
dev.off()