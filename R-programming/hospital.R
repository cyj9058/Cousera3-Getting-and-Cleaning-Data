library(dplyr)
hospital<-read.csv("hospital-data.csv",header = TRUE)
outcome<-read.csv("outcome-of-care-measures.csv",header = TRUE)

disease.name<-c("Heartattack","Heartfailure","Pneumonia")
state.name<-levels(outcome$State)
names(outcome)[c(11,17,23)]<-disease.name

outcome$Heartattack<-as.numeric(levels(outcome$Heartattack)[outcome$Heartattack])
outcome$Heartfailure<-as.numeric(levels(outcome$Heartfailure)[outcome$Heartfailure])
outcome$Pneumonia<-as.numeric(levels(outcome$Pneumonia)[outcome$Pneumonia])

best <- function(state, disease) {
  ## Check that state and outcome are valid
  if(!state %in% state.name){stop("invalid state name!")}
  if(!disease %in% disease.name){stop("invalid disease name!")}
  splited<-split(outcome,outcome$State)
  if(disease=="Heartattack"){
    arranged<-lapply(splited,function(x){arrange(x,Heartattack,Hospital.Name)})
  } else if (disease =="Heartfailure"){
    arranged<-lapply(splited,function(x){arrange(x,Heartfailure,Hospital.Name)})
  } else if (disease =="Pneumonia"){
    arranged<-lapply(splited,function(x){arrange(x,Pneumonia,Hospital.Name)})
  } else{stop("invalid disease name!")}
  
  ans<-as.data.frame(arranged[state])
  names(ans)<-names(outcome)
  ans[1,c("Hospital.Name",disease)]
}

rankhospital<-function(state,disease,num="best") {
  if(!state %in% state.name){stop("invalid state name!")}
  if(!disease %in% disease.name){stop("invalid disease name!")}
  splited<-split(outcome,outcome$State)
  
  if(disease=="Heartattack"){
    arranged<-lapply(splited,function(x){arrange(x,Heartattack,Hospital.Name)})
  } else if (disease =="Heartfailure"){
    arranged<-lapply(splited,function(x){arrange(x,Heartfailure,Hospital.Name)})
  } else if (disease =="Pneumonia"){
    arranged<-lapply(splited,function(x){arrange(x,Pneumonia,Hospital.Name)})
  } else{stop("invalid disease name!")}
  
  ans<-as.data.frame(arranged[state])
  names(ans)<-names(outcome)
  last<-!is.na(ans[,disease])
  last<-sum(last)
  if(num=="best"){
    num<-1
  } else if(num=="worst"){
    num<-last
  } 
  ans[num,c("State","Hospital.Name",disease)]
}

rankall <- function(disease, num = "best") {
  if(!state %in% state.name){stop("invalid state name!")}
  if(!disease %in% disease.name){stop("invalid disease name!")}
  splited<-split(outcome,outcome$State)
  
  if(disease=="Heartattack"){
    arranged<-lapply(splited,function(x){arrange(x,Heartattack,Hospital.Name)})
  } else if (disease =="Heartfailure"){
    arranged<-lapply(splited,function(x){arrange(x,Heartfailure,Hospital.Name)})
  } else if (disease =="Pneumonia"){
    arranged<-lapply(splited,function(x){arrange(x,Pneumonia,Hospital.Name)})
  } else{stop("invalid disease name!")}
  ## Read outcome data
  last.num<-vector(length=54,mode="numeric")
  last.final<-data.frame()
  for(state in state.name){
    last.num<-NULL
    combined<-NULL
    
    ans.t<-as.data.frame(arranged[state])
    names(ans.t)<-names(outcome)
  
    last.sample<-!is.na(ans.t[,disease])
    last.num<-sum(last.sample)
    combined<-data.frame(state,last.num)
    last.final<-rbind.data.frame(last.final,combined)
  }
  
  if(num=="best"){
    num<-1} 
  
  if(num=="worst"){
    ans<-data.frame(row.names = names(outcome))
    ans.m<-data.frame(row.names = names(outcome))
    for(state in state.name){
      ans.m<-data.frame(row.names = names(outcome))
      last.number<-vector(mode="numeric")
      
      ans.m<-as.data.frame(arranged[state])
      names(ans.m)<-names(outcome)
      last.number<-last.final[which(last.final==state),2]
      ans<-rbind.data.frame(ans,ans.m[last.number,])
  }
  return(ans[,c("State","Hospital.Name",disease)])
  } else {
  ans<-data.frame(row.names = names(outcome))
  ans.m<-data.frame(row.names = names(outcome))
  for(state in state.name){
    ans.m<-as.data.frame(arranged[state])
    names(ans.m)<-names(outcome)
    ans<-rbind.data.frame(ans,ans.m[num,])
    ans.m<-data.frame(row.names = names(outcome))
  }
  return(ans[,c("State","Hospital.Name",disease)])
  } 
    
}
