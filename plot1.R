dfData<-read.table("household_power_consumption.txt",header = TRUE,sep=";",skip=66636,nrows = 2880,stringsAsFactors = FALSE)
headers<-read.table("household_power_consumption.txt",header = FALSE,sep=";",nrows = 1)
colnames(dfData)<-as.vector(unname(unlist(headers[1,])))
dfData2<-dfData
dfData2$Date <- as.Date(dfData2$Date,"%d/%m/%Y")
dfData2<-dfData2[complete.cases(dfData2),]
png(filename="plot1.png",width=480,height=480)
hist(as.numeric(dfData2$Global_active_power),ylim=c(0,1200),col="red",main="Global Active Power",xlab="Global Active Power (kilowatts)",ylab="Frequency")
dev.off()