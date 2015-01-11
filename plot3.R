
# Load packages
library(dplyr)
library(lubridate)

# Read file
df <- read.csv(unzip("C:/Users/georgetheologou/Desktop/Exploratory Data Analysis/assignment1/exdata-data-household_power_consumption.zip"), sep=';',stringsAsFactors = FALSE)%>%
  tbl_df()

# convert sub metering 1 to numeric
df["Sub_metering_1"]<-as.numeric(df$Sub_metering_1)

# convert sub metering 2 to numeric
df["Sub_metering_2"]<-as.numeric(df$Sub_metering_2)

# convert sub metering 3 to numeric
df["Sub_metering_3"]<-as.numeric(df$Sub_metering_3)

# Convert Date to POSIX
df["Date"]<- dmy_hms(paste(df$Date,df$Time))

# Keep only the 1/2 to 2/2 date range
df <- subset(df, Date >= as.POSIXct("2007-02-01") & Date <= as.POSIXct("2007-02-02"))

# Create plot 3
plot(df$Date,df$Sub_metering_1,
     xlab = "",
     ylab = "Energy sub metering",
     col = "black",
     type = "l")
lines(df$Date,df$Sub_metering_2,type="l",col="red")
lines(df$Date,df$Sub_metering_3,type="l",col="blue")
legend('topright', legend=c("Sub_metering_1", "Sub_metering_2","Sub_metering_3"), col=c("black","red","blue"), lty=c(1,1,1),lw)

# Save plot as PNG file with a width of 480 pixels and a height of 480 pixels
dev.copy(png, file = "C:/Users/georgetheologou/Desktop/Exploratory Data Analysis/assignment1/Plot3.png",
         width = 480,
         height = 480,
         units = "px") ## Copy my plot to a PNG file
dev.off() ## Don't forget to close the PNG device!