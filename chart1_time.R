library(dplyr)
library(ggplot2)
jail_data <- read.csv("https://raw.githubusercontent.com/melaniewalsh/Neat-Datasets/main/us-prison-jail-rates.csv")

white_prison_pop_rate_no_na <- na.omit(jail_data$white_prison_pop_rate)
black_prison_pop_rate_no_na <- na.omit(jail_data$black_prison_pop_rate)

chart_1_data <- jail_data %>%
  group_by(year) %>%
  summarize(
    avg_rate_time = mean(total_prison_pop_rate, na.rm = TRUE),
    avg_rate_time_black = mean(black_prison_pop_rate, na.rm = TRUE),
    avg_rate_time_white = mean(white_prison_pop_rate, na.rm = TRUE)
    
  )

#View(chart_1_data)

chart_1_graph <- ggplot(chart_1_data, aes(x = year)) +
  geom_line(aes(y = avg_rate_time, color = "Total")) +
  geom_line(aes(y = avg_rate_time_black, color = "Black")) +
  geom_line(aes(y = avg_rate_time_white, color = "White")) +
  labs(title = "Incarceration Rates Over Time",
       x = "Year",
       y = "Average Incarceration Rate",
       color = "Race") +
  scale_color_manual(values = c("Total" = "red", "Black" = "black", "White" = "blue")) +
  theme_minimal()
chart_1_graph
