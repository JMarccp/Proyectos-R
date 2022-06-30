library(rvest)
library(stringr)
library(XML)
url <- "http://www.cg.gov.dz/ar/"
web<-read_html(url,encoding="UTF-8")


etiquetas <- c("title","h1","h2","h3","h4","h5","h6","video","track","time","table","source","q","p","nav","meta","map","link","img","footer","figure","code","cite","audio","article","address","a")

for(i in etiquetas){
	etiquetas_aux <- html_nodes(web,i) %>% html_text()
	if (length(etiquetas_aux) > 0){
		x <- switch(i,
			"title" = "TITULO 0:",
			"h1" = "TITULO 1:",
			"h1" = "TITUTLO 2:",
			"h1" = "TITULO 3:",
			"h1" = "TITULO 4:",
			"h1" = "TITULO 5:",
			"h1" = "TITULO 6:",
			"video" = "VIDEOS:",
			"track" = "MULTIMEDIA:",
			"time" = "FECHA:",
			"table" = "TABLA:",
			"source" = "MULTIMEDIA 2:",
			"q" = "CITAS 1:",
			"p" = "PARRAFO:",
			"nav" = "LINKS 1:",
			"meta" = "METADATOS:",
			"map" = "MAPA",
			"link" = "LINKS 2",
			"img" = "IMAGENES",
			"footer" = "PIE DE PAGINA",
			"figure" = "FIGURAS",
			"code" = "CODIGO",
			"cite" = "CITAS 2",
			"audio" = "AUDIO",
			"article" = "ARTICULOS",
			"address" = "DIRECCIONES",
			"a" = "HIPERVINCULOS")

		print("*******************")
		print(x)
		print("*******************")
		print(etiquetas_aux)
	}
}

#hdocs <- as.data.frame(links)
#write.csv(hdocs, "documentos.csv")



#******************************
# LOCALIZAR TEXTO CONCRETO
#******************************
aux <- html_nodes(web,"p") %>% html_text()
head(str_subset(aux,"عبد المجيد تبون"))
head(str_subset(aux,"@"))