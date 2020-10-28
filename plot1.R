household_power_consumption <- read.csv("C:/Users/atamb/Desktop/exdata_data_household_power_consumption/household_power_consumption.txt", sep=";")
mydata <- household_power_consumption
mydata.first <- subset(mydata, Date == "1/2/2007")
mydata.second <- subset(mydata, Date == "2/2/2007")
hpc.sorted=rbind(mydata.first,mydata.second)
hpc <- hpc.sorted
hpc$Global_active_power <- as.numeric(hpc$Global_active_power)
hist(hpc$Global_active_power,xlab = "Global Active Power(kilowatts)",main= "Global Active Power",col="red")
png("plot1.png", width=480, height=480)