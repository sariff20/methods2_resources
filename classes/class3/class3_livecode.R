library(pacman)
p_load(tidyverse, ggplot2)

##for loops

#for loop for squaring
for (number in 1:16) {
  print(paste(" for debugging current number is", number))
  print(number ^ 2)
}

##while loops

#while loop printing unequal numbers from 1 to 25

counter <- 1
while (counter < 26) {
  print(paste("the counter is", counter))
  counter <- counter + 2
}
counter <- 1

##ifelse statements

#ifelse for check positive negative and zero

number <- -1

if (number > 0) {
  print("the number is positive")
} else if (number < 0) {
  print("the number is negative")
} else{
  print("the number is zero")
}

#ifelse in forloop

numbers <- c(9, -5, 0, 1, 1, 0, -3, -4)
for (number in numbers) {
  if (number > 0) {
    print("the number is positive")
  } else if (number < 0) {
    print("the number is negative")
  } else{
    print("the number is zero")
  }
}

#ifelse in function

number_checker <- function(list_numbers) {
  for (number in list_numbers) {
    if (number > 0) {
      print("the number is positive")
    } else if (number < 0) {
      print("the number is negative")
    } else{
      print("the number is zero")
    }
  }
}

number_checker(numbers)

new_numbers <- c(1, 1, 0, 0, -1, -1)
number_checker(c(-1, 1, 0, 0, -1, -1))
















