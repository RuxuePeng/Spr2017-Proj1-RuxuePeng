sort_f <- function(x = speech_sentiment){
  a <- x
  a[,1:3]
  b <- unpopular.prsd
  c<- popular.prsd
  pre_names <- paste(a$President,a$Term)
  C_unpop <- pre_names %in% paste(b$President,b$Term)
  C_pop <- ifelse(pre_names %in% paste(c$President,c$Term),2,0)
  C <- C_unpop+C_pop
  C[C==1] <- "Unpopular presidents";
  C[C==2] <- "Popular presidents"
  C[C==0]<- "Presidents in between"  
  return(C)
}
