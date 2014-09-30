library(shiny)
shinyUI(fluidPage(
    titlePanel("2015 CRICKET WORLD CUP WIN PREDICITON"),
    
    mainPanel(
        tabsetPanel(
                    tabPanel("Win Record in NZ and AUS",plotOutput("plot1"),verbatimTextOutput("val1")),
                    tabPanel("Win Record for last four Years",plotOutput("plot2"),verbatimTextOutput("val2")),
                    tabPanel("Win Record in World Cups",plotOutput("plot3"),verbatimTextOutput("val3")),
                    tabPanel("Final Prediction for 2015 WC",plotOutput("plot4"),verbatimTextOutput("val4"))
        )
        )
    ))