household_power_consumption <- read.csv("C:/Users/atamb/Desktop/exdata_data_household_power_consumption/household_power_consumption.txt", sep=";")
mydata <- household_power_consumption
hpc<- subset(mydata,mydata$Date=="1/2/2007" | mydata$Date =="2/2/2007")
# Transforming Date and Time variables
hpc$Date <- as.Date(hpc$Date, format="%d/%m/%Y")
hpc$Time <- strptime(hpc$Time, format="%H:%M:%S")
hpc[1:1440,"Time"] <- format(hpc[1:1440,"Time"],"2007-02-01 %H:%M:%S")
hpc[1441:2880,"Time"] <- format(hpc[1441:2880,"Time"],"2007-02-02 %H:%M:%S")
plot(hpc$Time,hpc$Global_active_power,type = "l", xlab = "",ylab = "Global Active Power (kilowatts)")
title(main = "Global Active Power Vs Time")