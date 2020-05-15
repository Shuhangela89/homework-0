'''
This library contains a variety of datasets 
related to US professional baseball.
'''
install.packages("Lahman")
library(dplyr)
library(Lahman)

'''
The Batting data frame contains the offensive statistics for all 
baseball players over several seasons. 
'''
top <- Batting %>% 
  filter(yearID == 2016) %>%
  arrange(desc(HR)) %>%
  slice(1:10) # take entries 1 - 10 
top %>% as_tibble()

#the Master data frame has demographic information for all players
Master %>% as_tibble()
top_names <- top %>% left_join(Master) %>%
  select(playerID, nameFirst, nameLast, HR)

# Inspect the Salaries data frame. 
Salaries

'''
Filter this data frame to the 2016 salaries, then use the correct
bind join function to add a salary column to the top_names data 
frame from the previous question
'''
top_salary <- Salaries %>% filter(yearID == 2016) %>%
  right_join(top_names) %>%
  select(nameFirst, nameLast, teamID, HR, salary)
top_salary

#Inspect the AwardsPlayers table
Awards <- AwardsPlayers %>% filter(yearID == 2016) %>%
  select(playerID)
# How many players from the top 10 home run hitters won at least one award in 2016?
top_names %>% select(playerID) %>% intersect(Awards)

'''
or
Awards_2016 <- AwardsPlayers %>% filter(yearID == 2016)
length(intersect(Awards_2016$playerID, top_names$playerID))
'''

#How many players won an award in 2016 but were not one of the top 10 home run hitters in 2016?
top_names1 <- top_names %>% select(playerID)
AwardsPlayers %>% filter(yearID == 2016) %>% 
  select(playerID) %>%
  setdiff(top_names1)
'''
or 
length(setdiff(Awards_2016$playerID, top_names$playerID))
'''
