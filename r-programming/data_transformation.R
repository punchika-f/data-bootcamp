## Live - Data Transformation

# install.packages(c("dplyr", "glue"))

library(dplyr)
library(glue)

# string template
my_name <- "toy"
my_age <- 36

text <- glue("Hi! my name is {my_name} and I'm {my_age} years old!")

print(text)

## dplyr => data transformation
## select, filter, arrange, mutate, summarise + group_by()

## [1] select columns
## move 'model' to the left
select(mtcars, model, 1:5)

m <- select(mtcars, model, everything())

## helper verbs to select columns
select(m, starts_with("h"))
select(m, starts_with("a"))
select(m, ends_with("p"))
select(m, contains("a"))

## syntax in tidyverse (dplyr)
## data pipeline %>% (piping)
m %>%
  select(1:5) %>%
  head()

## [2] filter data
## R is very similar to GGsheets
## large dataset
m %>%
  filter(mpg < 15 
         & hp > 240 
         & wt > 3.8) %>%
  select(model, mpg, hp, wt)
  
## experiment with filter()
m %>%
  filter(grepl("^[^HTP]", model)) %>%
  select(model, am, wt, hp)

## and or
m %>%
  select(1:5) %>%
  filter(hp < 100 | disp < 100)

## [3] mutate = create new column
m %>%
  select(model, hp, wt) %>%
  mutate(hp_double = hp*2,
         hp_halve = hp/2,
         hp_add_five = hp+5,
         new = hp/wt,
         new2 = hp+wt) %>%
  head()

## if-else create new segment column
m %>%
  select(model, hp) %>%
  mutate(segment = if_else(hp>200, 
                           "high",
                           "low")) %>%
  mutate(segment2 = case_when(
    hp > 200 ~ "high",
    hp > 100 ~ "medium",
    hp <= 100 ~ "low"
  )) 

## [4] arrange sort data
m %>%
  select(model, am, hp) %>%
  ## descending order Z-A (high to low)
  arrange(desc(model))

m %>%
  select(model, am, hp) %>%
  ## descending order
  arrange(am, desc(hp))

## [5] summarise
m %>%
  select(model, am, hp) %>%
  mutate(am = if_else(am==0, 
                      "Auto", 
                      "Manual")) %>%
  group_by(am) %>%
  summarise(avg_hp = mean(hp),
            sum_hp = sum(hp),
            med_hp = median(hp),
            sd_hp = sd(hp),
            var_hp = var(hp),
            n = n())

## install.packages("sqldf")
library(sqldf)

sqldf("Select model, HP, Wt
       FROM m")

sqldf("SELECT am, avg(hp), sum(hp)
       FROM m
       GROUP BY am")

## slice, pull, sample

## rename
m %>%
  select(model, 
         horse_power = hp, 
         transmission = am, 
         weight = wt) %>%
  head()

m %>%
  rename(car = model,
         weight = wt)

## install.packages("tidyr")
library(tidyr)

## missing value in R : NA
nums <- c(1:10, NA, 11:15)

## clean NA in dataframe
## replace_na()

id <- 1:5
friends <- c("toy", "john",
             "mary", "anna", "david")
spending <- c(100, 150, NA, 200, 180)

df <- data.frame(id, friends, spending)

## close friends => avg()
avg_spending <- mean(df$spending, na.rm=T)
median_spend <- median(df$spending, na.rm=T)

## mean imputation
clean_df <- df %>%
  mutate(spending = replace_na(spending,
                               median_spend)) %>%
  mutate(service = c("nf", "nf", "nf", "amz", "nf"))

## majority vote

## manage missing value
## 1. do nothing
## 2. imputation
## 3. drop rows with NA

## drop NA
## data loss <= 5%, acceptable rate
df %>%
  drop_na()

## wide vs. long data format
## data analyst prefer [LONG format]

## Long Format (Tidy Data)
## [Important] one column, one data type

View(world_bank_pop)

## apply dplyr + tidyr turn wide to long data format
long_df <- world_bank_pop %>%
  filter(indicator == "SP.URB.TOTL") %>%
  pivot_longer(cols = `2000`:`2017`,
               names_to = "year",
               values_to = "population") 

long_df %>%
  pivot_wider(names_from = "year",
              values_from = "population") %>%
  View()

## read Book1.csv
samsung_sales <- read.csv("Book1.csv")

clean_ss_sales <- samsung_sales %>%
  pivot_longer(cols = S24:S25U,
               names_to = "model",
               values_to = "sales") %>%
  rename(country = Country) %>%
  mutate(model = if_else(model == "S25.", "S25P", model))

write.csv(clean_ss_sales, "clean_data.csv", row.names = F)

## chinook.db
## connect to sqlite database

## install.packages("RSQLite")
library(RSQLite)
getwd()
list.files()

## connect database
con <- dbConnect(SQLite(), "chinook.db")

dbListTables(con)

dbListFields(con, "customers")

## send SQL to this database
result <- dbGetQuery(con, "
  select firstname, email, country
  from customers
  where country = 'USA' ")

## write a new table
library(dplyr)
mini_df <- mtcars %>%
  select(mpg, hp, wt) %>%
  filter(hp > 200)

dbRemoveTable(con, "models")

## DROP TABLE ..

dbWriteTable(con, "models", mini_df)

## CREATE TABLE ..

dbGetQuery(con, "select * from models")

## close connection
dbDisconnect(con)

## PostgreSQL case study
library(RPostgreSQL)

con <- dbConnect(PostgreSQL(),
          user = "toyeiei",
          password = "123456",
          host = "...",
          port = 5432,
          dbname = "marketing_segment")

## homework
## 1. note taking all stuff that we learned together today
## 2. nycflight library
## install.packages("nycflights23")
library(nycflights23)

data("flights")
View(flights)

## 1. top five carriers in September 2023
flights %>%
  filter(month == 9) %>%
  count(carrier) %>%
  arrange(-n) %>%
  head(5) %>%
  left_join(airlines)

## join data in R

band_members
band_instruments


## join syntax
band_members %>%
  full_join(band_instruments, by = "name")

## in case key names are different
df1 <- data.frame(id=1:3, 
                  name=c("toy","john","ann"))

df2 <- data.frame(hey=1:3,
                  school=c("datarockie",
                           "futureskill",
                           "skooldio"))

df1 %>%
  left_join(df2, by = c("id" = "hey"))









