# pakraunamos jei reikia reikalingos bibliotekos
suppressPackageStartupMessages(require(shiny))
suppressPackageStartupMessages(require(shinyBS))
suppressPackageStartupMessages(require(devtools))

# nustatomas darbinis katalogas priklausomai nuo kompo
if (Sys.info()[[4]] == "ANDRIUS-PC")
    setwd("D:/-=Works=-/R/GitHub/LTLABmain")

if (Sys.info()[[4]] == "LTLAB-DEV")
    setwd("C:/R/GitHub/LTLABmain")

shiny::runApp(list(

#################################################################################################
#################################################################################################  
################# >>>> UI <<<< ##################################################################
#################################################################################################
#################################################################################################

ui = 
  list(
    tags$head(tags$meta(name="viewport", content="width=device-width, initial-scale=1")),
    uiOutput("MainPage")
  ),

#################################################################################################
################################################################################################# 
################# >>> SERVER <<< ################################################################
#################################################################################################
#################################################################################################

server = function(input, output, session) {

  # mygtuku grupe skirtingiems servisams
  output$MainPage <- renderUI({
    fluidPage(
      column(4),
      column(4,
        
        tags$head(
          tags$style(type='text/css', 
                   ".btn:hover {
                      background-color: #162840;
                    }
                    .btn {
                      background-color: #1e3859;
                      display: table;
                      margin: 20px auto;
                      font-size: 150%;
                      padding: 20px 20px 20px 20px;
                      color: #fff;
                      font-weight: bold;
                      line-height: 1;
                      -moz-border-radius: 5px;
                      -webkit-border-radius: 5px;
                      -moz-box-shadow: 0 1px 3px #999;
                      -webkit-box-shadow: 0 1px 3px #999;
                      text-shadow: 0 -1px 1px #222;
                      border-bottom: 1px solid #222;
                      position: relative;
                      cursor: pointer;                          
                    };")),
        
        div(style = "padding-top: 100px;",          
            img(src = "images/LTLAB_logo.jpg",
                style = "display: table;
                        margin: 50px auto;"),
            
            # LTLAB SMT DB mygtukas
            actionButton("Linkas1", 
                          span("LTLAB SMT DB", 
                               icon("glyphicon glyphicon-chevron-right pull-right", 
                                    lib = "glyphicon")),
                          onclick="location.href='http://localhost:3838/apps/LTubik/';",
                          class="btn btn-primary btn-block",
                          style = " "
            ),
            
            # LTLAB ERRORS DB mygtukas
            actionButton("Linkas2", 
                          span("LTLAB ERRORS DB", 
                               icon("glyphicon glyphicon-chevron-right pull-right", 
                                    lib = "glyphicon")),
                          onclick="location.href='http://localhost:3838/apps/LTLABerrors/';",
                          class="btn btn-primary btn-block",
            )
        
        )
      ),
      column(4)
    )
  })


}), 
  # softas paleidziamas iskart defaultiniu browseriu
  launch.browser = TRUE,
  # paleidus softa, prie jo gali prisijungti kiti LANe esantys kompiuteriai
  # jungiantis KOMPO_IP:PORT (192.168.*.*:5050)
  host = "0.0.0.0",
  port = 5050

)