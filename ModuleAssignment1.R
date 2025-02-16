Basketball<-SEASON_2014_15_STATS_OF_NBA_BOTH_CONFERENCE_
library(tidyverse)
Basketball <- subset(Basketball, select = -Team,G)
install.packages("corrplot")
library(corrplot)
cor_matrix <- cor(Basketball, use = "complete.obs")
Basketball <- subset(Basketball, select = -G)
corrplot(cor_matrix, method = "color", type = "upper", tl.col = "black", tl.srt = 45)
lm<-lm(WIN~.,data=Basketball)
summary(lm)
plot(Basketball$PTS,Basketball$WIN, 
     xlab = "Points", 
     ylab = "Wins", 
     main = "Scatter Plot of Points vs Wins", 
     pch = 19,
     col = "blue")
plot(Basketball$FTM,Basketball$WIN, 
     xlab = "Free Throws Made", 
     ylab = "Wins", 
     main = "Scatter Plot of Free Throws Made vs Wins", 
     pch = 19,
     col = "blue")
lm.step <- step(lm, direction = "backward")