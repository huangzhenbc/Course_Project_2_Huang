plot1 <- function() {
      png("plot1.png")
      NEI <- readRDS("summarySCC_PM25.rds")
      SCC <- readRDS("Source_Classification_Code.rds")
      emi_year <- tapply(NEI$Emissions,NEI$year, FUN = sum)
      barplot(emi_year, col = "red",
              main = "Total PM2.5 emission from 1999-2005",
              xlab = "Year", ylab = "Total PM2.5 emission")
      dev.off()
}