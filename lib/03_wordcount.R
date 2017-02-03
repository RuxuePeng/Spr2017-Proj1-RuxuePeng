#Divide and count word
##3.1 Divide speech texts into sentences.
#We will use sentences as units of analysis for this project, as sentences are natural languge units for organizing thoughts and ideas.  

##3.2 Calculate wordcount and emotion level of each sentence.
sentence.list=NULL
for(i in 1:nrow(speech.list)){
  sentences=sent_detect(speech.list$fulltext[i],
                        endmarks = c("?", ".", "!", "|",";"))
  #3.2.1
  if(length(sentences)>0){
    emotions=get_nrc_sentiment(sentences)
    word.count=word_count(sentences)
    # colnames(emotions)=paste0("emo.", colnames(emotions))
    # in case the word counts are zeros?
    emotions=diag(1/(word.count+0.01))%*%as.matrix(emotions)
    sentence.list=rbind(sentence.list, 
                        cbind(speech.list[i,-ncol(speech.list)],
                              sentences=as.character(sentences), 
                              word.count,
                              emotions,
                              sent.id=1:length(sentences)
                        )
    )
  }
}

#Some non-sentences exist in raw data due to erroneous extra end-of sentence marks. 
sentence.list=
  sentence.list%>%
  filter(!is.na(word.count)) 
