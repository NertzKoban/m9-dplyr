# Exercise 5: DPLYR Grouped Operations

# Install the nycflights13 package and read it in. Require the dplyr package.
# install.packages("nycflights13")
library(nycflights13)
library(dplyr)

# In which month was the average departure delay the greatest?
# Hint: you'll have to perform a grouping operation before summarizing your data
dep.delay.monthly <- flights %>% 
  group_by(month) %>% 
  summarise(mean_delay = mean(dep_delay, na.rm = TRUE))

# If you create a data.frame with the columns "month", and "delay" above, you should be able to create 
# a scatterplot by passing it to the 'plot' function
plot(dep.delay.monthly$month, dep.delay.monthly$mean_delay)

# In which airport were the average arrival delays the highest?
# Hint: you'll have to perform a grouping operation before summarizing your data
arr.delay.airport <- flights %>% 
  group_by(dest) %>% 
  summarise(mean_delay = mean(arr_delay, na.rm = TRUE))

### Bonus ###
# Which city was flown to with the highest average speed?
speed.to.airport <- flights %>% 
  mutate(speed = distance / air_time) %>% 
  group_by(dest) %>% 
  summarise(mean_speed = mean(speed, na.rm = TRUE)) %>% 
  arrange(-mean_speed)