data=iris

# Load the library caTools
library(caTools)
library(ROCR)
library(rattle)
library(rpart)
library(RColorBrewer)
library(rpart.plot)
# Randomly split the data into training and testing sets
set.seed(1000)
split = sample.split(data$Species, SplitRatio = 0.65)

# Split up the data using subset
train = subset(data, split==TRUE)
test = subset(data, split==FALSE)

# Regression Tree
model = rpart(Species ~ ., method="class", data = train)
                  
shinyServer(
  

  function(input,output){
   test = reactive({
     
     data.frame(Sepal.Length=input$sl,Sepal.Width=input$sw,Petal.Length=input$pl,Petal.Width=input$pw)
     
   })
     
   output$values <- renderTable({
     test()
   })
   
   output$prediction = reactive({
     predict(model, newdata = test(), type = "class")})
  
  output$plot = renderPlot({fancyRpartPlot(model)})
  }
)