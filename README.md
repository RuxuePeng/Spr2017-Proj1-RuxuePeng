# Spring 2017
# Project 1: Does less popular presidents deliver better inaugural speech?

![image](figs/network.png)

### [Project Description](doc/)
Inspiration:  
Having won the election by one of *the smallest popular vote margins* in history, my favorite U.S. president has always been John F. Kennedy. He had only *49.72%* of the popular vote.  But he's also remembered as a president who has delivered one of the most memorable and enduring inaugural speeches.

*Is popular vote margin related to U.S. president's performance in inaugural speech?* 
In other words, does pressure to win back the public's heart push U.S. presidents to deliver more comprehansible and admirable inaugural speeches? Let's find out.

+ Project title: Does less popular presidents deliver better inaugural speech?
+ This project is conducted by Ruxue Peng

+ Project summary: 
  I approach the question by first, quantify the concept of a "good" speech. Therefore, I calculated the sentene length of every inaugural speech and also calculatd *readability index* which tells how easy a text is for people to understand, by estimating the *grade level* required to understand it. Secondly, I quantified the concept of "popular" and "unpopular" presidents, grouping them by vote margin. At last, I visualized the relationship by some standard EDA, sentiment analysis plus plotted a really cool *interactive network graph". 
 + Conclusion:
  * Unpopular presidents tried to be more comprehensible by making sentences shorter and spreading these easy sentences across their speeches
  * It takes as low as a high school junior student to understand "unpopular" presidents, but an average of higher to understand the "popular ones"
  * Even though individual "unpopular" president, like Trump, demostrated an intense emotion during his speech, this group as a whole does not differ much from the "popular" one in term of emotion level.


3. Network visualization

[click me!](https://drive.google.com/file/d/0B--tVLdnZKpkcnhhTFBCcjJiVkk/view?usp=sharing) to play with it




Following [suggestions](http://nicercode.github.io/blog/2013-04-05-projects/) by [RICH FITZJOHN](http://nicercode.github.io/about/#Team) (@richfitz). This folder is orgarnized as follows.

```
proj/
├── lib/
├── data/
├── doc/
├── figs/
└── output/
```
To reproduce the result:
Please see each subfolder for a README file.
*Before you start, please clone/download this entire project folder and set working directory at the Doc folder of this project*

Further Learning Materials:
[Web Scrapping](http://francojc.github.io/web-scraping-with-rvest/) 
[Selectorgadget](http://selectorgadget.com/)
[NRC sentiment lexion](http://saifmohammad.com/WebPages/NRC-Emotion-Lexicon.htm)
[blog of Max Ghenis for Readability index](https://www.r-bloggers.com/statistics-meets-rhetoric-a-text-analysis-of-i-have-a-dream-in-r/)
[Automated Readability Index](https://trinker.github.io/qdap/Readability.html)
["visNetwork" package](https://datastorm-open.github.io/visNetwork/) and some [related learning materials](http://kateto.net/network-visualization)
[Text Mining](https://rstudio-pubs-static.s3.amazonaws.com/31867_8236987cf0a8444e962ccd2aec46d9c3.html)


