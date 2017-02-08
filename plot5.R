# How have emissions from motor vehicle sources
# changed from 1999–2008 in Baltimore City?

NEI <- readRDS("/Users/evayifangong/Desktop/DataScienceSpecialization/CourseProjects/Data/exdata/summarySCC_PM25.rds")
SCC <- readRDS("/Users/evayifangong/Desktop/DataScienceSpecialization/CourseProjects/Data/exdata/Source_Classification_Code.rds")

library(dplyr)
if_motor<-grepl("Vehicles$",SCC$EI.Sector)
motor <- SCC[if_motor,]
motor_merged <- merge(NEI, motor, by="SCC")
balti_motor <- filter(motor_merged, fips=="24510")
sum_motor <- balti_motor %>%
  group_by(year) %>%
  summarise(Total=sum(Emissions))
png(filename="plot5.png",width=480,height=480)
barplot(height=sum_motor$Total,names.arg=sum_motor$year,xlab="Year",ylab="Total Emissions")

dev.off()

