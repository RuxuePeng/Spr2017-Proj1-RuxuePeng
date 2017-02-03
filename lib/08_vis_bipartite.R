install.packages("igraph")
install.packages("jpeg")
library("igraph")
library("jpeg")

#### create example input data
nodesSet1 <- 1:10
nodesSet2 <- 1:8
edgeList <- data.frame(S1=c(2,2,4,5,6,7,8,9),
                       S2=c(2,3,4,5,8,3,2,4))
width <- c(1:8)
color <- c("red","yellow","green","purple","pink","grey","orange","blue")
####

### PREMISE :
### graph.bipartite function simply create a graph and add a boolean 'type' attribute
### to each vertex that indicate the partition of the vertex (e.g. TRUE first partition, 
### FALSE second partition).
### So, it's not strictly necessary to use that function to get a bipartite graph, but 
### you can use any method you like (or feel easier) as long as you add a 'type' 
### attribute. 
### Hence, in the following code I won't use graph.bipartite since I don't like it :)


# first we give prefixes to the nodes to discern the two partition
g <- graph.empty()
g <- add.vertices(g,nv=length(nodesSet1),attr=list(name=paste0('pre',nodesSet1),
                                                   type=rep(TRUE,length(nodesSet1))))
g <- add.vertices(g,nv=length(nodesSet2),attr=list(name=paste0('E',nodesSet2),
                                                   type=rep(FALSE,length(nodesSet2))))

# we need to turn edgeList into a vector (and using names instead of indexes)
edgeListVec <- as.vector(t(as.matrix(data.frame(S1=paste0('pre',edgeList$S1),
                                                S2=paste0('E',edgeList$S2)))))
g <- add.edges(g,edgeListVec)

# check if is recognized as bipartite
is.bipartite(g)

# let's plot it !
plot.igraph(g, layout=layout_in_circle,
            vertex.color=NA,vertex.label.color = c("grey","red")[V(g)$type+1],
            vertex.size = 28,vertex.shape = "square",vertex.frame.color=NA,
            vertex.label.font= 4,
            edge.color = color,edge.width = 1,edge.arrow.size = 0.5,
            )
#img.3 <- readJPEG("moana.jpg")
#rasterImage(img.3,  xleft=-1.7, xright=0, ybottom=-1.2, ytop=0)
