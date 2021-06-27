library(shiny)
shinyUI(
    fluidPage(
        titlePanel("Predict Horsepower From MPG"),
        sidebarLayout(
            sidebarPanel(
                sliderInput("sliderMPG",label = "Data set",min=10,max=35,value = 20),
                checkboxInput("showModel1", "Show/Hide Model 1", value = TRUE),
                checkboxInput("showModel2", "Show/Hide Model 2", value = TRUE)
            ),
            mainPanel(
                plotOutput("plot1"),
                h3("Predicted Horsepower from Model 1:"),
                textOutput("pred1"),
                h3("Predicted Horsepower from Model 2:"),
                textOutput("pred2")
            )
            
        )
    )
    
)
