library(shiny)
shinyUI(fluidPage(
    titlePanel("Analysis of Crime Against Women in India"),
    
    mainPanel(
        tabsetPanel(
            tabPanel("Total Crimes",plotOutput("plot1")),
            tabPanel("Categorical Analysis",plotOutput("plot2")),
            tabPanel("Cruelty By Husband/His Relatives",plotOutput("plot3")),
            tabPanel("Dowry",plotOutput("plot4")),
            tabPanel("Kidnapping",plotOutput("plot5")),
            tabPanel("Murder",plotOutput("plot6")),
            tabPanel("Rape",plotOutput("plot7")),
            tabPanel("Incest Rape",plotOutput("plot8")),
            tabPanel("Other Cases",plotOutput("plot9"))
        )
    )
))