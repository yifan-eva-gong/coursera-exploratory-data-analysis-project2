# Have total emissions from PM2.5 decreased in the Baltimore City,
# Maryland (𝚏𝚒𝚙𝚜 == "𝟸𝟺𝟻𝟷𝟶") from 1999to 2008? Use the base
# plotting system to make a plot answering this question.

NEI <- readRDS("/Users/evayifangong/Desktop/DataScienceSpecialization/CourseProjects/Data/exdata/summarySCC_PM25.rds")
SCC <- readRDS("/Users/evayifangong/Desktop/DataScienceSpecialization/CourseProjects/Data/exdata/Source_Classification_Code.rds")

library(dplyr)
balti <- filter(NEI, fips=="24510")
sum_balti <- balti %>%
  group_by(year) %>%
  summarise(Total=sum(Emissions))
png(filename="plot2.png",width=480,height=480)
barplot(height=sum_balti$Total,names.arg=sum_balti$year,xlab="Year",ylab="Total Emissions")

dev.off()
