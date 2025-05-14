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
