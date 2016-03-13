NEI <- readRDS("./data/summarySCC_PM25.rds")
SCC <- readRDS("./data/Source_Classification_Code.rds")

emissionBaltimore <- subset(NEI, fips == "24510")
emmissionsBaltimore_type_year <- with(emissionBaltimore, tapply(Emissions, list("Points#"=type, "Year#"=year), sum))
emmissionsBaltimore_type_year  <- as.data.frame(emmissionsBaltimore_type_year)
emmissionsBaltimore_type_year$type <- rownames(emmissionsBaltimore_type_year)
emmissionsBaltimore_type_year <- melt(emmissionsBaltimore_type_year, id=c("type"))
colnames(emmissionsBaltimore_type_year) <- c("type","Year","Emissions")

png('plot3.png')

ggplot(data=emmissionsBaltimore_type_year, aes(x=Year, y=Emissions, group=type, colour=type), title("Total Emissions in Baltimore City base on type in various years")) +
  geom_line() +
  geom_point() + ylab("PM2.5 emitted, in tons") + ggtitle("Total Emissions in Baltimore City base on 'type' in various years")

dev.off()
