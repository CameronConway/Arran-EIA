#ggplot2 and count help from stackoverflow, github, and r-graph-gallery.com
#reset environment
rm(list=ls())

#download packages
library(tidyr)
library(vegan)
library(ggplot2)
library(dplyr)

#load in trimmed data
birdn<- read.csv('C:/Users/camer/OneDrive - University of Edinburgh/Arran/Data/Birds North.csv')

#check data
View(birdn)

#remove column of just NA
birdn <- birdn %>% 
  select(-X)
birdn <- birdn %>% 
  select(-X.1)
#thank you to stackoverflow for the help with these

#remove rows of just NA
birdn <- na.omit(birdn)
#thank you to stackoverflow for the help with these

#check repeats or errors
unique(birdn$Commonname)

#turn common names into factor
birdn$Commonname <- as.factor(birdn$Commonname)

#get a count of how much of each bird was seen
speciescountN<- birdn %>%
  count(Commonname)

#check
speciescountN #9

#graph- note, x and y need to be coded as if they arent flipped
ggplot(speciescountN, aes(x=Commonname, y = n)) +
  geom_bar(stat = 'identity') + #bargraph
  coord_flip() + #flip so text legible
  labs(title='Abundance of Each Bird Species, North Plot', y='Count', x='Species') + #add labels
  ylim(0, 10) + #scale consistently
  theme_bw()

#species richness
speciesN <- data.frame(
  name = "North",
  count = length(unique(birdn$Commonname))
)

#check
speciesN #13

#graph
ggplot(speciesN, aes(x = name, y = count)) + 
  geom_bar(stat = "identity") + 
  labs(title = "Species Richness of Birds, North Plot", x = " ", y = "Number of Species") + 
  theme_bw() +
  ylim(0, 15)
#keep scales consistent between north and south to compare- check data before graphing

#total abundance
totalcountN <- data.frame(
  name = "North",
  count = nrow(birdn)
)

#check
totalcountN #22

#graph
ggplot(totalcountN, aes(x = name, y = count)) + 
  geom_bar(stat = "identity") + 
  labs(title = "Abundance of Birds, North Plot", x = " ", y = "Count of All Birds") + 
  theme_bw() +
  ylim(0, 25)

#now repeat for south

#load in trimmed data
birds<- read.csv('C:/Users/camer/OneDrive - University of Edinburgh/Arran/Data/Birds South.csv')

#check data
View(birds)

#remove column of just NA
birds <- birds %>% 
  select(-X)
birds <- birds %>% 
  select(-X.1)
#thank you to stackoverflow for the help with these

#remove rows of just NA
birds <- na.omit(birds)
#thank you to stackoverflow for the help with these

#check repeats or errors
unique(birds$Commonname)

#turn common names into factor
birds$Commonname <- as.factor(birds$Commonname)

#get a count of how much of each bird was seen
speciescountS<- birds %>%
  count(Commonname)

#check
speciescountS #2

#graph- note, x and y need to be coded as if they arent flipped
ggplot(speciescountS, aes(x=Commonname, y = n)) +
  geom_bar(stat = 'identity') +
  coord_flip() +
  labs(title='Abundance of Each Bird Species, South Plot', y='Count', x='Species') +
  ylim(0, 10) +
  theme_bw()

#species richness
speciesS<- data.frame(
  name = "South",
  count = length(unique(birds$Commonname))
)

#check
speciesS #9

#graph
ggplot(speciesS, aes(x = name, y = count)) + 
  geom_bar(stat = "identity") + 
  labs(title = "Species Richness of Birds, South Plot", x = " ", y = "Number of Species") + 
  theme_bw() +
  ylim(0, 15)
#keep scales consistent between north and south to compare

#total abundance
totalcountS <- data.frame(
  name = "South",
  count = nrow(birds)
)

#check
totalcountS #11

#graph
ggplot(totalcountS, aes(x = name, y = count)) + 
  geom_bar(stat = "identity") + 
  labs(title = "Abundance of Birds, South Plot", x = " ", y = "Count of All Birds") + 
  theme_bw() +
  ylim(0, 25)
