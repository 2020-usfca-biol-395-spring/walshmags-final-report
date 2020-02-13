# Datasheet Homework for Urban Ecology
# Maggie Walsh
# mcwalsh@dons.usfca.edu
# February 2020

library("dplyr")
library("ggplot2")
library("readr")
library("forcats")

resiliency_data <- read_csv(
  file = "data/raw_data/NeighborhoodResiliencyIndicators.csv",
  skip = 2)

resiliency_data %>%
  rename(pm25 = `Average annual PM2.5 concentration from all Sources`) %>%
  select(Neighborhood, pm25) %>%
  arrange(desc(pm25)) %>%
  head(38) %>%
  ggplot(aes(x = fct_reorder(Neighborhood, pm25),
             y = pm25)) +
  geom_col() +
  coord_flip() +
  theme(axis.text.x = element_text(angle=45)) +
  labs(y = "PM 2.5 Conc") +
  labs(x = "Neighborhood") +
  ggtitle("Average Annual PM 2.5 Concentration By Neighborhood in San Francisco")

ggsave("output/avg_pm_conc_neighborhoods.pdf") 



  
  

   
