# download and load packages
install.packages("sf")
install.packages("tigris")
library(dplyr)
library(ggplot2)
library(sf)
library(tigris)

# load and filter data (a recent year and by state)
jail_data <- read.csv("https://raw.githubusercontent.com/melaniewalsh/Neat-Datasets/main/us-prison-jail-rates.csv")
jail_data_recent <- jail_data %>% filter(year == 2010)
jail_data_recent_state <- jail_data_recent %>%
  group_by(state) %>%
  summarize(black_prison_pop_rate = mean(black_prison_pop_rate, na.rm = TRUE))

# load map and merge states on map with state data
states <- states(cb = TRUE)
jail_data_map <- states %>%
  left_join(jail_data_recent_state, by = c("STUSPS" = "state"))

# create the visual
chart3_map <- ggplot(jail_data_map) +
  geom_sf(aes(fill = black_prison_pop_rate), color = "white", size = 0.2) +
  scale_fill_gradient(low = "lightblue", high = "darkblue", na.value = "grey",
                      name = "Incarceration rate") +
  labs(title = "black incarceration rates by state",
       subtitle = "darker shade indicates higher rates") +
  theme_minimal() +
  theme(
    plot.title = element_text(hjust = 0.5),
    plot.subtitle = element_text(hjust = 0.5),
    axis.title = element_blank(),
    axis.text = element_blank(),
    axis.ticks = element_blank(),
    panel.grid = element_blank()
  )
chart3_map
