plot2 <- function() {
      png("plot2.png")
      NEI <- readRDS("summarySCC_PM25.rds")
      SCC <- readRDS("Source_Classification_Code.rds")
      baltData <- NEI[NEI$fips == "24510",]
      baltEmi_year <- tapply(baltData$Emissions,baltData$year, FUN = sum)
      barplot(baltEmi_year, col = "red", 
              main = "Total PM2.5 emission from 1999-2005 in Baltimore City",
              xlab = "Year", ylab = "Total PM2.5 emission")
      dev.off()
}