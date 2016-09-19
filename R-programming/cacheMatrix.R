makeCacheMatrix<-function(x=matrix()){
  m<-NULL # variable'm' plays crucial role it applied both 'makeCacheMatrix' and 'casheSolve' Environment
  set.data<-function(y){
    x<<-y
    m<<-NULL
  } # Pesnonally, I do not understand why should we have to use "
  get.data<-function()x
  set.inversed.data<-function(inverse)m<<-inverse #super-assgin can apply value of m in both environments
  get.inversed.data<-function()m
  list(set.data=set.data,get.data=get.data,get.inversed.data=get.inversed.data,set.inversed.data=set.inversed.data)
  #object type of closure is not subsettable, therefore, returning as 'list' is neccessary!
}

cacheSolve<-function(x){
  m<-x$get.inversed.data()
  if(!is.null(m)){
    message("getting cached data")
    return(m)    
  }
  data<-x$get.data()
  m<-solve(data)
  x$set.inversed.data(m)#this automatically assign value in makeCacheMatrix environemnt 
  m
}
