NEI <- readRDS("./data/summarySCC_PM25.rds")
SCC <- readRDS("./data/Source_Classification_Code.rds")
total_emissions <- tapply(NEI$Emissions,NEI$year,sum)
png('plot1.png')
barplot(total_emissions, ylim=c(0,max(total_emissions)),xlab="Years", ylab="PM2.5 emitted, in tons", 
        main = "Total emissions of PM2.5 in the United States in various years")

dev.off()

