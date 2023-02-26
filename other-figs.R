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


Lastly, birth-death models are often opitimized in terms of a re-parameterization of the likelihood surface, $\lambda$ - $\mu$ (net diversification rate) and $\mu$/$\lambda$ (extinction fraction, often assigned the Greek letter $\epsilon$). It's not hard to use our likelihood function to optimize...

```{r}
lik<-function(par,func){
    net<-par[1]
    eps<-par[2]
    d=net/(1/eps+1)
    b=net+d
    -func(c(b,d))
}
liolaemid.div<-optim(c(1,0),lik,func=liolaemid.bd$lik,
  method="L-BFGS-B",lower=c(1e-3,1e-3))
liolaemid.div
```