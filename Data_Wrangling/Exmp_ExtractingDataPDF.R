'''
download a dataset providing the scientific funding rates by gender in the 
Netherlands. The data is provided in PDF document
'''
library(tidyverse)
library(dslabs)
data("research_funding_rates")
research_funding_rates 
install.packages("pdftools")
library("pdftools")
temp_file <- tempfile() # create a temperory file name 
url <- "http://www.pnas.org/content/suppl/2015/09/16/1510159112.DCSupplemental/pnas.201510159SI.pdf"
download.file(url, temp_file)
txt <- pdf_text(temp_file)
file.remove(temp_file)
raw_data_research_funding_rates <- txt[2] # extract the page in the file that we want
raw_data_research_funding_rates %>% head # this gives a long string with lines seperated by \n
tab <- str_split(raw_data_research_funding_rates, "\n")
tab <- tab[[1]]
tab %>% head
#extract the column names
the_names_1 <- tab[3]
the_names_2 <- tab[4]
#Creating the column names
the_names_1 <- the_names_1 %>%
  str_trim() %>% # remove space from star and end of the string 
  str_replace_all(",\\s.", "") %>% # remove everything following a comma 
  str_split("\\s{2,}", simplify = TRUE) # splitting string using space (only when there is two ore more spaces)
the_names_1
the_names_2 <- the_names_2 %>%
  str_trim() %>%
  str_split("\\s+", simplify = TRUE)
the_names_2
# join these and create one name for each column
tmp_names <- str_c(rep(the_names_1, each = 3), the_names_2[-1], sep = "_")
the_names <- c(the_names_2[1], tmp_names) %>%
  str_to_lower() %>% # convert to lower case 
  str_replace_all("\\s", "_")
the_names


