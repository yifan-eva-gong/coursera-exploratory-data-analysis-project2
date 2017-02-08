# Of the four types of sources indicated by the
#𝚝𝚢𝚙𝚎 (point, nonpoint, onroad, nonroad) variable,
# which of these four sources have seen decreases in
# emissions from 1999–2008 for Baltimore City?
# Which have seen increases in emissions from 1999–2008?
# Use the ggplot2 plotting system to make a plot answer this question.
NEI <- readRDS("/Users/evayifangong/Desktop/DataScienceSpecialization/CourseProjects/Data/exdata/summarySCC_PM25.rds")
SCC <- readRDS("/Users/evayifangong/Desktop/DataScienceSpecialization/CourseProjects/Data/exdata/Source_Classification_Code.rds")

library(dplyr)
library(ggplot2)
balti <- filter(NEI, fips=="24510")
sum_balti_type <- balti %>%
  group_by(year,type) %>%
  summarise(Total=sum(Emissions))
png(filename="plot3.png",width=480,height=480)
ggplot(data=sum_balti_type,aes(x=year,y=Total,group=type,color=type))+
  geom_line()
dev.off()
