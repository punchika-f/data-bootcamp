# Convert Data
X <- 100
class(x)  ## will show "numeric"

char_x <- as.character(X) ## will show "100"
num_x <- as.numeric(char_x) ## will show 100

# IFELSE
today_menu <- function (day , time) {
  menus <- c("cereal", "banana", "milk", "mama")
  days <- c("weekday", "weekend")
  times <- c("morning", "evening")
  # weekday, morning
  if (day == days[1] & time == times[1]) {
      return(menus[1])
  # weekday, evening  
  } else if (day == days[1] & time == times[2]) {
      return(menus[2])
  # weekend, morning  
  } else if (day == days[2] & time == times[1]) {
      return(menus[3])
  # weekend, evening
  } else if (day == days[2] & time == times[2]) {
      return(menus[4])
  }
}

# FOR
fruits <- c("apple", "banana", "mango", "orange")
for (fruit in fruits) {
  if (fruit == "apple") {
      print("hello world")
  } else {
      print(fruit)
  }
}


# PASTE
Gang <- c("Faii", "Mook", "Tang", "Song")

paste("Yo!", Gang)
paste0("Yo!", Gang) ##will show Yo!Faii (no space)

# WHILE
count <- 0

while(count < 3) 
  { 
  print("Yeah")
  count <- count + 1 
  ## limit โดย ทุกๆ 1 run vector count จะถูก + ทีละ 1
  ## จะเป็น 0 1 2 3 4 .... ไปเรื่อยๆ
  }

# Readline
## check username & password
authen <- function() {
  user = "Faieiei"
  pw = "1234"
  input1 = readline("username: ")
  input2 = readline("password: ")
  if (input1 == user & input2 == pw) {
    print("Log in successfully!")
  } else {
    print("Your username/password is incorrect.")
  }
}

# Sample
colors <- c("pink", "red", "blue", "black", "yellow")
sample(colors,1)

# Create Function + set default
# name,age => parameter
## "Faii",26 => argument
greeting_name <- function(name = "Faii", age = 26) ##default
{
  print(paste("Hi!", name))
  print(paste("Age", age))
}

greeting_name()
greeting_name("Mook",25)


# count_ball
balls <- c("pink", "pink", "blue", "green", "pink", 
						"purple","blue", "red", "yellow")

count_ball <- function(balls, color) 
{
  sum(balls == "pink")
}

sum(balls == "pink")
sum(balls == "blue")

# Bind function (การรวม dataframe)
## Rows (ต่อล่าง)
econ <- read_excel("students.xlsx", sheet = 1)
business <- read_excel("students.xlsx", sheet = 2)
data_stu <- read_excel("students.xlsx", sheet = 3)

list_df <- list(econ, business, data_stu)
full_df <- bind_rows(list_df)
## Column (ต่อขวา)
df1 <- data.frame(
  id = 1:4,
  name = c("Faii", "Mook", "Tang", "Song"))

df2 <- data.frame(
  id = 1:4,
  city = c("BKK","NW","BKK","CNX"))

bind_cols(df1,df2)



