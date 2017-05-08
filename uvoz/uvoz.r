# 2. faza: Uvoz podatkov
#vektor ki predstavlja imena stolpcev
prva.vrstica <- c("datum", "vrednost_v_USD")
#Funkcija za uvoz podatkov
uvozi<-function(){
  return(read.csv(file="podatki/market-price2.csv",
                  col.names=prva.vrstica,
                  header=FALSE,
                  na.strings = "-",
                  fileEncoding = "UTF-8",
                  as.is = FALSE))
}

#Zapisemo podatke v razpredelnico tabela
tabela <- uvozi()
#Dodam stolpec povprecne vrednosti, maksimalno in minimalno vrednost v tabelo
tabela["povprecna_vrednost"] <- sum(tabela$vrednost_v_USD/60)
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
  tab <- read_csv(file="podatki/bitcoins_in_circulation.csv",
                  col_names=prva.vrstica2,
                  na = "-")
  tab$datum <- parse_datetime(tab$datum, "%D %R")
  tab
}

#Zapisemo podatke v razpredelnico tabela
tabela2 <- uvozi2()

# Druga tabela v XML
#Število transakcij na dan(Total number of unique bitcoin transactions per day.Vrednosti so v k)
library("rjson")
json_file <- fromJSON("https://www.quandl.com/api/v3/datasets/BCHAIN/NTRAN.json?api_key=BopYvFzzxoSmWe3syXhH")

# json_data <- fromJSON(paste(readLines(json_file), collapse=""))

json_data <- fromJSON(file=json_file)

# naslovi <-c("datum", "št transakcij * 10 ^3" )
strsplit(json_file, split)
names(json_file)<-c("datum","vrednost")
