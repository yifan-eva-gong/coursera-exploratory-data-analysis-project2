# Compare emissions from motor vehicle sources in Baltimore City
# with emissions from motor vehicle sources in Los Angeles County,
# California (𝚏𝚒𝚙𝚜 == "𝟶𝟼𝟶𝟹𝟽"). Which cityhas seen greater
# changes over time in motor vehicle emissions?


NEI <- readRDS("/Users/evayifangong/Desktop/DataScienceSpecialization/CourseProjects/Data/exdata/summarySCC_PM25.rds")
SCC <- readRDS("/Users/evayifangong/Desktop/DataScienceSpecialization/CourseProjects/Data/exdata/Source_Classification_Code.rds")

library(dplyr)
library(ggplot2)
if_motor<-grepl("Vehicles$",SCC$EI.Sector)
motor <- SCC[if_motor,]
motor_merged <- merge(NEI, motor, by="SCC")
motor_sub <- filter(motor_merged, fips=="24510"|fips=="06037")
sum_motor_sub <- motor_sub %>%
  group_by(year,fips) %>%
  summarise(Total=sum(Emissions))
sum_motor_sub$City="Los Angeles"
sum_motor_sub$City[sum_motor_sub$fips=="24510"]="Baltimore"
png(filename="plot6.png",width=480,height=480)
ggplot(data=sum_motor_sub,aes(x=year,y=Total,group=City,color=City))+
  geom_line()+ylab('Total Emissions by City')+xlab('Year')
dev.off()
