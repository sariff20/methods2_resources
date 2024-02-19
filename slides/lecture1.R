observations <- rnorm(20, mean = 0, sd = 2)
observations

hist(observations)

#coding two ways the probability density
x <- seq(-5, 5, length.out = 100)
sigma <- 3
mu <- 0

x
f1 <- (1/(sigma*sqrt(2*pi)))*exp((-(1/2))*((x-mu)/sigma)^2)
sigma1 <- plot(f1)
sigma3 <- plot(f1)

tau <- 3
f2 <- sqrt(tau/(2*pi))*exp(((-tau)*(x-mu)^2)/2)
tau1 <- plot(f2)
tau3 <- plot(f2)

par(mfrow = c(1, 2))
plot(f1)
plot(f2)

#simulation
values <- rnorm(10000,7,sqrt(1/2))
count <- sum(values > 8.4)
count/10000
