mixColors<-function(col1,col2,alpha=0.5){
  col1<-col2rgb(col1)
  col2<-col2rgb(col2)
  new_col<-alpha*col1+(1-alpha)*col2
  rgb(new_col[1],new_col[2],new_col[3],maxColorValue=255)
}
