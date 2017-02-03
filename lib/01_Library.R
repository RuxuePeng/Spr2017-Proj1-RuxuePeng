#packages
#If you use a win10*64 and have problem with qdap package, run the following code first:
if (Sys.getenv("JAVA_HOME")!="")
  Sys.setenv(JAVA_HOME="")
library(rJava)

packages.used=c("tm", "wordcloud", "dplyr", "tidytext","rvest", "tibble", "qdap", 
                "sentimentr", "gplots", "dplyr",
                "tm", "syuzhet", "factoextra", 
                "beeswarm", "scales", "RColorBrewer",
                "RANN", "topicmodels","rJava","reshape2","plyr","visNetwork","png")

# check packages that need to be installed.
packages.needed=setdiff(packages.used, 
                        intersect(installed.packages()[,1], 
                                  packages.used))
# install additional packages
if(length(packages.needed)>0){
  install.packages(packages.needed, dependencies = TRUE)
}

# load packages
library('png')
library('visNetwork')
library("reshape2")
library("wordcloud")
library("dplyr")
library("plyr")
library("tidytext")
library("rvest")
library("tibble")
library("qdap")
library("sentimentr")
library("gplots")
library("dplyr")
library("tm")
library("syuzhet")
library("factoextra")
library("beeswarm")
library("scales")
library("RColorBrewer")
library("RANN")
library("tm")
library("topicmodels")

source("../lib/plotstacked.R")
source("../lib/speechFuncs.R")
source("../lib/wordcloud_prsd.R")
source("../lib/Network_flora.R")
source("../lib/sort_f.R")
