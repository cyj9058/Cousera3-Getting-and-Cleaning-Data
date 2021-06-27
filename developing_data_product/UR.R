library(shiny)
setwd("C:/Users/cyj90/github/study/developing_data_product")

shinyUI(
  pageWithSidebar(
    headerPanel("Hello Shiny!"),
    sidebarPanel(
      h3('Sidebar text')
    ),
    mainPanel(
      h3('Main Panel Text')
    )
  )
)

shinyServer(
  function(input,output){
  }
)

runApp()

