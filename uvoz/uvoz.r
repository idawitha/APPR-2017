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
# tabela$povprecna_vrednost <- sum(tabela$vrednost_v_USD/60)
tabela["maksimalna_vrednost"]<- max(tabela$vrednost_v_USD)
tabela["minimalna_vrednost"]<- min(tabela$vrednost_v_USD)

#poskrbimo, da so stevilske spremenljivke res stevilske
tabela$vrednost_v_USD <- as.numeric(tabela$vrednost_v_USD)
tabela$povprecna_vrednost <- as.numeric(tabela$povprecna_vrednost)
# tabela$maksimalna_vrednost <- as.numeric(tabela$maksimalna_vrednost)
# tabela$minimalna_vrednost <- as.numeric(tabela$minimalna_vrednost)



prva.vrstica2 <- c("datum", "BTC")
#Funkcija za uvoz podatkov
uvozi2<-function(){
  tab <- read_csv(file="podatki/bitcoins in circulation.csv",
                  col_names=prva.vrstica2,
                  na = "-")
  tab$datum <- parse_datetime(tab$datum, "%D %R")
  tab
}


#Zapisemo podatke v razpredelnico tabela
tabela2 <- uvozi2()


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
# 
# # Funkcija, ki uvozi podatke iz datoteke druzine.csv
# uvozi.druzine <- function(obcine) {
#   data <- read_csv2("podatki/druzine.csv", col_names = c("obcina", 1:4),
#                     locale = locale(encoding = "Windows-1250"))
#   data$obcina <- data$obcina %>% strapplyc("^([^/]*)") %>% unlist() %>%
#     strapplyc("([^ ]+)") %>% sapply(paste, collapse = " ") %>% unlist()
#   data$obcina[data$obcina == "Sveti Jurij"] <- "Sveti Jurij ob Ščavnici"
#   data <- data %>% melt(id.vars = "obcina", variable.name = "velikost.druzine",
#                         value.name = "stevilo.druzin")
#   data$velikost.druzine <- as.numeric(data$velikost.druzine)
#   data$obcina <- factor(data$obcina, levels = obcine)
#   return(data)
# }
# 
# # Zapišimo podatke v razpredelnico obcine
# obcine <- uvozi.obcine()
# 
# # Zapišimo podatke v razpredelnico druzine.
# druzine <- uvozi.druzine(levels(obcine$obcina))
# 
# # Če bi imeli več funkcij za uvoz in nekaterih npr. še ne bi
# # potrebovali v 3. fazi, bi bilo smiselno funkcije dati v svojo
# # datoteko, tukaj pa bi klicali tiste, ki jih potrebujemo v
# # 2. fazi. Seveda bi morali ustrezno datoteko uvoziti v prihodnjih
# # fazah.
