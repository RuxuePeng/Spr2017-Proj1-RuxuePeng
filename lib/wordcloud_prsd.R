wordcloud_prsd <- function(folder.path){
  speeches=list.files(path = folder.path, pattern = "*.txt")
  prex.out=substr(speeches, 6, nchar(speeches)-4)
  
  ff.me<-Corpus(DirSource(folder.path))
  ff.me<-tm_map(ff.me, stripWhitespace)
  ff.me<-tm_map(ff.me, content_transformer(tolower))
  ff.me<-tm_map(ff.me, removeWords, stopwords("english"))
  ff.me<-tm_map(ff.me, removeWords, character(0))
  ff.me<-tm_map(ff.me, removePunctuation)
  
  tdm.all<-TermDocumentMatrix(ff.me)
  
  tdm.tidy=tidy(tdm.all)
  
  tdm.overall=summarise(group_by(tdm.tidy, term), sum(count))
  wordcloud(tdm.overall$term, tdm.overall$`sum(count)`,
            scale=c(5,0.5),
            max.words=100,
            min.freq=1,
            random.order=FALSE,
            rot.per=0.3,
            use.r.layout=T,
            random.color=FALSE,
            colors=brewer.pal(9,"Blues"))
  
}