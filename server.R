library(shiny)

BMI <- function(height,weight)
{
  weight/(height^2)
}

predict<- function(BMI)
{
  if(BMI> 25)
  { return("Overweight")}
  else
  { if(BMI< 18.5 )
  { return ("Underweight")}
  else
  { return ("Normalweight")}
  }
}
  
shinyServer(
  function(input,output){
    output$Value<- renderPrint({BMI(input$height,input$weight)})
    output$prediction<- renderPrint({predict(BMI(input$height,input$weight))})
    
  }
)