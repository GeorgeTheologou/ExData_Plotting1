
# Load packages
library(dplyr)
library(lubridate)

# Read file
df <- read.csv(unzip("C:/Users/georgetheologou/Desktop/Exploratory Data Analysis/assignment1/exdata-data-household_power_consumption.zip"), sep=';',stringsAsFactors = FALSE)%>%
  tbl_df()

# Convert char to numeric
df["Global_active_power"]<-as.numeric(df$Global_active_power)
df["Voltage"]<-as.numeric(df$Voltage)
df["Global_reactive_power"]<-as.numeric(df$Global_reactive_power)
df["Sub_metering_1"]<-as.numeric(df$Sub_metering_1)
df["Sub_metering_2"]<-as.numeric(df$Sub_metering_2)
df["Sub_metering_3"]<-as.numeric(df$Sub_metering_3)

# Convert Date to POSIX
df["Date"]<- dmy_hms(paste(df$Date,df$Time))

# Keep only the 1/2 to 2/2 date range
df <- subset(df, Date >= as.POSIXct("2007-02-01") & Date <= as.POSIXct("2007-02-02"))

# Combine four plots using par() function with two rows and two columns
par(mfrow=c(2,2))

# create 1st plot
plot(strptime(df$Date, "%Y-%m-%d %H:%M:%S"),df$Global_active_power,
     xlab = "",
     ylab = "Global Active Power",
     col = "black",
     type = "l")

# create 2nd plot
plot(strptime(df$Date, "%Y-%m-%d %H:%M:%S"),df$Voltage,
     xlab = "datetime",
     ylab = "Voltage",
     col = "black",
     type = "l")

# create 3rd plot
plot(df$Date,df$Sub_metering_1,
     xlab = "",
     ylab = "Energy sub metering",
     col = "black",
     type = "l")
lines(df$Date,df$Sub_metering_2,type="l",col="red")
lines(df$Date,df$Sub_metering_3,type="l",col="blue")
legend('topright', legend=c("Sub_metering_1", "Sub_metering_2","Sub_metering_3"), col=c("black","red","blue"), lty=c(1,1,1),bty="n",cex=0.5,lw)

# create 4th plot
plot(strptime(df$Date, "%Y-%m-%d %H:%M:%S"),df$Global_reactive_power,
     xlab = "datetime",
     ylab = "Global_reactive_power",
     col = "black",
     type = "l")

# Save plot as PNG file with a width of 480 pixels and a height of 480 pixels
dev.copy(png, file = "C:/Users/georgetheologou/Desktop/Exploratory Data Analysis/assignment1/Plot4.png",
         width = 480,
         height = 480,
         units = "px") ## Copy my plot to a PNG file
dev.off() ## Don't forget to close the PNG device!