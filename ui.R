shinyUI(pageWithSidebar(
  headerPanel("Growth of Loblolly Pine Trees"),
  sidebarPanel(
    numericInput('id1', 'Select Tree Age in Years', 25, min=5, max=25, step=5),
    checkboxGroupInput("id2","Select Seed Number", selected=c("3","13"),
                       c("301"="1",
                         "303"="2", 
                         "305"="3",
                         "307"="4",
                         "309"="5", 
                         "311"="6", 
                         "315"="7",
                         "319"="8",
                         "321"="9", 
                         "323"="10", 
                         "325"="11",
                         "327"="12",
                         "329"="13", 
                         "331"="14"))
    
    ),
  mainPanel(
    h3('Tree Height in Feet'),
    h4('Selected Age of Trees in Years'),
    verbatimTextOutput('oid1'),
    h4('Average Tree Height from Selected Seeds'),
    verbatimTextOutput('table'),
    plotOutput('plot')
    )
  ))


