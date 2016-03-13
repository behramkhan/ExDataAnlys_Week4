NEI <- readRDS("./data/summarySCC_PM25.rds")
SCC <- readRDS("./data/Source_Classification_Code.rds")

emissionBaltimore_onRoad <- subset(NEI, fips == "24510" & type == "ON-ROAD")
emissionBaltimore_onRoad <- tapply(emissionBaltimore_onRoad$Emissions,emissionBaltimore_onRoad$year,sum)

emissionLosAngels_onRoad <- subset(NEI, fips == "06037" & type == "ON-ROAD")
emissionLosAngels_onRoad <- tapply(emissionLosAngels_onRoad$Emissions,emissionLosAngels_onRoad$year,sum)

df <- data.frame(balt=emissionBaltimore_onRoad,LosAngels=emissionLosAngels_onRoad)
df$year <- rownames(df)
df <- melt(df,id=c("year"))
colnames(df) <- c("year", "county", "emissions")
png('plot6.png')
ggplot(data=df, aes(x=year, y=emissions, group=county, colour=county)) + geom_line() + geom_point() + ylab("PM2.5 emitted, in tons") + ggtitle("Baltimore Vs. Los Angeles: Comparison of emissions from motor vehicle sources.")
dev.off()