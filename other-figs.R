```{r fig6, fig.cap="Data for the mono- or polymorphic condition of that character of habitat type on a phylogenetic tree of Mycalesina butterflies. Tree and data are from Halali et al. (2020)."}
Data<-matrix(0,length(butterfly.habitat),3,
  dimnames=list(names(butterfly.habitat),
    c("forest","fringe","open")))
habitats<-sapply(colnames(Data),grep,butterfly.habitat)
for(i in 1:length(habitats)) 
  Data[habitats[[i]],names(habitats)[i]]<-1
plotTree(butterfly.tree,type="fan",ftype="off",lwd=1,
  part=0.5)
cols<-setNames(c(rgb(0,1,0),rgb(0,0,1),rgb(1,0,0)),
  colnames(Data))
tiplabels(pie=Data,cex=0.2,piecol=cols)
legend("topleft",names(cols),pch=21,pt.bg=cols,pt.cex=2,
  bty="n")
```