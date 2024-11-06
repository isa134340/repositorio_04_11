install.packages("ggtree")
library(ggtree)
arbol<- rtree(15)


arbolz <- rtree(10)

arbol_c<-ggtree(arbolz, layout = "circular") + geom_tiplab2(color = "grey",size=3,)+
  geom_hilight(node = 2, fill = "blue") 

arbol_c
dev.off()
pdf("03_resultados/arbol_c.pdf")
