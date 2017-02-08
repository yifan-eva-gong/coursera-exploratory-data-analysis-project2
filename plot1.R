# Have total emissions from PM2.5 decreased in the United States
# from 1999 to 2008? Using the base plotting system,
# make a plot showing the total PM2.5 emission from all sources
# for each of the years 1999, 2002, 2005, and 2008.


NEI <- readRDS("/Users/evayifangong/Desktop/DataScienceSpecialization/CourseProjects/Data/exdata/summarySCC_PM25.rds")
SCC <- readRDS("/Users/evayifangong/Desktop/DataScienceSpecialization/CourseProjects/Data/exdata/Source_Classification_Code.rds")

library(dplyr)
sum <- NEI %>%
  group_by(year) %>%
  summarise(Total=sum(Emissions))
png(filename="plot1.png",width=480,height=480)
barplot(height=sum$Total,names.arg=sum$year,xlab="Year",ylab="Total Emissions")
dev.off()
