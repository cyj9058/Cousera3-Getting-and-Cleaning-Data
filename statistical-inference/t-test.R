library(UsingR)
data(sleep)

g1<-sleep$extra[1:10]
g2<-sleep$extra[11:20]
difference<-g2-g1

mn<-mean(difference)
s<-sd(difference)
n<-10

t.test(difference)
t.test(g2,g1,paired = TRUE)
t.test(extra ~ I(relevel(group, 2)), paired = TRUE, data = sleep)
