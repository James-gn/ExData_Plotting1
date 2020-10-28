household_power_consumption <- read.csv("C:/Users/atamb/Desktop/exdata_data_household_power_consumption/household_power_consumption.txt", sep=";")
mydata <- household_power_consumption
hpc<- subset(mydata,mydata$Date=="1/2/2007" | mydata$Date =="2/2/2007")
# Transforming Date and Time variables
hpc$Date <- as.Date(hpc$Date, format="%d/%m/%Y")
hpc$Time <- strptime(hpc$Time, format="%H:%M:%S")
hpc[1:1440,"Time"] <- format(hpc[1:1440,"Time"],"2007-02-01 %H:%M:%S")
hpc[1441:2880,"Time"] <- format(hpc[1441:2880,"Time"],"2007-02-02 %H:%M:%S")
# initiating a composite plot with many graphs:
par(mfrow=c(2,2))

# calling the basic plot function, that calls different plot functions to render the 4 distinct plots that form the graph:
plot(hpc$Time,as.numeric(as.character(hpc$Global_active_power)),type="l",  xlab="",ylab="Global Active Power")  
plot(hpc$Time,as.numeric(as.character(hpc$Voltage)), type="l",xlab="datetime",ylab="Voltage")
plot(hpc$Time,hpc$Sub_metering_1,type="n",xlab="",ylab="Energy sub metering")
with(hpc,lines(Time,as.numeric(as.character(Sub_metering_1))))
with(hpc,lines(Time,as.numeric(as.character(Sub_metering_2)),col="red"))
with(hpc,lines(Time,as.numeric(as.character(Sub_metering_3)),col="blue"))
legend("topright", lty=1, col=c("black","red","blue"),legend=c("Sub_metering_1","Sub_metering_2","Sub_metering_3"),cex = 0.6)
plot(hpc$Time,as.numeric(as.character(hpc$Global_reactive_power)),type="l",xlab="datetime",ylab="Global_reactive_power")