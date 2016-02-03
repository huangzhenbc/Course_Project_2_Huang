plot4 <- function() {
      png("plot4.png")
      NEI <- readRDS("summarySCC_PM25.rds")
      SCC <- readRDS("Source_Classification_Code.rds")
      scc <- SCC[SCC$EI.Sector == "Fuel Comb - Comm/Institutional - Coal","SCC"]
      scc <- as.character(scc)
      coalEmi <- NEI[NEI$SCC %in% scc,]
      
      emi_year <- tapply(coalEmi$Emissions,coalEmi$year, FUN = sum)
      barplot(emi_year, col = "red",
              main = "Coal PM2.5 emission from 1999-2005",
              xlab = "Year", ylab = "Total PM2.5 emission")
      dev.off()
}