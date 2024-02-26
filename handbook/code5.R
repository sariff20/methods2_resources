n_girls <- rbinom(1,400,0.488)
print(n_girls)
n_sims <- 1000
n_girls <- rep(NA, n_sims)
for(s in 1:n_sims){
  n_girls[s] <- rbinom(1,400,0.488)
}
hist(n_girls)

birth_type <- sample(c("fraternal twin", "identical twin", "single birth"),
                     size = 400, replace = TRUE, prob=c(1/125,1/300,1-1/125-1/300))
girls <- rep(NA,400)
for(i in 1:400){
  if (birth_type[i] == "single birth"){
    girls[i] <- rbinom(1,1,0.448)
  }
  else if (birth_type[i]=="identical twin"){
    girls[i] <- 2*rbinom(1,1,0.495)
  }
  else if (birth_type[i] == "fraternal twin"){
    girls[i] <- rbinom(1,2,0.495)
  }
}
n_girls <- sum(girls)
n_sims <- 1000
n_girls <- rep(NA, n_sims)
for(s in 1:n_sims){
  birth_type <- sample(c("fraternal twin", "identical twin", "single birth"),
                       size = 400, replace = TRUE, prob=c(1/125,1/300,1-1/125-1/300))
  girls <- rep(NA,400)
  for(i in 1:400){
    if (birth_type[i] == "single birth"){
      girls[i] <- rbinom(1,1,0.448)
    }
    else if (birth_type[i]=="identical twin"){
      girls[i] <- 2*rbinom(1,1,0.495)
    }
    else if (birth_type[i] == "fraternal twin"){
      girls[i] <- rbinom(1,2,0.495)
    }
  }
  n_girls[s] <- sum(girls)
}
hist(n_girls)

n_sims <- 1000
y1 <- rnorm(n_sims,3,0.5)
y2 <- exp(y1)
y3 <- rbinom(n_sims,20,0.6)
y4 <- rpois(n_sims,5)
par(mfrow=c(2,2))
hist(y1,breaks=seq(floor(min(y1)),max(y1)+0.2, 0.2),
               main="normal distribution with mean 3, sd 0.5")
hist(y2,breaks=seq(0,max(y2)+5,5),
     main="corresponding lognormal distribution")
hist(y3,breaks=seq(-0.5,20.5,1),
     main="binomial distribuation with 20 tries, probability 0.6")
hist(y4,breaks=seq(-0.5,max(y4)+1,1),
     main="poisson distribution with mean 5")

male <- rbinom(1,1,0.48)
height <- ifelse(male==1,rnorm(1,69.1,2.9),rnorm(1,63.7,2.7))
N <- 10
avg_height <- mean(height)
print(avg_height)
n_sims <- 1000
avg_height <- rep(NA,n_sims)
max_height <- rep(NA,n_sims)
for(s in 1:n_sims){
  N <- 10
  male <- rbinom(N,1,0.48)
  height <- ifelse(male==1,rnorm(N,69.1,2.9),rnorm(N,63.7,2.7))
  avg_height[s] <- mean(height)
  max_height[s] <- max(height)
}
hist(avg_height,main="distribution of avg hegiht of 10 adults")
hist(max_height,main="dsitribution of max hegight of 10 adults")

#simulation function
height_sim <- function(N){
  male <- rbinom(N,1,0.48)
  height <- ifelse(male==1,rnorm(N,69.1,2.9),rnorm(N,63.7,2.7))
  mean(height)
}

#using function
avg_height <- replicate(1000,height_sim(N=10))
hist(avg_height)

#demonstrating meadian absolut deviation
z <- rnorm(1e4,5,2)
cat("mean=", mean(z), ", median=", median(z), ", sd=", sd(z), ", mad sd= ", mad(z))

#earnings data
setwd("C:/Users/sari/Documents/aarhus/methods2/methods2_resources/handbook/data/Earnings/data")
earnings <- read.csv("earnings.csv")
earn <- earnings$earn
male <- earnings$male
ratio <- median(earn[male==0]) / median(earn[male==1])
print(ratio)

#bootsrapping
boot_ratio <- function(data){
  n <- nrow(data)
  boot <- sample(n,replace=TRUE)
  earn_boot <- data$earn[boot]
  male_boot <- data$male[boot]
  median(earn_boot[male_boot==0]) / median(earn_boot[male_boot==1])
}
n_sims <- 1000
output <- replicate(n_sims,boot_ratio(earnings))
hist(output)
print(sd(output))
