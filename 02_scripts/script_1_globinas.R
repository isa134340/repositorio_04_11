library(Biostrings)

secuencias_1<-readDNAStringSet("01_datos _crudos/DivergentGlobins.fasta")

ali_clustal<- msa(secuencias_1, method = "ClustalW")
print(ali_clustal)

pdf("03_resultados/ali_clustal.pdf")


ali_mus<- msa(secuencias_1, method ="Muscle")
ali_mus
pdf("03_resultados/ali_mus.pdf")


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
arbol_cl <- nj(m_c) # más cercanos
plot (arbol_c)
dev.off()

arbol_mus<- nj(m_m) 
plot(arbol_m) 
dev.off()

pdf("03_resultados/arbol_cl.pdf")


pdf("03_resultados/arbol_mus.pdf")

