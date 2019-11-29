i <- 1
count <- 0
lineCount <- 1
while(i<=1000) {
  if(i%%3==0|i%%5==0) {
    count <- count+1
    cat(i, " ")
    lineCount <- lineCount+1
    if(lineCount>10) {
      lineCount <- 1
      print("\n")
    }
  }
  i <- i+1
}
print("\n")
cat("갯수", count,"\n")

