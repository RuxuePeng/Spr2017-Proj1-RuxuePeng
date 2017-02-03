#I wrote a function myself ploting Network of Presidents and their speech emotions
#1.creating nodes
Network_flora <- function(input_sentiment = speech_sentiment){
nodes <- speech_sentiment[,1:2]
#1.1 Create node id
nodes$id <- 1:nrow(nodes)

#1.2 keep president last name
name_split <- strsplit(nodes$President," ")
last_name <- laply(name_split,function(x) x[length(x)])
last_name[c(18,22,23,50)] <- c("W. Bush","Cleveland I","Cleveland - II","W.H.Harrison")
                            #There are 2 Bush and 2 Cleveland and 2 Harrison

#1.3 edit node name
nodes$name <- paste(last_name,"T",nodes$Term)
#1.4 adding node title data
B=inaug.list
B=B[order(B$President),]
B$President == speech_sentiment$President
nodes$vote <- B$vote_mar
nodes <- nodes[,-c(1,2)]

#1.5 adding the emotion node
speech_sentiment$index <- 1:nrow(speech_sentiment)
DF <- melt(speech_sentiment,variable.name = "emotion",value.name = "emo_index",
           id.vars = c("index","President","Term"))
DF$id <- as.numeric(factor(DF$emotion))+100
names(DF)[4] <- "name"
nodes_2 <- data.frame(id = unique(DF$id),name= unique(DF$name),vote = NA)
nodes <- rbind(nodes,nodes_2)
nodes$level <- 1
nodes$level[59:66]<- 2

#2.prettify staff for nodes
nodes$color.background <- c(brewer.pal(9,"Reds"),
                          brewer.pal(9,"Greens"),
                          brewer.pal(9,"Purples"),
                          brewer.pal(9,"Oranges"),
                          brewer.pal(4,"PRGn"),
                          brewer.pal(11,"RdYlGn"),
                          brewer.pal(11,"Spectral"),
                          brewer.pal(9,"Blues"))[as.factor(nodes$name)] 
#Create group
nodes$group <- c("President","Emotions")[nodes$level]
nodes$group[1:58] <- sort_f()

nodes$borderWidth <- 2
nodes$color.border <- "grey"
nodes$size <- 20
nodes$label <- nodes$name
nodes$title <- paste("Vote margin:",nodes$vote)
nodes$color.highlight.background <- "#4429f2"
nodes$color.highlight.border <- "#4429f2"


#3.Creating links between nodes (called edges)
speech_sentiment$index <- 1:nrow(speech_sentiment)
DF <- melt(speech_sentiment,variable.name = "emotion",value.name = "emo_index",
           id.vars = c("index","President","Term"))
DF$to <- as.numeric(factor(DF$emotion))+100
names(DF)[1] <- "from"
#note:Since plotting takes time, we only choose a collection of them to demonstrate
edges <- DF[seq(1,nrow(DF),2),]
#4.prettify for edages
edges$width <- edges$emo_index*100 #magnify the difference

#5.creating interactive Network of presidents and their emotions
  Network <- visNetwork(nodes, edges, width = "100%",main="Network of President-Emotion Relation") %>% 
  visGroups(groupname = "Emotions", shape = "square")%>%
  visEdges(shadow = TRUE,
           color = list(color= brewer.pal(3,"Blues")[2],highlight = "#0bd1ed")) %>%
  visLayout(randomSeed = 123)%>%
  #allow to select node by id name
  visOptions(highlightNearest = TRUE,
             selectedBy = "group",
              nodesIdSelection = list(enabled = TRUE,
                                    style = 'background: #f8f8f8;
                                    color: darkblue;
                                     border:none;
                                  ')) %>%
  visPhysics(stabilization = FALSE)%>%
  #add more interaction fun staff
  visInteraction(dragNodes = T, 
                 dragView = T, 
                 zoomView = T) 
  #The output plot is store in a html file named network.html
  #and will be saved in the output file of this project
  visSave(Network, file = "../out/network.html")
  return(Network)
}