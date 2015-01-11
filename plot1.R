
# Load packages
library(dplyr)
library(lubridate)

# Read file
df <- read.csv(unzip("C:/Users/georgetheologou/Desktop/Exploratory Data Analysis/assignment1/exdata-data-household_power_consumption.zip"), sep=';',stringsAsFactors = FALSE)%>%
  tbl_df()

# Convert Global active power to numeric
df["Global_active_power"]<-as.numeric(df$Global_active_power)

# Convert Date to POSIX
df["Date"]<- dmy(df$Date)

# Keep only the 1/2 to 2/2 date range
df <- subset(df, Date >= as.POSIXct("2007-02-01") & Date <= as.POSIXct("2007-02-02"))

# Create plot 1
hist(df$Global_active_power, 
     breaks = 12, 
     col = "red",
     main = "Global Active Power",
     xlab = "Global Active Power (kilowatts)")

# Save plot as PNG file with a width of 480 pixels and a height of 480 pixels
dev.copy(png, file = "C:/Users/georgetheologou/Desktop/Exploratory Data Analysis/assignment1/Plot1.png",
         width = 480,
         height = 480,
         units = "px"        
         ) ## Copy my plot to a PNG file
dev.off() ## Don't forget to close the PNG device!