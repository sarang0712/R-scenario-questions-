flights

class(flights)

glimpse(flights)

select(flights,dep_time,arr_time,carrier)

#modern ctrl+shift+m

flights |> select(dep_time) #one column

flights |> select(dep_time,arr_time,carrier) #more column

#position

flights |> glimpse() |> select(flight:dest) #range of column

flights |> glimpse() |> select(11:14) #range using index

flights |> glimpse() |> select(2,7,10) #getting by individual index

flights |> glimpse() |> select(3,11:14) #range using index

#you sort the dervied column variable in desc

#delay_per_mile = arr_delay/distance

flights |> 
  
  mutate(delay_per_mile= arr_delay/distance) |> 
  
  select(year,month,day,carrier,delay_per_mile) |> 
  
  arrange(desc(delay_per_mile))

#you want to sort the variable after filtering

#top delayed flights from JFK origin

flights |> 
  
  filter(origin=='JFK') |> 
  
  select(year,month,day,carrier,origin,dest,arr_delay) |> 
  
  arrange(desc(arr_delay))

#sorting within the groups

#i want to sort the desc.arr_delay based on each carrier

flights |> 
  
  group_by(carrier) |> 
  
  select(carrier,arr_delay) |> 
  
  arrange(desc(arr_delay))  #this is not right way

#this is correct way ##.by_group = TRUE

f_d<- flights |> 
  
  group_by(carrier) |> 
  
  select(carrier,arr_delay) |> 
  
  arrange(desc(arr_delay),.by_group = TRUE) |> 
  
  left_join(airlines,by = "carrier") |> 
  
  select(air_plane= name,
         
         carrier)
f_d
#another way without .by_group parameter

flights |> 
  
  group_by(carrier,arr_delay) |> 
  
  select(carrier,arr_delay) |> 
  
  arrange(carrier,desc(arr_delay))


#sarang functions , 2nd hightes of carrier per arr_d
flights |> 
  group_by(carrier) |> 
  slice_max(arr_delay,n=2) |> 
  slice_tail(n=1) |> 
  select(carrier,arr_delay)


f1 <- flights |> 
  group_by(carrier) |> 
  slice_max(arr_delay, n=3) |> 
  select(carrier,arr_delay)
f2 <- f1[2,]

f1 <- flights |> 
  group_by(carrier) |> 
  slice_max(arr_delay, n=3) |> 
  select(carrier, arr_delay)

f2 <- slice(f1, 2)

## ranking arilines by average delay.

#carriers where the arr_delay is delay i,e average avg_delay..mean then sort the descending avg_delay

colSums(is.na(flights))

flights |>
  
  group_by(carrier) |> 
  
  summarise(avg_delay= mean(arr_delay,na.rm=TRUE)) |> 
  
  arrange(desc(avg_delay))

#add first year, month, day.

flights |>
  
  group_by(carrier) |> 
  
  summarise(avg_delay= mean(arr_delay,na.rm=TRUE),
            
            year=first(year),
            
            month=first(month),
            
            dep_time=first(day),
            
            arr_time=first(day)) |>
  
  arrange(desc(avg_delay))

#sorting the char col

flights |> arrange(tailnum) |> select(carrier,tailnum)

#ranking functions

x<-c(10,20,20,40,60)

tibble(
  
  value=x,
  
  row_num=row_number(x),
  
  min_rk=min_rank(x),
  
  den_rk=dense_rank(x),
  
  per_rnk=percent_rank(x)
  
)

#rank flights by delay

flights |> 
  
  mutate(delay_rank=min_rank(desc(arr_delay))) |> 
  
  select(carrier,arr_delay,delay_rank) |> 
  
  arrange(delay_rank) |> 
  
  add_count(delay_rank) |>
  
  filter(n>5)

#which airlines had the worst average delay each month?

# groupby(carrier)

flights |> 
  
  group_by(month,carrier) |> 
  
  summarise(avg_delay=mean(arr_delay,na.rm=TRUE)) |> 
  
  arrange(month,desc(avg_delay)) |> 
  
  slice_max(avg_delay,n=1)


#filters
Syntax
filter(.data, ..., .by = NULL, .preserve = FALSE)
filter_out(.data, ..., .by = NULL, .preserve = FALSE)
#one 
#filter flights which are jan
flights |> filter(month==1)

#flights which long delay >2 hours
flights |> filter(arr_delay > 120) |> select(carrier,arr_delay)

#multiple conditions
#filter flights which are jan and day =10
flights |> filter(month==1 & day==10) |> select(carrier,month,day)
flights |> filter(month==1 , day==10) |> select(carrier,month,day)

