library(httr)
library(httpuv)
library(jsonlite)
library(dplyr)

github<-oauth_endpoints("github")
myapp<-oauth_app("github",key = "669449cbb32764fc80af",secret = "9ae5c31064dc80434ab4f1cbf27611a17986446e")
github_token<-oauth2.0_token(github,myapp)

gtoken<-config(token=github_token)
req<-GET("https://api.github.com/users/jtleek/repos", gtoken)
stop_for_status(req)
cotents(req) 
