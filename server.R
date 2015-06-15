#Load the Loblolly dataset from 'datasets' package
library(datasets)
Loblolly<-Loblolly
##Need to reshape data for a stacked bar graph
  Lob<-reshape(Loblolly, v.names="height", timevar="age", idvar="Seed", direction="wide")
##Recalculate data to show increase per year
    Lob$height.25<-Lob$height.25-Lob$height.20
    Lob$height.20<-Lob$height.20-Lob$height.15
    Lob$height.15<-Lob$height.15-Lob$height.10
    Lob$height.10<-Lob$height.10-Lob$height.5
    Lob$height.5<-Lob$height.5
#Remove measurement from 0-3years to start data from 0-5years.  This keeps a consistant step for shiny application.
      Lob<-Lob[,-2]

shinyServer(
  function(input, output){
    output$oid1<-renderPrint({input$id1})
    output$table<-renderPrint({
      if(input$id1=="5"){var<-2}
      if(input$id1=="10"){var<-3}
      if(input$id1=="15"){var<-4}
      if(input$id1=="20"){var<-5}
      if(input$id1=="25"){var<-6}
      sums<-vector()
      for (i in 1:length(input$id2)) {sums[i]<-sum(Lob[input$id2[i],(2:var)])}
      table<-matrix(Lob$Seed[as.integer(input$id2)], ncol=length(input$id2))
      table<-rbind(table, sums)
      row.names(table)<-c("Seed", "Height(ft)")
      print(table)
      })
    output$plot<-renderPlot({ #convert year selection into variable number
      if(input$id1=="5"){var<-2}
      if(input$id1=="10"){var<-3}
      if(input$id1=="15"){var<-4}
      if(input$id1=="20"){var<-5}
      if(input$id1=="25"){var<-6}
      barplot(t(Lob[as.integer(input$id2),(2:var)]), names.arg = Lob$Seed[as.integer(input$id2)], col=terrain.colors(8), ylab="Tree Height, Feet", xlab="Seed Source", ylim=c(0,70), xlim=c(0,length(as.integer(input$id2))+length(as.integer(input$id2))/2))
      legend("topright", cex=0.7, title="Growth from Years:", legend=c("0-5","5-10","10-15","15-20","20-25"), fill=terrain.colors(8))
      })
  }
)