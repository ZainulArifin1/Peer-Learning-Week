library(tidyverse)

ggplot(data = iris,
       mapping = aes(x = Petal.Length,
                     y = Sepal.Length,
                     color = Species
                     )
       ) +
  geom_point(size = 3) +
  geom_smooth(method = lm, se = F) +
  labs(
    x = "Petal Length",
    y = "Sepal Length",
    title = "Correlation between Petal and Sepal Length in 3 Iris Species",
    subtitle = "There seems to be a positive correlation between petal and sepal length regardless of Iris species",
    caption = "Zain A. | CRT Peer Learning Week"
  ) +
  my_theme()

sysfonts::font_add_google('Quicksand')
showtext::showtext_auto()

my_theme <- function(){ 
  font <- "Quicksand"                        #assign font family up front
  
  theme_minimal() %+replace%                 #replace elements we want to change
    
    theme(
      
      #grid elements
      panel.grid.major = element_blank(),    #strip major gridlines
      axis.ticks = element_blank(),          #strip axis ticks
      
      plot.background = element_rect(
        fill = "black"                       #change plot color background
      ),
      
      panel.background = element_rect(
        fill = "black"                       #change panel color background
      ),
      
      #text elements
      plot.title = element_text(             #title
        family = font,                       #set font family
        size = 28,                           #set font size
        face = 'bold',                       #bold typeface
        hjust = 0,                           #left align
        vjust = 2,                           #raise slightly
        color = "white"),                    #font color      
      
      plot.subtitle = element_text(          #subtitle
        family = font,                       #font family
        size = 20,                           #font size
        hjust = 0,                           #left align
        color = "white",                     #font color 
        margin = margin(b = 15)),            #add bottom margin           
      
      plot.caption = element_text(           #caption
        family = font,                       #font family
        size = 13,                           #font size
        hjust = 1,                           #right align
        color = "white"),                    #font color                      
      
      axis.title = element_text(             #axis titles
        family = font,                       #font family
        size = 17,                           #font size
        color = "white"),                    #font color                       
      
      axis.text = element_text(              #axis text
        family = font,                       #axis family
        size = 17,                           #font size
        color = "white"),                    #font color        
      
      axis.text.x = element_text(            #change margin for axis text x
        margin = margin(t = 10, b = 10)
      ),
      
      axis.text.y = element_text(            #change margin for axis text y
        margin = margin(l = 10, r = 10)
      ),
      
      legend.position = "top",               #put legend to top
      
      legend.key = element_blank(),          #remove the grey background
      
      legend.text = element_text(
        family = font,                       #axis family
        size = 17,                           #font size
        color = "white"),                    #font color
      
      legend.title = element_text(
        family = font,                       #axis family
        size = 17,                           #font size
        color = "white")                     #font color
    )
}


library(ragg)

result <- 
  ggplot(data = iris,
         mapping = aes(x = Petal.Length,
                       y = Sepal.Length,
                       color = Species
         )
  ) +
  geom_point(size = 3) +
  geom_smooth(method = lm, se = F) +
  labs(
    x = "Petal Length",
    y = "Sepal Length",
    title = "Correlation between Petal and Sepal Length in 3 Iris Species",
    subtitle = "There seems to be a positive correlation between petal and sepal length regardless of Iris species",
    caption = "Zain A. | CRT Peer Learning Week"
  ) +
  my_theme()

agg_png(filename = "result_dataviz.png", width = 55, height = 30, units = 'cm', res = 60)
result
dev.off()

