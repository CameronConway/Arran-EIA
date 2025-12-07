#ggplot2 and count help from stackoverflow, github, and r-graph-gallery.com
#reset environment
rm(list=ls())

#download packages
library(tidyr)
library(vegan)
library(ggplot2)
library(dplyr)

#load in trimmed data
watern<- read.csv('C:/Users/camer/OneDrive - University of Edinburgh/Arran/Data/Freshwater Inverts North.csv')

#check data
View(watern)

#remove column of just NA
watern <- watern %>% 
  select(-X)
#thank you to stackoverflow for the help with these

#remove rows of just NA
watern <- na.omit(watern)
#thank you to stackoverflow for the help with these

#check repeats or errors
unique(watern$Order)

#turn orders into factor
watern$Order <- as.factor(watern$Order)

#get a count of how much of each invert was seen
ordercountN<- watern %>%
  count(Order)

#check
ordercountN #4

#graph- note, x and y need to be coded as if they arent flipped
ggplot(ordercountN, aes(x=Order, y = n)) +
  geom_bar(stat = 'identity') + #bargraph
  coord_flip() + #flip so text legible
  labs(title='Abundance of Each Freshwater Invertebrate Order, N', y='Count', x='Orders') + #add labels
  ylim(0, 5) + #scale consistently
  theme_bw()

#order richness
orderN <- data.frame(
  name = "North",
  count = length(unique(watern$Order))
)

#check
orderN #6

#graph
ggplot(orderN, aes(x = name, y = count)) + 
  geom_bar(stat = "identity") + 
  labs(title = "Order Richness of Freshwater Invertebrates, North Plot", x = " ", y = "Number of Orders") + 
  theme_bw() +
  ylim(0, 10)
#keep scales consistent between north and south to compare- check data before graphing

#total abundance
totalcountN <- data.frame(
  name = "North",
  count = nrow(watern)
)

#check
totalcountN #19

#graph
ggplot(totalcountN, aes(x = name, y = count)) + 
  geom_bar(stat = "identity") + 
  labs(title = "Abundance of Freshwater Invertebrates, North Plot", x = " ", y = "Count of All Freshwater Invertebrates") + 
  theme_bw() +
  ylim(0, 20)

#now repeat for south

#load in trimmed data
waters<- read.csv('C:/Users/camer/OneDrive - University of Edinburgh/Arran/Data/Freshwater Inverts South.csv')

#check data
View(waters)

#remove column of just NA
waters <- waters %>% 
  select(-X)
#thank you to stackoverflow for the help with these

#check repeats or errors
unique(waters$Order) #typo fixed
waters$Order <- trimws(waters$Order) #gets rid of spacing errors causing duplicated, thanks to the class for this

#turn orders into factor
waters$Order <- as.factor(waters$Order)

#get a count of how much of each plant was seen
ordercountS<- waters %>%
  count(Order)

#check
ordercountS #3

#graph- note, x and y need to be coded as if they arent flipped
ggplot(ordercountS, aes(x=Order, y = n)) +
  geom_bar(stat = 'identity') +
  coord_flip() +
  labs(title='Abundance of Each Freshwater Invertebrate Order, S', y='Count', x='Order') +
  ylim(0, 5) +
  theme_bw()

#order richness
ordersS<- data.frame(
  name = "South",
  count = length(unique(waters$Order))
)

#check
ordersS #8

#graph
ggplot(ordersS, aes(x = name, y = count)) + 
  geom_bar(stat = "identity") + 
  labs(title = "Order Richness of Freshwater Invertebrates, South Plot", x = " ", y = "Number of Orders") + 
  theme_bw() +
  ylim(0, 10)
#keep scales consistent between north and south to compare

#total abundance
totalcountS <- data.frame(
  name = "South",
  count = nrow(waters)
)

#check
totalcountS #16

#graph
ggplot(totalcountS, aes(x = name, y = count)) + 
  geom_bar(stat = "identity") + 
  labs(title = "Abundance of Freshwater Invertebrates, South Plot", x = " ", y = "Count of All Freshwater Invertebrates") + 
  theme_bw() +
  ylim(0, 20)
