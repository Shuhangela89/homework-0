library(rvest)
library(tidyverse)
library(stringr)
url <- "https://en.wikipedia.org/w/index.php?title=Opinion_polling_for_the_United_Kingdom_European_Union_membership_referendum&oldid=896735054"
tab <- read_html(url) %>% html_nodes("table")
polls <- tab[[5]] %>% html_table(fill = TRUE)
# change column names 
colnames(polls) <- c("dates", "remain", "leave", "undecided", "lead", "samplesize", "pollster", "poll_type", "notes")
polls <- polls [-1,]
# my code to only keep rows having % in the remain column
polls <- polls %>% mutate(test = str_extract(.$remain, "%"))
polls <- polls %>% subset(.$test != "NA")
# or using following code
polls <- subset(polls, str_detect(polls$remain, "%"))
nrow(polls)
# answer code to only keep rows having % in the remain column 
polls <- polls[str_detect(polls$remain, "%"), -9]
nrow(polls)
