library(colorspace)
hab.cols<-setNames(c(rgb(0,1,0),rgb(0,0.5,0.5),
  rgb(1/3,1/3,1/3),rgb(0,0,1),rgb(0.5,0.5,0),
  rgb(1,0,0)),levels(butterfly.habitat))
cols<-c("darkgreen","magenta","yellow")

hab.cols<-setNames(c(
  cols[1],
  mixColors(cols[1],cols[2],0.5),
  mixColors(mixColors(cols[1],cols[2],2/3),
    mixColors(cols[2],cols[3],1/3),0.5),
  cols[2],
  mixColors(cols[2],cols[3],0.5),
  cols[3]),levels(butterfly.habitat))

par(fg="transparent")
h<-max(nodeHeights(butterfly.tree))
plot(butterfly.summary,type="arc",ftype="off",
  colors=hab.cols,cex=c(0.4,0.2),part=0.5,lwd=1,
  arc_height=0.4,ylim=c(-3,35))
par(fg="black")
legend("topleft",names(hab.cols),pch=21,pt.bg=hab.cols,
  pt.cex=1.5,cex=0.8,bty="n")
axis(1,pos=-1,at=h-seq(0,h,by=5)+0.4*h,
  labels=seq(0,h,by=5),cex.axis=0.8)
axis(1,pos=-1,at=-h+seq(0,h,by=5)-0.4*h,
  labels=seq(0,h,by=5),cex.axis=0.8)

