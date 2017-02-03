#Data Preparation---web scrapping
#2.1
### Inauguaral speeches
main.page <- read_html(x = "http://www.presidency.ucsb.edu/inaugurals.php")
# Get link URLs
# f.speechlinks is a function for extracting links from the list of speeches. 
inaug=f.speechlinks(main.page)
#as.Date(inaug[,1], format="%B %e, %Y")
inaug=inaug[-nrow(inaug),] # remove the last line, irrelevant due to error.
we prepared CSV data sets for the speeches we will scrap.  

#2.2
#(1)The popular_vote_margin.csv file contains popular vote margin of each president from president Andrew Jackson.  
#(2)The inauglist.csv file contains informations like president's name, term, party, inauguration date and total words in the speech.  
popular_vote <- read.csv("../data/popular_vote_margin.csv",header = T,as.is = T)
inaug.list<-read.csv("../data/inauglist.csv", stringsAsFactors = FALSE)
names(inaug.list)[1]<-'President' #fix a column name error
#Bind the columns and store them into one data frame.
inaug.list$vote_mar <- c(rep(NA,10),popular_vote$Popular_vote_margin)

## 1.3 Scrap the full texts of speeches from the speech URLs
speech.list<-inaug.list
speech.list$type=rep("inaug", nrow(inaug.list))
speech.url<-inaug
speech.list=cbind(speech.list, speech.url)

# Loop over each row in speech.list
speech.list$fulltext=NA
for(i in seq(nrow(speech.list))) {
  text <- read_html(speech.list$urls[i]) %>% # load the page
    html_nodes(".displaytext") %>% # isloate the text
    html_text() # get the text
  speech.list$fulltext[i]=text
  # Create the file name
  filename <- paste0("../data/full_speech/",
                     speech.list$type[i],
                     speech.list$File[i], "-", 
                     speech.list$Term[i], ".txt")
  sink(file = filename) %>% # open file to write 
    cat(text)  # write the file
  sink() # close the file
  