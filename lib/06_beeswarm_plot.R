
#6 data analysis

##6.1 comparison by sentence length
#Unpopular presidents used short sentences and easy words and expressions, trying to be more comprehensible to the public, than the popular ones.  

### Observing sentence length  
#The mass of popular president's wordcount is generally bigger than the unpopular ones,meaning popular presidents made longer sentences.  
Data_1 <- cbind(unpopular=unpop$avg_wordcount,
              inbetween = ok$avg_wordcount,
                popular=pop$avg_wordcount)
boxplot(Data_1,col = brewer.pal(3,"Blues"),horizontal=T,
        main = "Sentence Length",xlab = "Average Word Count per sentence")


###Most Unpopular VS Most Popular, sentence length
Let us compare the top 3 president with least popular vote margin and the top 3 with the most, in terms for sentence length.  
The three popular ones had short sentences in the beginning of the speech and got longer and longer as the speech went to an end, while the unpopular ones had short sentences spreaded out and mixed with the longer sentences.  

queen<-unpopular.prsd[1:3,];king<-popular.prsd[1:3,]
subset_rule    <- sentence.list$President %in% queen$President &(sentence.list$Term %in% queen$Term)
queen_sentence <-sentence.list[subset_rule,c("President",    "File"  ,       "Term" ,  "sentences",    "word.count" ,  "sent.id" ,     "readability" )]
subset_rule    <- sentence.list$President %in% king$President &(sentence.list$Term %in% king$Term)
king_sentence <-sentence.list[subset_rule,c("President",    "File"  ,       "Term" ,  "sentences",    "word.count" ,  "sent.id" ,     "readability" )]

##6.2visualizing the data

###Visualization-barplot for wordcount  

par(mfrow=c(2,1))
queen_sentence$index <- seq(nrow(queen_sentence))
barplot(queen_sentence$word.count,
        #appearance adjustments
        col = alpha(rainbow(100),alpha  = 0.6),
        border = alpha(rainbow(100),alpha  = 0.6),
        xlim = c(0,max(queen_sentence$index)),ylim = c(0,80),
        main="Sentence Length over Time-Top 3 Unpopular Presidents",
        xlab = "Time",ylab = "Words per Sentence")
king_sentence$index <- seq(nrow(king_sentence))
barplot(king_sentence$word.count,
        #appearance adjustments
        col = alpha(rainbow(100),alpha  = 0.6),
        border = alpha(rainbow(100),alpha  = 0.6),
        xlim = c(0,max(king_sentence$index)),ylim = c(0,80),
        main="Sentence Length over Time-Top 3 Popular Presidents",
        xlab = "Time",ylab = "Words per Sentence")
###Visualization-beeswarm plot for wordcount
par(mfrow=c(2,1))
beeswarm(queen_sentence$word.count,horizontal = TRUE, 
         pch=16, 
         col="cornflowerblue",
         col.main = "Blue", 
         cex=0.55, cex.axis=1, cex.lab=1,xlim = c(0,80),
         las=2, xlab="", ylab="sentence length",
         main="Sentence Length-Top 3 Unpopular Presidents")
king_sentence$index <- seq(nrow(king_sentence))
beeswarm(king_sentence$word.count,horizontal = TRUE, 
         pch=16, col="Pink", col.main = "Red",
         cex=0.55, cex.axis=1, cex.lab=1,xlim = c(0,80),
         las=2, xlab="Time", ylab="sentence length",
         main="Sentence Length-Top 3 Popular Presidents")
