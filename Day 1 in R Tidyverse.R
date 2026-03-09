#Day 01
install.packages("tidyverse")
library(tidyverse)
library(nycflights23)
flights
airlines
planes
airports
weather

View(flights)
view(airlines)
view(planes)
view(airports)
view(weather)
dim(flights)
nrow(flights)
ncol(flights)
class(flights)
str(flights)
glimpse(flights)

#day 02

my_df <- data.frame(
  name=c("Sarang","Zeel"),
  age= c(28,26)
)
my_df
str(my_df)

#tibble

my_df_tib <- tibble(
  name =c("Zeel", "Sarang"),
  City=c("Ahmdabad","Banglore")
  
)
my_df_tib
str(my_df_tib)

# tribble Coolest way to create the data set
my_df_trib <- tribble(
  ~name,~age,
  "Zeel","26",
  "Sarang","28",
  "ZS","54"
  
)
my_df_trib
str(my_df_trib)

#why we need tidyverse, dplyr modern R data language
flights
view(flights)
#p.s want to capurea all of of month==1 irrespective any year

flights_m <- flights[,c("year","month","day")]
flights_m[which(flights_m$month==1),]

#What Does $month == 1 Mean?
# flights_m$month

#$ is used to access a column from a data frame.

#flights_m$month means:
 # 👉 “Give me the month column from flights_m”
#*******************************************************************#

#Scenario-01
#1. Get all flights in December
flights_m[which(flights_m$month==12),]
#if we want to used in dplyr packge

flights_m[flights$month==12,]

#Scenario 02
#Get all flights in January 2013
flights_m[which(flights_m$month==12, flights_m$year==2013),]
#if we want to used in dplyr packge
flights_m [flights_m$month==12 & flights_m$year==2013,]
#Get flights from day 15
flights_m[which(flights_m$day==15),]
#or
flights_m[flights_m$day==15,]

#Get flights NOT in January
flights_m[which(flights_m$month != 1),]
view(flights)

#or
flights_m[flights_m$month != 1 &
            flights_m$month != 2 & flights_m$month != 3 & flights_m$month != 4, ]
# or
flights_m[!flights_m$month %in% c(1,2,3,4),]

# even better with deplyr
library(dplyr)
flights_m %>% 
  fliter(!month %in% c(1,2,3,4,5,6,7,8,9))
install.packages("dplyr")   # only once
library(dplyr)

flights_m %>%
  filter(!month %in% c(1,2,3,4))
#or
filter(flights_m, !month %in% c(1, 2, 3, 4))

flights_m[flights_m$month %in% 6:12,]
#%in% → checks if value is inside a list

#c(1,2,3,4) → vector of months

#! → NOT

# or

#If numbers are continuous → use >= and <=
#If specific numbers → use %in%

flights_m[flights_m$month >= 6 & flights_m$month <= 12, ]

#dplyr
flights_m1 <- select(flights,"year","month","day","dep_time")
print((flights_m1))

#enhanced dplyr pipe operator

flights %>%  select("year","month","day") %>% glimpse() %>%  filter(month==1)

#nave piep
 flight_sa <- flights |> select("year","month","day") |> glimspe() |> filter(month=1=)
 #https://github.com/ganeshbabuNN/MyNotes/blob/master/R_Language/5-Framework/Data_Manpulations/Tidyverse_Method/archive/R_to_SAS_Tidyverse_Equivalents.pdf
 #query the data
 flights
 class(flights)
 glimpse(flights)
select(flights,dep_time,arr_time) 

# modern ctrl + shift + m
flights |> select(dep_time)
flights |> select(dep_time,arr_time,carrier) #more column
  #position
  flights |> glimpse() |> select(flight:dest) #range of column
flights |> glimpse() |> select(11:14) #range using index
flights |> glimpse() |> select(2,7,10) #getting by individual index
flights |> glimpse() |> select(3,11:14) #range using index

#exlude
flights |> select(-dep_time,-arr_time,-carrier) |> glimpse()
library(dplyr)

flight_1 <- flights %>%
  select(-(year:day)) #excluding a range

#helper functions
#start with some char
library(dplyr)
flights |> glimpse() |> select(starts_with("dep"))

flights |> glimpse() |> select(ends_with("delay"))
#searching for variable which contains ("time")
flights |>  glimpse() |> select(contains("m"))
#regular expression
flights |> glimpse() |>  select(matches("^arr"))

flights |> glimpse() |> select(grep("^arr"))

flights |> glimpse() |> select(matches("^.*t$"))

flights |> glimpse() |> select(last_col(offset = 10))
flights |> glimpse() |> select(4)

flights |> glimpse() |> select(where(is.numeric))
flights |>  glimpse() |> select(where(is.character))
flights |>  glimpse() |>  select(!where(is.character))

airports |> glimpse() |> select(which(c(FALSE,TRUE,TRUE,TRUE,FALSE,TRUE)))

#relocate
flights |> glimpse() |> relocate(origin,dest,.after = year)
flights |>  glimpse() |> relocate(origin,dest,.before = year)
flights |>  relocate(where(is.character))
flights |>  relocate(carrier) |> glimpse() 
flights |>  relocate( contains ("delay"))
flights |> relocate(where(is.character),.after = last_col()) |>  glimpse()
#convert the variable to vector
year_f <- flights |> select(year)
typeof(as.vector(year_f))
v_year <- as.vector(year_f)

year_f <- flights |> select(year)
typeof(as.vector(year_f))
v_year <- as.vector(year_f)
year_p <- flights |> pull(year)
year_p

flights |> pull(4)
flights |> pull(last_col())

#select after the join
#to show info of carrier full name (airplanes) and show only carrieer,full name,dep_dely,arr_dely
flights |> left_join(airlines, by="carrier") |> select(carrier,name,dep_delay,arr_delay)
