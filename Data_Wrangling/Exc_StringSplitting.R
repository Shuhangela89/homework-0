'''
in this excercise, the "and" in "Mandy" needs to be taken into account. Therefore
an empty space needs to be defined before and after and
'''
library(tidyverse)
day <- c("Monday", "Tuesday")
staff <- c("Mandy, Chris and Laura", "Steve, Ruth and Frank")
schedule <- data.frame(day, staff)
str_split(schedule$staff, ",|and")
str_split(schedule$staff, ", | and ")
str_split(schedule$staff, ",\\s|\\sand\\s")
str_split(schedule$staff, "\\s?(,|and)\\s?")

# this is the correct code to get the wanted table. Check the result
tidy <- schedule %>% 
  mutate(staff = str_split(staff, ", | and ")) %>% 
  unnest()

#This won't work, since unnest() only work with a list but simplify = TRUE gives a matrix
tidy <- schedule %>% 
  mutate(staff = str_split(staff, ", | and ", simplify = TRUE)) %>% 
  unnest()

# this won't work,
tidy <- separate(schedule, staff, into = c("s1","s2","s3"), sep = “,”) %>% 
  gather(key = s, value = staff, s1:s3)



