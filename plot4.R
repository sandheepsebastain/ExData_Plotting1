dfData<-read.table("household_power_consumption.txt",header = TRUE,sep=";",skip=66636,nrows = 2880,stringsAsFactors = FALSE)
headers<-read.table("household_power_consumption.txt",header = FALSE,sep=";",nrows = 1)
colnames(dfData)<-as.vector(unname(unlist(headers[1,])))
dfData2<-dfData
dfData2$Date <- as.Date(dfData2$Date,"%d/%m/%Y")

dfData2$DateTime <- as.POSIXct(paste(dfData2$Date, dfData2$Time))
dfData2<-dfData2[complete.cases(dfData2),]

png(filename="plot4.png",width=480,height=480)

par(mfcol=c(2,2))

with(dfData2,plot(dfData2$DateTime,as.numeric(dfData2$Global_active_power),type="l",xlab="",ylab="Global Active Power (kilowatts)"))

with(dfData2,plot(dfData2$DateTime,as.numeric(dfData2$Sub_metering_1),type="n",xlab="",ylab="Energy sub metering"))
lines(dfData2$DateTime,as.numeric(dfData2$Sub_metering_1),col="black")
lines(dfData2$DateTime,as.numeric(dfData2$Sub_metering_2),col="red")
lines(dfData2$DateTime,as.numeric(dfData2$Sub_metering_3),col="blue")
legend("topright",c("Sub_metering_1","Sub_metering_2","Sub_metering_3"),lty=c(1,1,1),col=c("black","red","blue"),bty="n")

with(dfData2,plot(dfData2$DateTime,as.numeric(dfData2$Voltage),type="l",xlab="datetime",ylab="Voltage"))

with(dfData2,plot(dfData2$DateTime,as.numeric(dfData2$Global_reactive_power),type="l",xlab="datetime",ylab="Global_reactive_power"))

dev.off()