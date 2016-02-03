plot3 <- function() {
      png("plot3.png")
      NEI <- readRDS("summarySCC_PM25.rds")
      SCC <- readRDS("Source_Classification_Code.rds")
      baltData <- NEI[NEI$fips == "24510",]
      
      library(ggplot2)
      pGraph <- ggplot(baltData, aes(year, weight = Emissions)) + geom_bar()
      pGraph <- pGraph  + facet_grid(.~type) + labs(y = "Total PM2.5 Emission")
      print(pGraph)
      dev.off()
}