library(ggplot2)

#functioggplot2#function

myfunc <- function(x){
  x2 = x+2
  return(x2)
}

myfunc(2)

##functions for normal distribution

#defining parameters
mu = 0.0
sigma = 1.0
tau = 1.0

#define first function
ndf1 <- function(x, mu, sigma) {
  (1 / (sigma * sqrt(2 * pi))) * exp(-0.5 * ((x - mu) / sigma) ^ 2)
}


#define second function
ndf2 <- function(x, mu, tau) {
  (sqrt(tau / (2 * pi))) * exp((-tau * (x - mu) ^ 2) / 2)
}


#generate x values
x_values <- seq(-5,5,by=0.1)

#calculate y values
y_f1 <- ndf1(x_values, 0, 3)
y_f2 <- ndf2(x_values, 0, 3)

#create dataframes
df <- data.frame(x=x_values,f1=y_f1,f2=y_f2)

#plotting data
plot1 <- ggplot(df, aes(x)) +
  geom_line(aes(y=f1,colour = "f1")) +
  geom_line(aes(y=f2,colour="f2")) +
  theme_minimal()
plot1
  
  