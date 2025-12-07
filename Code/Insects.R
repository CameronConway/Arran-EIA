#ggplot2 and count help from stackoverflow, github, and r-graph-gallery.com
#reset environment
rm(list=ls())

#download packages
library(tidyr)
library(vegan)
library(ggplot2)
library(dplyr)

#load in trimmed data
insectn<- read.csv('C:/Users/camer/OneDrive - University of Edinburgh/Arran/Data/Insects North.csv')

#check data
View(insectn)

#remove column of just NA
insectn <- insectn %>% 
  select(-X)
insectn <- insectn %>% 
  select(-X.1)
#thank you to stackoverflow for the help with these

#remove rows of just NA
insectn <- na.omit(insectn)
#thank you to stackoverflow for the help with these

#check repeats or errors
unique(insectn$Order) #to order as not many done to species level

#turn order into factor
insectn$Order <- as.factor(insectn$Order)

#get a count of how much of each order was seen
ordercountN<- insectn %>%
  count(Order)

#check
ordercountN #max is 4

#graph- note, x and y need to be coded as if they arent flipped
ggplot(ordercountN, aes(x=Order, y = n)) +
  geom_bar(stat = 'identity') + #bargraph
  coord_flip() + #flip so text legible
  labs(title='Abundance of Each Insect Order, North Plot', y='Count', x='Order') + #add labels
  ylim(0, 30) + #scale consistently
  theme_bw()

#order richness
orderN <- data.frame(
  name = "North",
  count = length(unique(insectn$Order))
)

#check
orderN #5

#graph
ggplot(orderN, aes(x = name, y = count)) + 
  geom_bar(stat = "identity") + 
  labs(title = "Order Richness of Insects, North Plot", x = " ", y = "Number of Orders") + 
  theme_bw() +
  ylim(0, 10)
#keep scales consistent between north and south to compare- check data before graphing

#total abundance
totalcountN <- data.frame(
  name = "North",
  count = nrow(insectn)
)

#check
totalcountN #9

#graph
ggplot(totalcountN, aes(x = name, y = count)) + 
  geom_bar(stat = "identity") + 
  labs(title = "Abundance of Insects, North Plot", x = " ", y = "Count of All Insects") + 
  theme_bw() +
  ylim(0, 100)

#now repeat for south

#load in trimmed data
insects<- read.csv('C:/Users/camer/OneDrive - University of Edinburgh/Arran/Data/Insects South.csv')

#check data
View(insects)

#remove column of just NA
insects <- insects %>% 
  select(-X)
insects <- insects %>% 
  select(-X.1)
#thank you to stackoverflow for the help with these

#check repeats or errors
unique(insects$Order)
#thank you to stackoverflow for the help with these

#turn order into factor
insects$Order <- as.factor(insects$Order)

#get a count of how much of each plant was seen
ordercountS<- insects %>%
  count(Order)

#check
ordercountS #max is 28

#graph- note, x and y need to be coded as if they arent flipped
ggplot(ordercountS, aes(x=Order, y = n)) +
  geom_bar(stat = 'identity') +
  coord_flip() +
  labs(title='Abundance of Each Insect Order, South Plot', y='Count', x='Order') +
  ylim(0, 30) +
  theme_bw()

#order richness
orderS<- data.frame(
  name = "South",
  count = length(unique(insects$Order))
)

#check
orderS #10

#graph
ggplot(orderS, aes(x = name, y = count)) + 
  geom_bar(stat = "identity") + 
  labs(title = "Order Richness of Insects, South Plot", x = " ", y = "Number of Orders") + 
  theme_bw() +
  ylim(0, 10)
#keep scales consistent between north and south to compare

#total abundance
totalcountS <- data.frame(
  name = "South",
  count = nrow(insects)
)

#check
totalcountS #93

#graph
ggplot(totalcountS, aes(x = name, y = count)) + 
  geom_bar(stat = "identity") + 
  labs(title = "Abundance of Insects, South Plot", x = " ", y = "Count of All Insects") + 
  theme_bw() +
  ylim(0, 100)
