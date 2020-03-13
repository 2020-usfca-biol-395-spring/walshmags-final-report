# Maggie Walsh
# SF Development Data visualization
# Urban Ecology
# mcwalsh@dons.usfca.edu
# March 2020

# Load Packages
library("dplyr")
library("ggplot2")
library("readr")

# Load Data Set
sf_development <- read_csv(file = "data/raw_data/SF_Development_Pipeline_2019_Q2.csv")

# Isolate Development Projects That Were In Progress Between April
# and June of 2019
# Group Development Projects by Neighborhood
sf_development %>%
  select(BESTSTAT, NHOOD_37) %>%
  filter(BESTSTAT == "CONSTRUCTION") %>%
  ggplot(aes(x=NHOOD_37)) +
  geom_bar(stat = "count") +
  coord_flip() +
  labs(x= "Neighborhood") +
  labs(title = "Count of SF Development Projects in Progress Between April and June of 2019") +
  ggsave("output/count_development_neighborhoods.pdf"
  )



  