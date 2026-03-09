#print
print("hello world")

#function
display <- function(){
  print("hello world")
}
display()
#S3,S4,R6 methods

readline()
var1 <- readline()
print(var1)

var1 <- readline("Enter you name :")
print(var1)

a <- readline("write a number :")
a <- as.integer(a)
print(a+a)


age <- readline("Enter you age :")
age <- as.integer(age)
print(age)

Name <- readline("Enter you name :")
print(Name)

Location <- readline("Enter you location :")
print(Location)

#scan()
scan()
num <- scan()
num  # this is called vector
sum(num)
print(num*2)

scan()
num <- scan()
num
sum(num)
print(num*2)

help(cat)
?cat
help(print)

a<-"sarang" #character literal

a <- 324 #numeric literal

a <- "02-Dec-2016" #date literal

#operators is a symbol specific operations

3+3 #arthemiatc

#-,*..

#comment

#3+3

ctrl+shift + c

# sdfdsf

# #ssdf;sdf'sfd

# sdf

# sdf

# sdfsd

# fsdf

# sdf

# sdf'

library(nycflights13)

library(tidyverse)

flights |> 
  
  #slice_min(distance) |> 
  
  select(carrier,origin,dest,distance)

if(TRUE){
  
  print("hello world")
  
}

4+3

print("hello world")

print("hello world")

print("hello world")

print("hello world",quote=FALSE)

print("ganesh","babu","G") #does not contact

print(paste("ganesh","babu","G")) #concatenations

#function

hello<- function(){
  
  print("hello world")
  
}

hello()

#if you want a funciton to accept the value dynamically

hello<- function(a){
  
  result<- a
  
  print(result)
  
}

a<- hello("hello god")

a

#but the typical way to use return() 

hello<- function(a){
  
  result<- a
  
  return(result)
  
}

a<- hello("hello god")

a

#S3,S4,R6

