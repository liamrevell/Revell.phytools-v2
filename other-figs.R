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

```{r trop-tree, fig.cap="Phylogenetic tree of tropidurid lizard species from Revell et al. (2022).",fig.height=3.5}
cols<-setNames(c("white","black"),c("non-rock dwelling","rock-dwelling"))
plot(tropidurid.tree,colors=cols,direction="upwards",outline=TRUE,lwd=3,
  fsize=0.4,ftype="i",offset=1)
legend("bottomright",c("non-rock dwelling","rock-dwelling"),pch=22,
  pt.bg=cols,cex=0.8,pt.cex=1.2)
```
