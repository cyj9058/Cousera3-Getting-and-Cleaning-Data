#Note for Week1 
### Module 1. introduction 
**Statistical inference**: The process of generating conclusion about "population" from a noisy "sample", such as prediction weather/ predict president election <br></br>
**The goal of inference**<br>
  1. Estiamte & quantify 
  2.
  
### Module 2. 
Probaility takes a possible outcome from the experiment. <br> 
Random variable is a numerical outcome of an experiment <br> 
PMF: A probability mass function evaluated at a value corresponds to certain accident <br> 
PDF: A continuous probaility <br> 

quatile xth quantile is below<br> 

######code.practice 
x<-c(-0.5,0,1,1,1.5)
y<-c(0,0,2,0,0)
plot(x,y,lwd=3,frame=FALSE,type="l")// 

dbeta(x= 0.75,shape1= 2 ,shape2=1 ) #density function 
pbeta(q= 1.1,shape1=3 ,shape2=1) #distribution function
qbeta(p= 0.4,shape1= ,shape2= ) #quantile function 
rbeta(n= ,shape1= ,shape2= ) #random generation of

### Conditional probability 
