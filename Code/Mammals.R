#ggplot2 and count help from stackoverflow, github, and r-graph-gallery.com
#reset environment
rm(list=ls())

#download packages
library(tidyr)
library(vegan)
library(ggplot2)
library(dplyr)

#load in trimmed data
mamn<- read.csv('C:/Users/camer/OneDrive - University of Edinburgh/Arran/Data/Mammals North.csv')

#check data
View(mamn)

#remove column of just NA
mamn <- mamn %>% 
  select(-X)
mamn <- mamn %>% 
  select(-X.1)
#thank you to stackoverflow for the help with these

#remove rows of just NA
mamn[] <- lapply(mamn, \(x) replace(x, x  %in% "", NA)) #turn empty cells into NA
mamn <- na.omit(mamn)
#thank you to stackoverflow for the help with these

#check repeats or errors
unique(mamn$Commonname) #"Red deer"  "Domestic sheep" "Badger"   "Red Squirrel"

#turn common names into factor
mamn$Commonname <- as.factor(mamn$Commonname)

#no count as cant tell if repeated individual

#species richness
speciesN <- data.frame(
  name = "North",
  count = length(unique(mamn$Commonname))
)

#check
speciesN #4

#graph
ggplot(speciesN, aes(x = name, y = count)) + 
  geom_bar(stat = "identity") + 
  labs(title = "Species Richness of Mammals, North Plot", x = " ", y = "Number of Species") + 
  theme_bw() +
  ylim(0, 5)
#keep scales consistent between north and south to compare- check data before graphing

#total abundance
totalcountN <- data.frame(
  name = "North",
  count = nrow(mamn)
)

#check
totalcountN #7

#graph
ggplot(totalcountN, aes(x = name, y = count)) + 
  geom_bar(stat = "identity") + 
  labs(title = "Abundance of Mammal Occurrences, North Plot", x = " ", y = "Count of All Mammal Occurrences") + 
  theme_bw() +
  ylim(0, 10)

#now repeat for south

#load in trimmed data
mams<- read.csv('C:/Users/camer/OneDrive - University of Edinburgh/Arran/Data/Mammals South.csv')

#check data
View(mams)

#remove column of just NA
mams<- mams %>% 
  select(-X)
mams <- mams %>% 
  select(-X.1)
#thank you to stackoverflow for the help with these

#check repeats or errors
unique(mams$Commonname) #"Red deer"  "Red Squirrel"   "Domestic sheep"

#turn common names into factor
mams$Commonname <- as.factor(mams$Commonname)

#no count as cant tell if repeated individual

#species richness
speciesS<- data.frame(
  name = "South",
  count = length(unique(mams$Commonname))
)

#check
speciesS #3

#graph
ggplot(speciesS, aes(x = name, y = count)) + 
  geom_bar(stat = "identity") + 
  labs(title = "Species Richness of Mammals, South Plot", x = " ", y = "Number of Species") + 
  theme_bw() +
  ylim(0, 5)
#keep scales consistent between north and south to compare

#total abundance
totalcountS <- data.frame(
  name = "South",
  count = nrow(mams)
)

#check
totalcountS #5

#graph
ggplot(totalcountS, aes(x = name, y = count)) + 
  geom_bar(stat = "identity") + 
  labs(title = "Abundance of Mammals Occurences, South Plot", x = " ", y = "Count of All Mammals Occurrences") + 
  theme_bw() +
  ylim(0, 10)
