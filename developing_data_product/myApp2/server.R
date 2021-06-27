library(shiny)
shinyServer(
    function(input,output){
      mtcars$mpgsp<-ifelse(mtcars$mpg- 20 >0, mtcars$mpg -20,0)
      model1<-lm(hp~mpg, data=mtcars)
      model2<-lm(hp~mpgsp + mpg, data=mtcars)
      
      model1pred<- reactive({
        mpgInput<- input$sliderMPG
        predict(model1,newdata=data.frame(mpg=mpgInput))
      })
      
      model2pred<- reactive({
        mpgInput<-input$sliderMPG
        predict(model2, newdata=data.frame(
          mpg=mpgInput,mpgsp=ifelse(mpgInput-20>0,mpgInput-20,0 )
        )
       )
      })
     output$plot1<-renderPlot({
       mpgInput<-input$sliderMPG
       
       plot(mtcars$mpg, mtcars$hp, xlab = "Miles Per Gallon",
            ylab="Horsepower", bty="n",pch=16,
            xlim=c(10,35), ylim=c(50,350))
       if(input$showModel1){
         abline(model1,col="red", lwd=2)
       }
       if(input$showModel2){
         model2lines<-predict(model2, newdata=data.frame(
         mpg = 10:35, mpgsp = ifelse(10:35 - 20 > 0, 10:35 - 20, 0)
         ))
         lines(10:35, model2lines,col="blue",lwd=2)
       }
       })
})
    