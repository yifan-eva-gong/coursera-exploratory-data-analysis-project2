# Across the United States, how have emissions
# from coal combustion-related sources changed from
# 1999–2008?

NEI <- readRDS("/Users/evayifangong/Desktop/DataScienceSpecialization/CourseProjects/Data/exdata/summarySCC_PM25.rds")
SCC <- readRDS("/Users/evayifangong/Desktop/DataScienceSpecialization/CourseProjects/Data/exdata/Source_Classification_Code.rds")

library(dplyr)
if_coal<-grepl("Coal$",SCC$EI.Sector)
coal <- SCC[if_coal,]
coal_merged <- merge(NEI, coal, by="SCC")
png(filename="plot4.png",width=480,height=480)
sum_coal <- coal_merged %>%
  group_by(year) %>%
  summarise(Total=sum(Emissions))
barplot(height=sum_coal$Total,names.arg=sum_coal$year,xlab="Year",ylab="Total Emissions")
dev.off()
