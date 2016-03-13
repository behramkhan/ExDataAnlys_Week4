NEI <- readRDS("./data/summarySCC_PM25.rds")
SCC <- readRDS("./data/Source_Classification_Code.rds")

emissionBaltimore_onRoad <- subset(NEI, fips == "24510" & type == "ON-ROAD")
emissionBaltimore_onRoad <- tapply(emissionBaltimore_onRoad$Emissions,emissionBaltimore_onRoad$year,sum)

png('plot5.png')

barplot(emissionBaltimore_onRoad, ylim=c(0,max(emissionBaltimore_onRoad)),xlab="Years", ylab="PM2.5 emitted, in tons", 
        main = "Emissions of on road sources of PM2.5 in the United States")

dev.off()