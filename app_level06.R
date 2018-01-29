# let's add tabs so that we don't have to scroll down so far
library(shiny)

ui <- fluidPage(
    
    titlePanel("Hello World"),
    
    sidebarLayout(
        sidebarPanel(
            selectInput("dataset" , "Choose a dataset:",    # input identifier = dataset
                        choices = ls("package:datasets"),
                        selected = "pressure")
        ),
        
        mainPanel(
            tabsetPanel(
             tabPanel("Str",
                      verbatimTextOutput("dump")       
                      ),
             tabPanel("Plot",
                      
                      plotOutput("plot")             
                      ),
             tabPanel("Table",
                      tableOutput("table") 
                      )
                
            )
        )
    )
)

server <- function(input, output) {
    
    # assign behaviour to the outputs or use outputs
    output$dump <- renderPrint({
        dataset <- get(input$dataset, "package:datasets")
        str(dataset)
    })
    output$plot <- renderPlot({
        dataset <- get(input$dataset, "package:datasets")
        plot(dataset)
    })
    
    output$table <- renderTable({
        dataset <- get(input$dataset, "package:datasets")
        dataset                     # simply return the table here, that's what renderTable expects
    })
    
    
}

# run the app
shinyApp(ui = ui, server = server)

