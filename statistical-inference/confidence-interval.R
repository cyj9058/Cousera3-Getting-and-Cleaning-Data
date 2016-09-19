alpha <- 0.05 # significance level
N <- 100 # total simulation frequency
n <- 20 # sampling number
mu <- 10 # mean of population
sigma <- 3  # standard deviation of population

x<-seq(0,20,length=100)
plot(x=x,y=dnorm(x,mean=10,sd=3),type="l",main="Normal distribution, X~N(10,3^2)")

abline(v=mu,col="red",lty=2)
abline(v=mu-1.96*sigma,col="red",lty=2)
abline(v=mu+1.96*sigma,col="red",lty=2)

plot(x=c(0, 20), y=c(1, N), xlab = "confidence interval", ylab = "simulation freqneucy", type = 'n')

abline(v=mu, col="blue", lty=2)

within_yn <- 0
for(i in 1 : N) {
  x = rnorm(n, mu, sigma)
  conf_limit_lower = mean(x) - qnorm(1-alpha/2)*sd(x)/sqrt(n) # lower confidence limit
  conf_limit_upper = mean(x) + qnorm(1-alpha/2)*sd(x)/sqrt(n) # upper confidence limit
  within_yn_eval = mu <= conf_limit_upper & mu >= conf_limit_lower
  if(within_yn_eval) within_yn = within_yn + 1
  segments(conf_limit_lower, i, conf_limit_upper, i, col=(! within_yn_eval)+1, lty=(! within_yn_eval)+1)
  # segments(x1, y1, x2, y2) ; line from (x1, y1) to (x2, y2)
  }
