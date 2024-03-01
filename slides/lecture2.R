#first task
##setting parameters
mean <-  6
sd <-  2

##simulation with 5 observations
sim_values1 <- rep(NA,200)
for (i in 1:200){
  sim_values1[i] <- mean(rnorm(5,6,2))
}

##simulation with 50 observations
sim_values2 <- rep(NA,200)
for (i in 1:200){
  sim_values2[i] <- mean(rnorm(50,6,2))
}

##histograms
par(mfrow = c(1, 2))
hist(sim_values1)
hist(sim_values2)

#second task

mu <- 5
sigma <- 3
alpha <- 1.5
beta <- 2

x <- rnorm(100,sigma,mu)
y <- alpha + beta * x

plot(x,y)

##add noise
y <- y + rnorm(100,0,1)
plot(x,y)

#thrid task
mu <- 5
sigma <- 3
alpha <- 1.5
beta <- 2

x <- rbinom(100,1,0.5)
y <- alpha + beta * x
plot(x,y)

#add noise
y <- y + rnorm(100,0,1)
plot(x,y)

#fourth task

p <- 22/50
se <- sqrt((p*(1-p))/50)
se

p <- 431/1000
se <- sqrt((p*(1-p))/1000)
se

#fifth task













