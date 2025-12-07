#ggplot2 and count help from stackoverflow, github, and r-graph-gallery.com
#reset environment
rm(list=ls())

#download packages
library(tidyr)
library(vegan)
library(ggplot2)
library(dplyr)

#load in trimmed data
batn<- read.csv('C:/Users/camer/OneDrive - University of Edinburgh/Arran/Data/Bats North.csv')

#check data
View(batn)

#remove column of just NA
batn <- batn %>% 
  select(-X)
batn <- batn %>% 
  select(-X.1)
#thank you to stackoverflow for the help with these

#remove rows of just NA
batn[] <- lapply(batn, \(x) replace(x, x  %in% "", NA)) #turn empty cells into NA
batn <- na.omit(batn) #remove NA columns
#thank you to stackoverflow for the help with these

#check repeats or errors
unique(batn$Commonname) #"Soprano pipistrelle" "Common pipistrelle" 

#turn species into factor
batn$Commonname <- as.factor(batn$Commonname)

#no count as dont have a way of telling if each bat recorded was the same or different

#species richness
speciesN <- data.frame(
  name = "North",
  count = length(unique(batn$Commonname))
)

#check
speciesN #2

#graph
ggplot(speciesN, aes(x = name, y = count)) + 
  geom_bar(stat = "identity") + 
  labs(title = "Species Richness of Bats, North Plot", x = " ", y = "Number of Species") + 
  theme_bw() +
  ylim(0, 5)
#keep scales consistent between north and south to compare- check data before graphing

#total separate occurrences 
totalcountN <- data.frame(
  name = "North",
  count = nrow(batn)
)

#check
totalcountN #7

#graph
ggplot(totalcountN, aes(x = name, y = count)) + 
  geom_bar(stat = "identity") + 
  labs(title = "Abundance of Bat Occurrences, North Plot", x = " ", y = "Count of All Occurrences") + 
  theme_bw() +
  ylim(0, 15)

#now repeat for south

#load in trimmed data
bats<- read.csv('C:/Users/camer/OneDrive - University of Edinburgh/Arran/Data/Bats South.csv')

#check data
View(bats)

#remove column of just NA
bats <- bats %>% 
  select(-X)
bats <- bats %>% 
  select(-X.1)
#thank you to stackoverflow for the help with these

#check repeats or errors
unique(bats$Commonname) #"Lesser noctule" "Nathusius' pipistrelle" 
#"Common pipistrelle" "Soprano pipistrelle"   "Brown long-eared bat"  

#turn species into factor
bats$Commonname <- as.factor(bats$Commonname)

#species richness
orderS<- data.frame(
  name = "South",
  count = length(unique(bats$Commonname))
)

#check
orderS #5

#graph
ggplot(orderS, aes(x = name, y = count)) + 
  geom_bar(stat = "identity") + 
  labs(title = "Species Richness of Bats, South Plot", x = " ", y = "Number of Species") + 
  theme_bw() +
  ylim(0, 5)
#keep scales consistent between north and south to compare

#total separate occurrences 
totalcountS <- data.frame(
  name = "South",
  count = nrow(bats)
)

#check
totalcountS #15

#graph
ggplot(totalcountS, aes(x = name, y = count)) + 
  geom_bar(stat = "identity") + 
  labs(title = "Abundance of Bat Occurrences, South Plot", x = " ", y = "Count of All Occurrences") + 
  theme_bw() +
  ylim(0, 15)

