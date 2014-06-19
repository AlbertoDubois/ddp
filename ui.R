library(shiny)
shinyUI(
  
  pageWithSidebar(
    
    headerPanel("Prediction of Species"),   
    
    sidebarPanel(
      sliderInput("sl",'Change the value of the Sepal.Length',value=4.3,min=4.3,max=7.9,step=0.05),
      
    sliderInput("sw",'Change the value of the Sepal Width',value=2,min=2,max=4.4,step=0.05),
    
  sliderInput("pl",'Change the value of the Petal Length',value=1,min=1,max=6.9,step=0.05),
  
sliderInput("pw",'Change the value of the Petal Width',value=0.1,min=0.1,max=2.5,step=0.05),

  h3('Documentation:'),
  h5('In this Shinny app we are going to predict the Species of the flower using a classification tree. The user only needs to change the sliders, which correspond to the charactheristics of our flower. There are 3 types of flowers: setosa, versicolor and virginica. Looking at the classification tree you will be able to see what variables yo need to change in order to alter the flower species and which variables dont affect at all! Good luck!')

  ),
    
    mainPanel(
      h3('Prediction of the species:'),
      verbatimTextOutput("prediction"),
      h3('Value of the parameters'),
      tableOutput("values"),
      h3('Classification tree'),
      plotOutput("plot")
    
      
    
  )

  
)
)
  
 