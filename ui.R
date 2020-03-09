library(shiny)

d=read.csv("C:\\Users\\admin\\Desktop\\kajal nikita save files\\SANE SIR\\Datasets\\Cars93.csv")
pageWithSidebar(
  headerPanel = headerPanel("Histogram"),

  sidebarPanel = sidebarPanel(

    selectInput(inputId = "VarName",
                label = "Select Numeric Variable:",
                choices = as.list(c("Min.Price" ,
                                    "Max.Price"  , "MPG.city",
                                    "MPG.highway")))
  
  ) ,
  mainPanel = mainPanel(
    tabsetPanel(
      tabPanel("Histogram",plotOutput("histogram")),
      tabPanel("Box Plot",plotOutput("boxplt"))
    )


  )
)