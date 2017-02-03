##2.5 Divide president by popularity
#To better study the relationship between popularity of president during election and their inaugural speech, I group the presidents by whether or not they are popular among the people.  
#a.Unpopular group: popular vote margin <= 20th quantile of all the vote margin data
#b.popular group: popular vote margin >= 80th quantile of all the vote margin data
#c. group: everyone in between

#(1)calculate 20th and 80th quantile
lowbound <- quantile(popular_vote$Popular_vote_margin,0.20)
highbound <- quantile(popular_vote$Popular_vote_margin,0.80)
#(2)we want only the 2th,3th,8th,9th column, which are Filename(President name),term,vote margin and type of file.
unpopular.prsd<- na.omit(speech.list[,c(1,2,3,8,9)][(speech.list$vote_mar <= lowbound) & (speech.list$vote_mar > 0) ,])
unpopular.prsd <- unpopular.prsd[order(unpopular.prsd$vote_mar),]
popular.prsd <- na.omit(speech.list[,c(1,2,3,8,9)][speech.list$vote_mar >= highbound,])
popular.prsd <- popular.prsd[order(popular.prsd$vote_mar,decreasing = T),]
ok.prsd <- na.omit(speech.list[,c(1,2,3,8,9)][(speech.list$vote_mar > lowbound) & (speech.list$vote_mar < highbound) ,])

#Who is the most unpopular president during his election? The first one in the list:
print("unpopular ones")
unpopular.prsd
#Who is the most popular president during his election? The first one in the list:
print("popular ones")
popular.prsd

#(3)subseting our other data in terms of popularity
#defining what to keep in each group
speech.list$grouping_index <- paste(speech.list$File,speech.list$Term)
grouping_rule1 <- paste(unpopular.prsd$File,unpopular.prsd$Term)
grouping_rule2 <- paste(popular.prsd$File,popular.prsd$Term)
grouping_rule3 <- paste(ok.prsd$File,ok.prsd$Term)
#subseting different group
unpop <- speech.list[speech.list$grouping_index %in% grouping_rule1,]
pop <- speech.list[speech.list$grouping_index %in% grouping_rule2,]
ok <- speech.list[speech.list$grouping_index %in% grouping_rule3,]
