plot6 <- function() {
      png("plot6.png")
      NEI <- readRDS("summarySCC_PM25.rds")
      SCC <- readRDS("Source_Classification_Code.rds")
      baltData <- NEI[NEI$fips == "24510",]
      laData <- NEI[NEI$fips == "06037",]
      
      scc <- SCC[SCC$EI.Sector == "Mobile - On-Road Diesel Heavy Duty Vehicles" | 
                       SCC$EI.Sector == "Mobile - On-Road Diesel Light Duty Vehicles" |
                       SCC$EI.Sector == "Mobile - On-Road Gasoline Heavy Duty Vehicles" |
                       SCC$EI.Sector == "Mobile - On-Road Gasoline Light Duty Vehicles",
                 "SCC"]
      scc <- as.character(scc)
      baltMotorEmi <- baltData[baltData$SCC %in% scc,]
      laMotorEmi <- laData[laData$SCC %in% scc,]
      
      baltEmi_year <- tapply(baltMotorEmi$Emissions, baltMotorEmi$year, FUN = sum)
      laEmi_year <- tapply(laMotorEmi$Emissions, laMotorEmi$year, FUN = sum)
      
      split.screen(c(1,2))
      screen(1)
      barplot(baltEmi_year, col = "red",
              main = "Baltimore",
              xlab = "Year", ylab = "Total PM2.5 emission")
      screen(2)
      barplot(laEmi_year, col = "red",
              main = "Los Angeles",
              xlab = "Year", ylab = "Total PM2.5 emission")
      dev.off()
}