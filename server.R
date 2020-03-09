library(shiny)

d=read.csv("C:\\Users\\admin\\Desktop\\kajal nikita save files\\SANE SIR\\Datasets\\Cars93.csv")
function(input,output) {

  output$histogram <- renderPlot({

    hist(d[,input$VarName],
         main = paste("Histogram of", input$VarName),
         col="pink")
 })
  output$boxplt <- renderPlot({
    boxplot(d[,input$VarName],
            main=paste("Boxplot of", input$VarName))

  })
}