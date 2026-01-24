Jan 14 In Class Review

N <- 20
x <- sample(x = 1:5, size = N, replace = TRUE)

yHat <- 1/2*x

mean(yHat)
mean(1/2*x)
1.2*mean(x)

b1 <- 1/2
b0 <- 2

yHat <- b0 + b1*x

mean(yHat)
mean(b0 + b1*x)
mean(b0) + mean(b1*x)
(N*b0)/N + b1*mean(x)


mean(yHat[x == 3])
b0 +b1*mean(x[x== 3])


e <- rnorm(N, mean = 0, sd =1)
e <- scale(e)

y <- b0 + b1*x + e

mean(y)
mean(b0 + b1*x + e)
mean(b0) + mean(b1*x) + mean(e)