################################################################################################################################


library(shiny)
library(shinymanager)
library(shinydashboard)
library(data.table)

inactivity <- "function idleTimer()
var t = setTimeout(logout, 1200000);
window.onmousemove = resetTimer;
window.onmousedown = resetTimer;
window.onclick = resetTimer;
window.onscroll = resetTimer;
window.onkeypress = resetTimer;

function logout(){
window.close();
}

function resetTimer(){
clearTimeout(t)；
t = setTimeout(logout,120000);
}
}
idleTimer();
"

credentials <- data.frame(user = c("Wenxuan"),password = c("nikeyide"),
                          stringsAsFactors = FALSE)



ui<-secure_app(head_auth = tags$script(inactivity),
               dashboardPage(skin = "green",
                             dashboardHeader(title = "Marketing Mix Model"),
                             dashboardSidebar(sidebarMenu(
                                menuItem("Dashboard",tabName = "summary",icon = icon('list')),
                                menuItem("Explore",tabName ="assort",icon = icon('th')),
                                menuItem("Model",tabName ="optimization",icon = icon('signal')),
                                menuItem("Optimization",tabName ="performance",icon = icon('search'))
                             )),
                             dashboardBody(tags$style(HTML('.content-wrapper, .right-side{
                  background-color:#FFFFFF;
                  }')))
               ))


# Define server logic required to draw a histogram
server <- function(input, output) {
   result_auth <-secure_server(check_credentials = check_credentials(credentials))
   
}



# Run the application 
shinyApp(ui = ui, server = server)

