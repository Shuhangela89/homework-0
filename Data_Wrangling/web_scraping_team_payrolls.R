library(dplyr)
library(rvest)
url <- "https://web.archive.org/web/20181024132313/http://www.stevetheump.com/Payrolls.htm"
h <- read_html(url)
# extract the node type table
nodes <- html_nodes(h,"table")
# see the content of the table
html_text(nodes[[4]])
# onvert the table into a data frame
html_table(nodes[[4]])
# to view the first four tables in nodes
sapply(nodes[1:4], html_table)
# check the last three components in nodes
html_table(nodes[[length(nodes)-2]])
html_table(nodes[[length(nodes)-1]])
html_table(nodes[[length(nodes)]])

# select the 10th and 19th element of nodes 
tab_1 <- html_table(nodes[[10]])
tab_2 <- html_table(nodes[[19]])
tab_1
tab_2
#delete the first row and first column of tab_1 and name the columns
tab_1 <- tab_1[ -1,-1] %>%
  setNames(c("Team", "Payroll", "Average"))
tab_1
tab_2 <- tab_2[ -1,] %>%
  setNames(c("Team", "Payroll", "Average"))
tab_2
#combine tab_1 and tab_2 by team
join_tab <- full_join(tab_1,tab_2, by = "Team")
nrow(join_tab)


