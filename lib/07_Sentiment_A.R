
##7 Sentiment Analysis and Comparison
#In this part,we compare the sentiment in each president's inaugural speech and then make further comparison between the popular group and the unpopular one.  
sentence_sentiment <- sentence.list[,c("President","File","Term",
                                       "anger","anticipation", "disgust",
                                       "fear" ,"joy" ,"sadness","surprise","trust" )]
#split-apply-combine
Avg_column <- function(x,colstart,colend){
  return(apply(x[colstart:colend],2,mean))
}
speech_sentiment <- ddply(sentence_sentiment,.(President,Term),Avg_column,colstart=4,colend=11)

sentence_sen_direction <- sentence.list[,c("President","File","Term","negative","positive")]
speech_sen_direction <- ddply(sentence_sen_direction,.(President,Term),Avg_column,colstart=4,colend=5)
