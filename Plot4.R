NEI <- readRDS("./data/summarySCC_PM25.rds")
SCC <- readRDS("./data/Source_Classification_Code.rds")

NEI_SCC <- merge(NEI, SCC, by='SCC')
NEI_SCC_coal <- NEI_SCC[grep("Coal",NEI_SCC$Short.Name),]
total_emissions <- tapply(NEI_SCC_coal$Emissions,NEI_SCC_coal$year,sum)

png('plot4.png')

barplot(total_emissions, ylim=c(0,max(total_emissions)),xlab="Years", ylab="PM2.5 emitted, in tons", 
        main = "Coal combustion related emissions sources in the United States")

dev.off()