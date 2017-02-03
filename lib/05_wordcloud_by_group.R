#We now enter data analysis process:
#6 Get started by drawing Wordclouds

#For the speeches, I remove extra white space, convert all letters to the lower case, 
#remove [stop words](https://github.com/arc12/Text-Mining-Weak-Signals/wiki/Standard-set-of-english-stopwords), removed empty words due to formatting errors, and remove punctuation. Then I compute the [Document-Term Matrix (DTM)](https://en.wikipedia.org/wiki/Document-term_matrix) and draw the wordcloud. I have wrapped the whole process in a function named "wordcloud_prsd".  

###6.1 Inspect an overall wordcloud
path="../data/inaugurals/"
#use my own function
#can choose color pallete of cloud, options are: Blues BuGn BuPu GnBu Greens Greys Oranges OrRd PuBu PuBuGn PuRd Purples RdPu Reds YlGn YlGnBu YlOrBr YlOrRd
wordcloud_prsd(path,color.pallete = "Blues" )

###6.2 Inspect popular presidents' vs unpopular presidents' wordcloud
Popular presidents used affirmative and confident words frequently, such as "must" and tend to focus on the big picture, such as "world".
In terms of unpopular presidents, an interesting frequently-visited word is "states", having higher frequncy than "nation", which is different from the popular presidents.
#1st: find the file corresponding to the group of president:
for(i in seq(nrow(unpopular.prsd))) {
  filename <- paste0("../data/full_speech/",
                     unpopular.prsd$type[i],
                     unpopular.prsd$File[i], "-", 
                     unpopular.prsd$Term[i], ".txt")
  destination <- paste0("../data/unpopular/",
                        unpopular.prsd$type[i],
                        unpopular.prsd$File[i], "-", 
                        unpopular.prsd$Term[i], ".txt")
  #put the file in a new folder called 'unpopular'
  file.copy(from = filename,to = destination)
}

for(i in seq(nrow(popular.prsd))) {
  filename <- paste0("../data/full_speech/",
                     popular.prsd$type[i],
                     popular.prsd$File[i], "-", 
                     popular.prsd$Term[i], ".txt")
  destination <- paste0("../data/popular/",
                        popular.prsd$type[i],
                        popular.prsd$File[i], "-", 
                        popular.prsd$Term[i], ".txt")
  #put the file in a new folder called 'popular'
  file.copy(from = filename,to = destination)
}

#draw the wordcloud
path1 <- "../data/unpopular/"
path2 <- "../data/popular/"
par(mfrow = c(1,2))
wordcloud_prsd(path1)
wordcloud_prsd(path2,color.pallete = "OrRd")


