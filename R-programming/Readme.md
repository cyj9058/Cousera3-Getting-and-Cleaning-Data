**Caching Data** <br/>
 This is a assigment from R programming. This assignment use a "function closure".<br/>
 The function closure is "inheriting environment from parent function".<br/>
 In R, the function can be defined inside of function. <br/>
 In add1, function(y) is defined in <br/>
 ```
 add1
 >add<-function(x){
  x=1
  function(y){
    x<-y+1
    x
  }
 }
> a1<-add(3)
> a1(3)
[1] 4
> a1(3)
[1] 4
```
Like a class in python, you can inherit(not exact concept but similar) parent function to object. <br/>
In this case, function(x) is inherited to object "a1".<br/>
Variable 'x' which is assign as '3' is still used in fucntion(y). <br/>
In cacheMatrix fucntion, it make matrix. <br/>
In cashSolve, it call matrix and assigned value and return to environment of cacheMatrix.</br>
```
makeCacheMatrix<-function(x=matrix()){
  m<-NULL # variable'm' plays crucial role it applied both 'makeCacheMatrix' and 'casheSolve' Environment
  set.data<-function(y){
    x<<-y
    m<<-NULL
  } 
  get.data<-function()x
  set.inversed.data<-function(inverse)m<<-inverse #super-assgin can apply value of m in both environments
  get.inversed.data<-function()m
  list(set.data=set.data,get.data=get.data,get.inversed.data=get.inversed.data,set.inversed.data=set.inversed.data)
}

cacheSolve<-function(x){
  m<-x$get.inversed.data()
  if(!is.null(m)){
    message("getting cached data")
    return(m)    
  }
  data<-x$get.data()
  m<-solve(data)
  x$set.inversed.data(m) #this automatically assign value in makeCacheMatrix environment 
  m
}
 ```
We can assign makeCasheMatrix to object 'a2'.<br/>
4 functions in a2 follow the enviroment in 'a2'.<br/> 
Therefore, superassign(->>) can be used. 'm<<-NULL' assign value in a2, not in "a$set fucntion"  <br/>
 ```
> x<-matrix(c(3,21,3,3,29,8,8,12,4),nrow=3,ncol=3)
> x
     [,1] [,2] [,3]
[1,]    3    3    8
[2,]   21   29   12
[3,]    3    8    4
> a2<-makeCacheMatrix(x)
> a2$get.data()
     [,1] [,2] [,3]
[1,]    3    3    8
[2,]   21   29   12
[3,]    3    8    4
> a2$get.inversed.data()
NULL
> a2$m
NULL
 ```
*Why still 'm' is null? Isn't m is already assigned??*
 ```
> cacheSolve(a2)
            [,1]        [,2]        [,3]
[1,]  0.03546099  0.09219858 -0.34751773
[2,] -0.08510638 -0.02127660  0.23404255
[3,]  0.14361702 -0.02659574  0.04255319
> a2$get.inversed.data()
            [,1]        [,2]        [,3]
[1,]  0.03546099  0.09219858 -0.34751773
[2,] -0.08510638 -0.02127660  0.23404255
[3,]  0.14361702 -0.02659574  0.04255319
> a2$m
NULL
 ```
 Remember 'm' is not part of a2 because in four components are returned. 'm' is just a 'argument' in functions and do not have to be matched between cacheMatrix & cacheSolve.
```
 list(set.data=set.data,get.data=get.data,get.inversed.data=get.inversed.data,set.inversed.data=set.inversed.data)
```


