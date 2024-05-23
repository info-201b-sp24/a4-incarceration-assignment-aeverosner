# Open dataset and view data
library(dplyr)
jail_data <- read.csv("https://raw.githubusercontent.com/melaniewalsh/Neat-Datasets/main/us-prison-jail-rates.csv")
#View(jail_data)
nrow(jail_data)
ncol(jail_data)

# Calculate summary statistics for different size cities
# average rate overall
avg_rate <- mean(jail_data$total_prison_pop_rate, na.rm = TRUE)
avg_rate_black <- mean(jail_data$black_prison_pop_rate, na.rm = TRUE)

#avg rate rural
avg_rate_rural <- jail_data %>%
  filter(urbanicity == "rural") %>%
  summarize(average_rate = mean(total_prison_pop_rate, na.rm = TRUE)) %>%
  pull(average_rate)

# avg rate rural (among Black population)
avg_rate_rural_black <- jail_data %>%
  filter(urbanicity == "rural") %>%
  summarize(average_rate2 = mean(black_prison_pop_rate, na.rm = TRUE)) %>%
  pull(average_rate2)


# avg rate small/mid city
avg_rate_small <- jail_data %>%
  filter(urbanicity == "small/mid") %>%
  summarize(average_rate3 = mean(total_prison_pop_rate, na.rm = TRUE)) %>%
  pull(average_rate3)

# avg rate small/mid among Black population
avg_rate_small_black <- jail_data %>%
  filter(urbanicity == "small/mid") %>%
  summarize(average_rate4 = mean(black_prison_pop_rate, na.rm = TRUE)) %>%
  pull(average_rate4)

# avg rate urban
avg_rate_urban <- jail_data %>%
  filter(urbanicity == "urban") %>%
  summarize(average_rate5 = mean(total_prison_pop_rate, na.rm = TRUE)) %>%
  pull(average_rate5)
avg_rate_urban

# avg rate black urban
avg_rate_urban_black <- jail_data %>%
  filter(urbanicity == "urban") %>%
  summarize(average_rate6 = mean(black_prison_pop_rate, na.rm = TRUE)) %>%
  pull(average_rate6)
avg_rate_urban_black

# max rate
max_rate <- max(jail_data$total_prison_pop_rate, na.rm = TRUE)

# max rate black pops
max_rate_black <- max(jail_data$black_prison_pop_rate, na.rm = TRUE)

# min rate
min_rate <- min(jail_data$total_prison_pop_rate, na.rm = TRUE)

# min rate black pops
min_rate_black <- min(jail_data$black_prison_pop_rate, na.rm = TRUE)

# diff in rates over time
avg_rate_1970<- jail_data %>%
  filter(year == "1970") %>%
  summarize(average_rate7 = mean(total_prison_pop_rate, na.rm = TRUE)) %>%
  pull(average_rate7)

jail_data$total_prison_pop_rate <- as.numeric(jail_data$total_prison_pop_rate)
avg_rate_2018 <- jail_data %>%
  filter(year == "2018") %>%
  summarize(average_rate8 = mean(total_prison_pop_rate, na.rm = TRUE)) %>%
  pull(average_rate8)
avg_rate_2018
diff_rate <- avg_rate_2018 - avg_rate_1970
diff_rate


