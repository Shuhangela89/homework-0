library(rvest)
library(tidyverse)
url <- "https://en.wikipedia.org/w/index.php?title=Opinion_polling_for_the_United_Kingdom_European_Union_membership_referendum&oldid=896735054"
h <- read_html(url)
tab <- html_nodes(h,"table" )
length(tab)
html_table(tab[[5]], fill = TRUE) %>% ncol()
html_table(tab[[5]], fill = TRUE) %>% names()
