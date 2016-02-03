plot5 <- function() {
      png("plot5.png")
      NEI <- readRDS("summarySCC_PM25.rds")
      SCC <- readRDS("Source_Classification_Code.rds")
      baltData <- NEI[NEI$fips == "24510",]
      scc <- SCC[SCC$EI.Sector == "Mobile - On-Road Diesel Heavy Duty Vehicles" | 
                 SCC$EI.Sector == "Mobile - On-Road Diesel Light Duty Vehicles" |
                 SCC$EI.Sector == "Mobile - On-Road Gasoline Heavy Duty Vehicles" |
                 SCC$EI.Sector == "Mobile - On-Road Gasoline Light Duty Vehicles",
                 "SCC"]
      scc <- as.character(scc)
      motorEmi <- baltData[baltData$SCC %in% scc,]
      
      emi_year <- tapply(motorEmi$Emissions,motorEmi$year, FUN = sum)
      barplot(emi_year, col = "red",
              main = "Motor PM2.5 emission from 1999-2005 in Baltimore",
              xlab = "Year", ylab = "Total PM2.5 emission")
      dev.off()
}