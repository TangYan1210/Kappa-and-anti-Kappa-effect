rm(list=ls())  

library(lme4) 
library(lmerTest)  
data <- read.csv("C:\\Users\\Administrator\\Desktop\\EXP1-random\\3-LMM-ANOVA\\LMM\\RPSE.csv")
names(data) <-c("Participant ID","Modality","Distance","LogDistance","PSE","LogPSE")
data[,2]<-data[,2]-mean(data[,2])
data[,4]<-data[,4]-mean(data[,4])
 

mod1 <- lmer(LogPSE ~ Modality + LogDistance + Modality:LogDistance + (1|Participant ID) + (0 + Modality + LogDistance + Modality:LogDistance|Participant ID), data=data, REML=F)
summary(mod1)
anova(mod1)
dataClass = predict(mod1)
write.csv(dataClass,file = "C:\\Users\\Administrator\\Desktop\\EXP1-random\\3-LMM-ANOVA\\LMM\\Predic1.csv", row.names = T)



  
  
  