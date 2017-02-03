##4 Generate readability index of speech

#Readability test is formulae for evaluating the readability of text, which is typically "based on syllables, words, and sentences in order to approximate the grade level required to comprehend a text.", quoting Max Ghenis, an R-blogger.  
#Following the [blog of Max Ghenis](https://www.r-bloggers.com/statistics-meets-rhetoric-a-text-analysis-of-i-have-a-dream-in-r/), I calculated the readability level of each president's speech.  
#'qdap' package offers several of the most popular formulas, of which I chose the [Automated Readability Index](https://trinker.github.io/qdap/Readability.html).

#(1)calculate the readability of speech as a whole:
grouping_rule <- paste(sentence.list$President,"Term:",sentence.list$Term)
readability.table <- automated_readability_index(sentence.list$sentences,grouping_rule)$Readability
#(2)store the result in speech.list data frame:
speech.list$readability <- readability.table$Automated_Readability_Index

#(3)calculate each sentence's readability:
  #first add a column of index
  sentence.list <- cbind(index =c(1:nrow(sentence.list)),sentence.list)
#store the readability data into sentence.list data frame
sentence.list$readability <- automated_readability_index(sentence.list$sentences,sentence.list$index)$Readability$Automated_Readability_Index
sentence.list$readability <- replace(sentence.list$readability,sentence.list$readability<0,0.001) 
