#GRAFI 
library(dplyr)
library(gsubfn)
library(ggplot2)
library(ggplot2)
library(dplyr)



graf <- ggplot(data = tabela,aes(x=datum, y=vrednost_v_USD)) +  theme(axis.text.x = element_text(angle = 90, vjust = 0.5))+geom_line()

#dodaj še eno črto
