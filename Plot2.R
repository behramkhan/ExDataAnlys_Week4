NEI <- readRDS("./data/summarySCC_PM25.rds")
SCC <- readRDS("./data/Source_Classification_Code.rds")
emissionBaltimore <- subset(NEI, fips == "24510")
total_emissions_baltimore <- tapply(emissionBaltimore$Emissions,emissionBaltimore$year,sum)

png('plot2.png')

barplot(total_emissions_baltimore, ylim=c(0,max(total_emissions_baltimore)),xlab="Years", ylab="PM2.5 emitted, in tons", 
        main = "Total emissions of PM2.5 in the Baltimore City in various years")

dev.off()
