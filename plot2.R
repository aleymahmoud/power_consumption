

# Download Data file 
data_url <- "https://d396qusza40orc.cloudfront.net/exdata%2Fdata%2Fhousehold_power_consumption.zip"

download.file(url = data_url,destfile = "household_power_consumption.zip",method = "curl")

# Unzip Data 
unzip(zipfile = "household_power_consumption.zip")

# load Data 

household_power_consumption <- read.csv("household_power_consumption.txt",
                                        stringsAsFactors = F,sep = ";",header = TRUE)


# subset data 
hpc_feb_2007 <- subset(household_power_consumption,Date %in% c("1/2/2007","2/2/2007"))

# remove NA 

hpc_feb_2007 <- na.omit(hpc_feb_2007) 


# remove other data sets
rm(household_power_consumption)


# convert data types

hpc_feb_2007$Global_active_power <- as.numeric(hpc_feb_2007$Global_active_power)

hpc_feb_2007$Global_reactive_power <- as.numeric(hpc_feb_2007$Global_reactive_power)

hpc_feb_2007$Voltage <- as.numeric(hpc_feb_2007$Voltage)

hpc_feb_2007$Global_intensity <- as.numeric(hpc_feb_2007$Global_intensity)

hpc_feb_2007$Sub_metering_1 <- as.numeric(hpc_feb_2007$Sub_metering_1)

hpc_feb_2007$Sub_metering_2 <- as.numeric(hpc_feb_2007$Sub_metering_2)

hpc_feb_2007$Sub_metering_3 <- as.numeric(hpc_feb_2007$Sub_metering_3)

hpc_feb_2007$Date <- as.Date(hpc_feb_2007$Date, format="%d/%m/%Y")

hpc_feb_2007$Time <- strptime(hpc_feb_2007$Time, format="%H:%M:%S")

hpc_feb_2007[1:1440   ,"Time"] <- format(hpc_feb_2007[1:1440,"Time"   ],"2007-02-01 %H:%M:%S")
hpc_feb_2007[1441:2880,"Time"] <- format(hpc_feb_2007[1441:2880,"Time"],"2007-02-02 %H:%M:%S")

# Construct first plot base  

plot(x = hpc_feb_2007$Time,y = hpc_feb_2007$Global_active_power,type = "l",
     ylab="Global Active Power (kilowatts)",xlab = "Time")




# copy first plot into png
dev.copy(png,'plot2.png')

# copy first plot into png
dev.off()





