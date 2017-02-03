#example
install.packages('visNetwork')
library('visNetwork')
#formating edges between nodes, from each president's emotions data 
#1.creating nodes
Network_flora <- function(input_sentiment = speech_sentiment){
nodes <- speech_sentiment[,1:2]
#1.1 Create node id
nodes$id <- 1:nrow(nodes)

#1.2 keep president last name
name_split <- strsplit(nodes$President," ")
last_name <- laply(name_split,function(x) x[length(x)])
last_name[22:23] <- c("Cleveland I","Cleveland - II")

#1.3 edit node name
nodes$name <- paste(last_name,"T",nodes$Term)
#1.4 adding node title data
nodes$vote <- speech.list$vote_mar
nodes <- nodes[,-c(1,2)]

#1.5 adding the emotion node
DF <- melt(speech_sentiment,variable.name = "emotion",value.name = "emo_index",id.vars = c("President","Term"))
DF$id <- as.numeric(factor(DF$emotion))+100
names(DF)[3] <- "name"
nodes_2 <- data.frame(id = 101:(length(unique(DF$name))+100),name= unique(DF$name),vote = NA)
nodes <- rbind(nodes,nodes_2)
nodes$level <- 1
nodes$level[59:66]<- 2

#2.prettify staff for nodes
#nodes$color.background[1:58] <- c("lightblue")
#nodes$color.background[59:66] <- c("red","darkyellow","green","purple","pink","slategrey","gold","blue")
nodes$color.background <- c(brewer.pal(9,"Blues"),
                          brewer.pal(9,"Reds"),
                          brewer.pal(9,"Greens"),
                          brewer.pal(9,"Purples"),
                          brewer.pal(9,"Oranges"),
                          brewer.pal(4,"Greys"),
                          brewer.pal(11,"Spectral"),
                          brewer.pal(11,"RdYlGn"))[as.factor(nodes$name)]  
nodes$title <- paste(nodes$President,"Term ",nodes$Term) # Text on click
nodes$borderWidth <- 2
nodes$color.border <- "grey"
nodes$size <- 20
nodes$label <- nodes$name
nodes$title <- paste("Vote margin:",nodes$vote)

#3.Creating links between nodes (called edges)
speech_sentiment$index <- 1:nrow(speech_sentiment)
DF <- melt(speech_sentiment,variable.name = "emotion",value.name = "emo_index",
           id.vars = c("index","President","Term"))
DF$to <- as.numeric(factor(DF$emotion))+100
names(DF)[1] <- "from"
#note:Since plotting takes time, we only choose a collection of them to demonstrate
edges <- DF[seq(1,nrow(DF),4),]

#4.prettify for edages
edges$width <- edges$emo_index*100 #magnify the difference
edges$color <- brewer.pal(1,"Blues")

#5.creating interactive Network of presidents and their emotions
visNetwork(nodes, edges, width = "100%",main="Network!") %>% 
  #allow to select node by id name
  visOptions(highlightNearest = TRUE,
             nodesIdSelection = list(enabled = TRUE,
                                      style = 'background: #f8f8f8;
                                     color: darkblue;
                                     border:none;
                                     ')) %>%
  visPhysics(stabilization = FALSE)
}