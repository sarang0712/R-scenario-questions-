is_palindrom <- function (x){
  x <- as.character(x)
  reveresed <- paste(rev(strsplit(x, "")[[1]]),collapse = "")
  return (x == reveresed)
}

is_palindrom ("madam")
is_palindrom (1221)
is_palindrom("sarang")


second_largest <- function(x) {
x <- c(10, 5, 20, 8)
x <- unique(x)
max1 <- max(x)
x <-x[x != max1]
max(x)
}

second_largest(x)

second_largest <- function(x) {
  x <- sort(unique(x), decreasing =  TRUE)
  x[2]
}
second_largest(c(10,12,13,9,8))

# count vowels in string 
x <- "hElLo WoRlD Sarang GuJaRaThI"
x <- tolower(x)
chars <-strsplit(x, "")[[1]]
# Defin Vowels 
vowels <- c("a", "e", "i", "o", "u", "A", "E", "I", "O", "U")

vowels_count <-sum(chars %in% vowels)
vowels_count
