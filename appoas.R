ui <- fluidPage(
  titlePanel("Baby Name Explorer"),
  sidebarLayout(
    sidebarPanel(textInput('name', 'Enter Name', 'David')),
    mainPanel(plotOutput('trend'))
  )
)
server <- function(input, output, session) {
  output$trend <- renderPlot({
    # CODE BELOW: Update to display a line plot of the input name
    ggplot(subset(babynames, name == 'name')) +
      geom_line(aes(x = year, y = prop, color = sex))
    
  })
}

shinyApp(ui = ui, server = server)
