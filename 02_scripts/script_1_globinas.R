library(Biostrings)

secuencias_1<-readDNAStringSet("01_datos _crudos/DivergentGlobins.fasta")

library(msa)

ali_clustal<- msa(secuencias, method = "ClustalW")
print(ali_clustal)

pdf("03_resultados/ali_clustal")


ali_mus<- msa(secuencias, method ="Muscle")
ali_mus
pdf("03_resultados/ali_mus")


#arbol
#instalar paquete
install.packages("seqinr")
library(seqinr)
#convertir con seqinr

clus<- msaConvert(ali_clustal, type="seqinr::alignment")


mus<-msaConvert(ali_mus, type="seqinr::alignment")

#crear matrices
m_c <- dist.alignment(clus, "identity")

m_m<-dist.alignment(mus, "identity")


install.packages("ape")

library(ape)
#crear arboles
arbol_c <- nj(m_c) # más cercanos
plot (arbol_c)
dev.off()

arbol_m <- nj(m_m) 
plot(arbol_m) 
dev.off()

pdf("03_resultados/arbol_c.pdf")


pdf("03_resultados/arbol_m.pdf")
