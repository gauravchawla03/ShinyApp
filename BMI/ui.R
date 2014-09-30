library(shiny)
pageWithSidebar( 
                         headerPanel("BMI Calculation"),
                         
                         sidebarPanel( 
                          numericInput('height','height mt',1.8,min=0.5,max=2.5,step=0.05),
                          numericInput('weight','weight kg',50,min=10,max=200,step=1),
                          submitButton('Submit')
                         ),
                         
                         mainPanel(
                           h3('Body Mass Index'),
                           h4('BMI value'),
                           verbatimTextOutput("Value"),
                           h4('Prediction'),
                           verbatimTextOutput("prediction")
                         )

)
