library(pacman)
p_load(rstanarm)

plot(hibbs$growth, hibbs$vote)
M1 <- stan_glm(vote ~ growth, data=hibbs)
abline(coef(M1))
print(M1)