#filter flights which are month=1,5 or day =10
flights |> filter(month==1 |month==5 | day==10) |> select(carrier,month,day)

#in operator
flights |> filter(month %in% c(1,5) | day==10)|> select(carrier,month,day)

#inline computations like calculated expression 
## filghts with speed > 500mph.
## dis/air_time * 60
flights |> 
  mutate(speed=(distance/air_time)* 60) |> filter(speed > 500) |> 
  select(carrier,distance,air_time,speed) |> glimpse()

library(nycflights13)
library(tidyverse)

#POSITIONS

flights[c(3,5),]
flights[3:6,]
flights[3,]
flights[,4]
flights[,"carrier"]
flights[,4:6]
flights[,c(4,10)]

#slice():selects the rows based on the integer positions.
flights |> slice(6)
flights |> slice(1:4)
flights |> slice(c(1,3))
flights |> slice(1,3)
flights |> slice()
flights |> slice(,3)

#slice_head() ---> head()
flights |> slice_head(3)
flights |> slice_head(n=3)
flights |> slice_head(n=3:6)
#prop ---> percentage 30% ,20% 
nrow(flights)
ncol(flights)
str(flights)
flights |> slice_head(prop=0.20)
#by parameter will you to perform the slice within specific group rather the table
flights |> slice_head(prop = 0.25,by=carrier) |> select(carrier,arr_time)
# i want in the row of 3 and 8? i want to achiee slice_head() ? slice()
flights |> slice_tail(3)
flights |> slice_tail(n=3)

#compartively above head() and tail() is far better
flights |> head()
flights |> head(4:4)
flights |> head(c(4,2))
flights |> tail()

#slice_min()
flights |> slice_min(distance) |> select(carrier,origin,dest,distance)
#top 3 min 
flights |> slice_min(distance,n=3) |> select(carrier,origin,dest,distance)


library(tidyverse)
flights |> slice_max(distance) |> select(carrier,origin,dest,distance) |> distinct(distance)

flights |> slice_max(distance,n=3) |> select(carrier,origin,dest,distance) |> distinct(distance)

#sample()-slice_sample(n=...,prop=..., )

#code tunning

flights |> select(year,month,day,carrier) |> slice_sample(n=8)

#sample handle 19 variables ---> then sampling 

#4 varible ---> then sampling 

flights  |> slice_sample(n=8) |> select(year,month,day,carrier)

##sample handle 19 variables ---> then sampling  --> then 4 variables.

#code tunning 

#A-->BC-->DEF #query exec decre but if i have more data 1.5 laksh..

#resource , ram,cpu=its conusmign to execute the query

## BC function  ---> ZE function

#code optmizations

#A --> B --> C --> D-->E --> F

#A-->BC-->DEF #query exec decre

#Byte Compilation in function chapters

#1 TB flights data /// select(flights) --> how long?30-1hr 

## we use big data ... to process this big data --> special algorithm which on parallel computing spark, rspark below 5 mins

# current file system NTFS for windows, for linux  lxt..

# for big data  HDFS ( hadoop file system) #its like clustered environment

flights  |> slice_sample(prop=0.25) |> select(year,month,day,carrier)

flights  |> slice_sample(prop=0.3, by=carrier) |> select(year,month,day,carrier)

View(flights)

#complext conditions

#flights delayed but not cancelled

colSums(is.na(flights))

flights |> filter(!is.na(arr_delay) & arr_delay >0) |> select(carrier,arr_delay)

#extreme delay in winter

flights |> filter(month %in% c(11,12,1,2) ,arr_delay >100)

flights |> slice_max(arr_delay) |> select(arr_delay)

#find the flights where the total operation time execceed a certain threshold

#operations time == arr_time+dep_delay+arr_delay

#across()

flights |> select(arr_time,dep_delay,arr_delay) |>
  
  filter(rowSums(across(c(arr_time,dep_delay,arr_delay)),na.rm = TRUE) >400)

sum(8,38,3)

rowSums(8,38,3)

flights |> 
  
  mutate(tota_delay=rowSums(across(c(dep_delay,arr_delay)),na.rm=TRUE))|> 
  
  select(arr_time,dep_delay,arr_delay,tota_delay) 

#across ()

#mean for total operations based on the origing

flights |> 
  
  group_by(origin) |> 
  
  summarise(across(c(arr_time,dep_delay,arr_delay),mean,na.rm=TRUE))

flights |> 
  
  group_by(origin) |> 
  
  summarise(across(where(is.numeric),mean,na.rm=TRUE))
