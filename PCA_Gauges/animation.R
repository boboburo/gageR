library(magrittr)
library(dplyr)
library(nycflights13)
library(ggplot2)

sub_plots <- group_by(flights, month, day) %>%
  do(plot = ggplot(., aes(distance, arr_delay)) + geom_point() + geom_smooth())

sub_plots %>% do({print(.$plot); Sys.sleep(1)})
