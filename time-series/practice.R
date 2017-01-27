#Figure1.1 Johnson&Johnson Earnings 
data(jj)
plot(jj, type="o", ylab="Quarterly Earnings per Share")
acf(jj)

#Figure1.2 Global tempterature 
plot(gtemp, type="o", ylab="Global Temperature Deviations")
acf(gtemp)

#Figure1.3 Speech 
plot(speech)
acf(speech)

#Figure1.4 New York Stock Exchange 
plot(nyse, ylab="NYSE Returns")
acf(nyse)

#Figure1.5 El Nino and Fish Population
par(mfrow = c(2,1)) # set up the graphics
plot(soi, ylab="", xlab="", main="Southern Oscillation Index")
plot(rec, ylab="", xlab="", main="Recruitment")
acf(soi)
acf(rec)

#Figure1.6 fMRI Imaging
par(mfrow=c(2,1), mar=c(3,2,1,0)+.5, mgp=c(1.6,.6,0))
ts.plot(fmri1[,2:5], lty=c(1,2,4,5), ylab="BOLD", xlab="",main="Cortex")
ts.plot(fmri1[,6:9], lty=c(1,2,4,5), ylab="BOLD", xlab="",main="Thalamus & Cerebellum")
mtext("Time (1 pt = 2 sec)", side=1, line=2)

#Figure1.7 Earthquakes and Explosions
par(mfrow=c(2,1))
plot(EQ5, main="Earthquake")
plot(EXP6, main="Explosion")

#Figure1.8 Moving Average
w<-rnorm(500,0,1)
v<-ma(w,3)
par(mfrow=c(2,1))
plot.ts(w, main="white noise")
plot.ts(v, main="moving average")

#Figure1.9 Autoregressive 

w<-rnorm(500,0,1)
w.fit<-ar(w)
w.fit.summary<-summary(w.fit)
w.pred<-predict(w.fit,w,n.ahead = 12*10)
par(mfrow=c(2,1))
plot(w, main="white noise")

ts.plot(w,w.pred$pred,lty=c(1,3))



x<-w.pred$pred
