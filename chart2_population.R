# get data and load libraries
library(dplyr)
library(ggplot2)
jail_data <- read.csv("https://raw.githubusercontent.com/melaniewalsh/Neat-Datasets/main/us-prison-jail-rates.csv")
#View(jail_data)

# organize data
jail_data_recent <- jail_data %>% filter(year == 2010)
chart_2_data <- jail_data_recent %>%
  group_by(total_pop) %>%
  summarize(
    avg_rate_pop_black = mean(black_prison_pop_rate, na.rm = TRUE),
    avg_rate_pop_white = mean(white_prison_pop_rate, na.rm = TRUE)
  )

# make graph
chart_2_graph <- ggplot(chart_2_data, aes(x = total_pop)) +
  geom_line(aes(y = avg_rate_pop_white, color = "White")) +
  geom_line(aes(y = avg_rate_pop_black, color = "Black")) +
  ylim(NA, 40000)+
  labs(title = "Incarceration Rates Versus Population",
       x = "Population",
       y = "Average Incarceration Rate",
       color = "Race") +
  scale_color_manual(values = c("Black" = "black", "White" = "blue")) +
  theme_minimal()
chart_2_graph

