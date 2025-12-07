#ggplot2 and count help from stackoverflow, github, and r-graph-gallery.com
#reset environment
rm(list=ls())

#download packages
library(tidyr)
library(vegan)
library(ggplot2)
library(dplyr)

#load in trimmed data
plantsN<- read.csv('C:/Users/camer/OneDrive - University of Edinburgh/Arran/Data/Plants North.csv')

#check data
head(plantsN)
str(plantsN)
View(plantsN)

#remove column of just NA
plantsN <- plantsN %>% 
  select(-X)
#thank you to stackoverflow for the help with these

#remove rows of just NA
plantsN <- na.omit(plantsN)
#thank you to stackoverflow for the help with these

#check repeats or errors
unique(plantsN$Commonname)

#turn common names into factor
plantsN$Commonname <- as.factor(plantsN$Commonname)

#get a count of how much of each plant was seen
speciescountN<- plantsN %>%
  count(Commonname)

#check
speciescountN

#graph- note, x and y need to be coded as if they arent flipped
ggplot(speciescountN, aes(x=Commonname, y = n)) +
  geom_bar(stat = 'identity') + #bargraph
  coord_flip() + #flip so text legible
  labs(title='Abundance of each plant species, North Plot', y='Count', x='Species') + #add labels
  ylim(0, 25) + #scale consistently
  theme_bw()

#species richness
speciesN <- data.frame(
  name = "North",
  count = length(unique(plantsN$Commonname))
)
#check
speciesN #24

#graph
ggplot(speciesN, aes(x = name, y = count)) + 
  geom_bar(stat = "identity") + 
  labs(title = "Species Richness of Plants, North Plot", x = " ", y = "Number of Species") + 
  theme_bw() +
  ylim(0, 25)
#keep scales consistent between north and south to compare- check data before graphing

#total abundance
totalcountN <- data.frame(
  name = "North",
  count = nrow(plantsN)
)

#check
totalcountN

#graph
ggplot(totalcountN, aes(x = name, y = count)) + 
  geom_bar(stat = "identity") + 
  labs(title = "Abundance of Plants, North Plot", x = " ", y = "Count of All Plants") + 
  theme_bw() +
  ylim(0, 150)

#now repeat for south

#load in trimmed data
plantsS<- read.csv('C:/Users/camer/OneDrive - University of Edinburgh/Arran/Data/Plants South.csv')

#check data
View(plantsS)

#remove column of just NA
plantsS <- plantsS %>% 
  select(-X)
#thank you to stackoverflow for the help with these

#check repeats or errors, fixed an error
unique(plantsS$Commonname)

#turn common names into factor
plantsS$Commonname <- as.factor(plantsS$Commonname)

#get a count of how much of each plant was seen
speciescountS<- plantsS %>%
  count(Commonname)

#check
speciescountS

#graph- note, x and y need to be coded as if they arent flipped
ggplot(speciescountS, aes(x=Commonname, y = n)) +
  geom_bar(stat = 'identity') +
  coord_flip() +
  labs(title='Abundance of Each Plant Species, South Plot', y='Count', x='Species') +
  ylim(0, 25) +
  theme_bw()

#species richness
speciesS<- data.frame(
  name = "South",
  count = length(unique(plantsS$Commonname))
)
#check
speciesS

#graph
ggplot(speciesS, aes(x = name, y = count)) + 
  geom_bar(stat = "identity") + 
  labs(title = "Species Richness of Plants, South Plot", x = " ", y = "Number of Species") + 
  theme_bw() +
  ylim(0, 25)
#keep scales consistent between north and south to compare

#total abundance
totalcountS <- data.frame(
  name = "South",
  count = nrow(plantsS)
)
#check
totalcountS

#graph
ggplot(totalcountS, aes(x = name, y = count)) + 
  geom_bar(stat = "identity") + 
  labs(title = "Abundance of Plants, South Plot", x = " ", y = "Count of All Plants") + 
  theme_bw() +
  ylim(0, 150)
