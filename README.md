# Analiza podatkov s programom R, 2016/17

Repozitorij z gradivi pri predmetu APPR v študijskem letu 2016/17

## Tematika
Za temo projekta sem izbrala kriptovaluto Bitcoin. Predstavljeni bodo podatki o uporabi in vrednosti le-te od leta 2009 naprej. Ker valuta temelji na odprtokodnem protokolu in ni odvisna od centralne banke ali drugega regulatornega organa so verodostojni podatki težko dostopni. Podatki so v CSV obliki. Tabela bo vsebovala podatke : 
- vrednost valute na trgu (številska spremenljivka)
- vsota denarja v obtoku (številska spremenljivka)
- število uporabnikov (številska spremenljivka)
- čas (razvrščevalna spremenljivka)

Napotki : 
- minimalna cena,maksimalna cena, začetna, končna, mediana
- izberi borzo 

Kasneje bom primerjala Bitcoin z ostalimi kriptovalutami. 



## Program

Glavni program in poročilo se nahajata v datoteki `projekt.Rmd`. Ko ga prevedemo,
se izvedejo programi, ki ustrezajo drugi, tretji in četrti fazi projekta:

* obdelava, uvoz in čiščenje podatkov: `uvoz/uvoz.r`
* analiza in vizualizacija podatkov: `vizualizacija/vizualizacija.r`
* napredna analiza podatkov: `analiza/analiza.r`

Vnaprej pripravljene funkcije se nahajajo v datotekah v mapi `lib/`. Podatkovni
viri so v mapi `podatki/`. Zemljevidi v obliki SHP, ki jih program pobere, se
shranijo v mapo `../zemljevidi/` (torej izven mape projekta).

## Potrebni paketi za R

Za zagon tega vzorca je potrebno namestiti sledeče pakete za R:

* `knitr` - za izdelovanje poročila
* `rmarkdown` - za prevajanje poročila v obliki RMarkdown
* `shiny` - za prikaz spletnega vmesnika
* `DT` - za prikaz interaktivne tabele
* `maptools` - za uvoz zemljevidov
* `sp` - za delo z zemljevidi
* `digest` - za zgoščevalne funkcije (uporabljajo se za shranjevanje zemljevidov)
* `readr` - za branje podatkov
* `rvest` - za pobiranje spletnih strani
* `reshape2` - za preoblikovanje podatkov v obliko *tidy data*
* `dplyr` - za delo s podatki
* `gsubfn` - za delo z nizi (čiščenje podatkov)
* `ggplot2` - za izrisovanje grafov
* `extrafont` - za pravilen prikaz šumnikov (neobvezno)
