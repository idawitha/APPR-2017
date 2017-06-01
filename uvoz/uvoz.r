# 2. faza: Uvoz podatkov
#vektor ki predstavlja imena stolpcev
prva.vrstica <- c("datum", "vrednost_v_USD")
#Funkcija za uvoz podatkov
uvozi<-function(){
  tab <- read_csv(file="podatki/market-price2.csv",
                  col_names=prva.vrstica,
                  na = "-")
  tab$datum <- parse_datetime(tab$datum, "%D %R")
  tab
}

#Zapisemo podatke v razpredelnico tabela
tabela <- uvozi()

#Dodam stolpec povprecne vrednosti, maksimalno in minimalno vrednost v tabelo
tabela["povprecna_vrednost"] <- sum(tabela$vrednost_v_USD/60)
tabela["maksimalna_vrednost"]<- max(tabela$vrednost_v_USD)
tabela["minimalna_vrednost"]<- min(tabela$vrednost_v_USD)

#poskrbimo, da so stevilske spremenljivke res stevilske
tabela$vrednost_v_USD <- as.double(tabela$vrednost_v_USD)
tabela$povprecna_vrednost <- as.double(tabela$povprecna_vrednost)
tabela$maksimalna_vrednost <- as.double(tabela$maksimalna_vrednost)
tabela$minimalna_vrednost <- as.double(tabela$minimalna_vrednost)

#druga tabela 
prva.vrstica2 <- c("datum", "BTC")
#Funkcija za uvoz podatkov
uvozi2<-function(){
  tab <- read_csv(file="podatki/bitcoins_in_circulation.csv",
                  col_names=prva.vrstica2,
                  na = "-")
  tab$datum <- parse_datetime(tab$datum, "%D %R")
  tab
}

tabela2 <- uvozi2()
tabela2$BTC <- as.double(tabela2$BTC)


# DATOTEKA V XML OBLIKI



# Druga tabela v XML
#Število transakcij na dan(Total number of unique bitcoin transactions per day.Vrednosti so v k)
library("rjson")
library(httr)
library(dplyr)
json_file <- GET("https://www.quandl.com/api/v3/datasets/BCHAIN/NTRAN.json?api_key=BopYvFzzxoSmWe3syXhH") %>%
  content(as = "text") %>% fromJSON()
data <- json_file$dataset$data %>% sapply(c) %>% t() %>% data.frame()
# uporabi še parsdate parse number
# json_data <- fromJSON(paste(readLines(json_file), collapse=""))
# json_data <- fromJSON(file=json_file)
# naslovi <-c("datum", "št transakcij * 10 ^3" )
#ker so vektorji v datoteki dolžine 1 bi rada da so dolžine 2

<<<<<<< HEAD
# # Funkcija, ki uvozi občine iz Wikipedije
# uvozi.obcine <- function() {
#   link <- "http://sl.wikipedia.org/wiki/Seznam_ob%C4%8Din_v_Sloveniji"
#   stran <- html_session(link) %>% read_html()
#   tabela <- stran %>% html_nodes(xpath="//table[@class='wikitable sortable']") %>%
#     .[[1]] %>% html_table(dec = ",")
#   colnames(tabela) <- c("obcina", "povrsina", "prebivalci", "gostota", "naselja",
#                         "ustanovitev", "pokrajina", "regija", "odcepitev")
#   tabela$obcina <- gsub("Slovenskih", "Slov.", tabela$obcina)
#   tabela$obcina[tabela$obcina == "Kanal ob Soči"] <- "Kanal"
#   tabela$obcina[tabela$obcina == "Loški potok"] <- "Loški Potok"
#   for (col in colnames(tabela)) {
#     tabela[tabela[[col]] == "-", col] <- NA
#   }
#   for (col in c("povrsina", "prebivalci", "gostota", "naselja", "ustanovitev")) {
#     if (is.numeric(tabela[[col]])) {
#       next()
#     }
#     tabela[[col]] <- gsub("[.*]", "", tabela[[col]]) %>% as.numeric()
#   }
#   for (col in c("obcina", "pokrajina", "regija")) {
#     tabela[[col]] <- factor(tabela[[col]])
#   }
#   return(tabela)
# }
=======
>>>>>>> bc6c4600cbf66f1c5696aabd18210761258369b4
