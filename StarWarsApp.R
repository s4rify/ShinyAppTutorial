# Star Wars App


ui <- fluidPage(
    titlePanel("My Star Wars App"),
    mainPanel(
        h6("Episode I.", align = "center"),
        h5("A powerful tutorial on Shiny Apps", align = "center"),
        h4("It is a dark time.", align = "center"),
        h3("Rebel students striking", align = "center"),
        h2("from a hidden base", align = "center"),
        h1("their first victory against Shiny", align = "center")
    )
)

server <- function(input, output){
    
}

shinyApp(ui, server)