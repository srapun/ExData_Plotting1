#setwd("C:/Users/srapun/Documents/Privat/COURSERA/Courses/R-DataScience/R-Mod04-ExploratoryDataAnalysis/Projects/CursProject1")

buildDataSet<-function(){

   skpJump<-as.vector("numeric")
  
   nrRowsToRead<-as.vector("numeric")
  
   j<-1
   
   file<-"./household_power_consumption.txt"

   data<-read.table(file, sep=";", header= TRUE, stringsAsFactors=FALSE, nrows=1)

   # Reading Condicions
   
   myCol<-c("character","NULL","NULL","NULL","NULL","NULL","NULL","NULL","NULL")

   dates<-read.table(file, sep=";", header=TRUE, nrows=2100000, colClasses=myCol)

   cond1<-grep("^1/2/2007$",dates$Date)

   cond2<-grep("^2/2/2007$",dates$Date)
               
   cond<-sort(append(cond1,cond2))     #length(cond)->2880 (1440+1440)

   # From which to which row should be readed
   
   nrRows<-c(1:length(dates$Date))

   skipe<-nrRows[-cond]
  
   if(skipe[1]!=1){
  
     skpJump[j]=0; nrRowsToRead[j]=skipe[1]-1; j<-j+1
   }
  
   for(i in seq_along(skipe)){
  
     if((skipe[i+1]-skipe[i]>1)&(i<length(skipe))){
    
       skpJump[j]<-(skipe[i]); nrRowsToRead[j]<-(skipe[i+1]-skipe[i])-1; j<-j+1
     }
   }

   if(skipe[length(skipe)]!=length(dates$Date)){
  
     skpJump[j]<-(skipe[length(skipe)])
  
     nrRowsToRead[j]<-length(dates$Date)-skipe[length(skipe)]
   }
                   #skpJump->"66636"; #nrRowsToRead->"2880"

   # Reading the dataset in blocks
   
   for(i in seq_along(skpJump)){
  
     newData<-read.table(file, sep=";", header=TRUE, stringsAsFactors=FALSE,
                   skip=as.numeric(skpJump[i]), nrows=as.numeric(nrRowsToRead[i]))
  
     names(newData)<-names(data)
  
     data<-rbind(data,newData)
   }

   return(data[-1,])    #checking with table(data$Date)
}   

               