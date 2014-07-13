## Exploratory Data Analysis - project 1 first plot
## plotting from UC Irvine Machine Learning - electric power consumption

plot1 <- function() {
        ## Download the zip file and expand it on the local disk
        
        URL<-"https://d396qusza40orc.cloudfront.net/exdata%2Fdata%2Fhousehold_power_consumption.zip"
        projectZip=".\\ElectricPowerConsumption.zip"
        if(!file.exists(projectZip)){
                download.file(URL, projectZip)
                unzip(projectZip)
        }
        ## read the files to data frame; it has a header and separates fileld with';'
        powerData <- read.table(".\\household_power_consumption.txt", sep=";",header=TRUE, na.strings ="?", colClasses=c("character","character","numeric","numeric","numeric","numeric","numeric","numeric","numeric"))
        
        powerData$Time<-strptime(paste(powerData$Date, powerData$Time), "%d/%m/%Y %H:%M:%S")
        powerData$Date<-as.Date(powerData$Date,"%d/%m/%Y")
        
        firstLine <- match(as.Date("2007-02-01"), powerData$Date)
        lastLine <- match(as.Date("2007-02-03"), powerData$Date) - 1
        hist(powerData$Global_active_power[firstLine:lastLine], col="red", main="Global Active Power",xlab = "Global Active Power (kilowatts)")
        
        png(filename="plot1.png")
        hist(powerData$Global_active_power[firstLine:lastLine], col="red", main="Global Active Power",xlab = "Global Active Power (kilowatts)")
        dev.off()
        
}