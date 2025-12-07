#ggplot2 and count help from stackoverflow, github, and r-graph-gallery.com
#reset environment
rm(list=ls())

#download packages
library(tidyr)
library(vegan)
library(ggplot2)
library(dplyr)

#load in trimmed data
mothsN<- read.csv('C:/Users/camer/OneDrive - University of Edinburgh/Arran/Data/Moths North.csv')

#check data
View(mothsN)

#remove column of just NA
mothsN <- mothsN %>% 
  select(-X)
mothsN <- mothsN %>% 
  select(-X.1)
#thank you to stackoverflow for the help with these

#remove rows of just NA
mothsN <- na.omit(mothsN)
#thank you to stackoverflow for the help with these

#check repeats or errors
unique(mothsN$Commonname)

#turn common names into factor
mothsN$Commonname <- as.factor(mothsN$Commonname)

#get a count of how much of each moth was seen
speciescountN<- mothsN %>%
  count(Commonname)

#check
speciescountN

#graph- note, x and y need to be coded as if they arent flipped
ggplot(speciescountN, aes(x=Commonname, y = n)) +
  geom_bar(stat = 'identity') + #bargraph
  coord_flip() + #flip so text legible
  labs(title='Abundance of Each Moth Species, North Plot', y='Count', x='Species') + #add labels
  ylim(0, 3) + #scale consistently
  theme_bw()

#species richness
speciesN <- data.frame(
  name = "North",
  count = length(unique(mothsN$Commonname))
)

#check
speciesN

#graph
ggplot(speciesN, aes(x = name, y = count)) + 
  geom_bar(stat = "identity") + 
  labs(title = "Species Richness of Moths, North Plot", x = " ", y = "Number of Species") + 
  theme_bw() +
  ylim(0, 25)
#keep scales consistent between north and south to compare- check data before graphing

#total abundance
totalcountN <- data.frame(
  name = "North",
  count = nrow(mothsN)
)

#check
totalcountN

#graph
ggplot(totalcountN, aes(x = name, y = count)) + 
  geom_bar(stat = "identity") + 
  labs(title = "Abundance of Moths, North Plot", x = " ", y = "Count of All Moths") + 
  theme_bw() +
  ylim(0, 30)

#now repeat for south

#load in trimmed data
mothsS<- read.csv('C:/Users/camer/OneDrive - University of Edinburgh/Arran/Data/Moths South.csv')

#check data
View(mothsS)

#remove column of just NA
mothsS <- mothsS %>% 
  select(-X)
mothsS <- mothsS %>% 
  select(-X.1)
#thank you to stackoverflow for the help with these

#check repeats or errors
unique(mothsS$Commonname)
mothsS$Commonname <- trimws(mothsS$Commonname) #gets rid of spacing errors causing duplicated, thanks to class for help with this

#turn common names into factor
mothsS$Commonname <- as.factor(mothsS$Commonname)

#get a count of how much of each plant was seen
speciescountS<- mothsS %>%
  count(Commonname)

#check
speciescountS

#graph- note, x and y need to be coded as if they arent flipped
ggplot(speciescountS, aes(x=Commonname, y = n)) +
  geom_bar(stat = 'identity') +
  coord_flip() +
  labs(title='Abundance of Each Moth Species, South Plot', y='Count', x='Species') +
  ylim(0, 3) +
  theme_bw()

#species richness
speciesS<- data.frame(
  name = "South",
  count = length(unique(mothsS$Commonname))
)

#check
speciesS

#graph
ggplot(speciesS, aes(x = name, y = count)) + 
  geom_bar(stat = "identity") + 
  labs(title = "Species Richness of Moths, South Plot", x = " ", y = "Number of Species") + 
  theme_bw() +
  ylim(0, 25)
#keep scales consistent between north and south to compare

#total abundance
totalcountS <- data.frame(
  name = "South",
  count = nrow(mothsS)
)

#check
totalcountS

#graph
ggplot(totalcountS, aes(x = name, y = count)) + 
  geom_bar(stat = "identity") + 
  labs(title = "Abundance of Moths, South Plot", x = " ", y = "Count of All Moths") + 
  theme_bw() +
  ylim(0, 30)
