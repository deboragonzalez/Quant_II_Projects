################################################
# Week 6 In Class: Regression Assumptions in R #
################################################

#For today's lab, we are going to read in the simulated math achievement data.

#Remember: file.choose() is extremely useful for finding a file path.

dat <- read.csv("/Users/debig/Documents/PhD Y1/Stats II/Quant II Projects/mathAchData.csv")

#Tim's version:
dat <- read.csv("/Users/thayes/Dropbox/Mac Documents/Quant II Spring 2022/Week By Week/Week 5/Week 5 Post/2. In Class R/mathAchData.csv")

#Examining structure using some functions from last week:
head(dat)
str(dat)

colnames(dat)

###############################################################################
# Part 1: The lm() Function for Regressions in R and Useful Related Functions #
###############################################################################

#Let's run a regression in R predicting math achievement from math class using the lm() function

lm(formula = mathach ~ mathClass, data = dat)
	#lm stands for 'linear model'.
	#formula takes the form y ~ x
		#where ~ stands for 'is regressed on' or 'predicted by' or 'distributed as a function of'
	#the data argument is where you provide the name of your dataset.
	
#We can save this regression model as an object called 'fit.'

fit <- lm(formula = mathach ~ mathClass, data = dat)
fit
#This does not display much information

#The summary() function will act on a regression model and print more extensive output:

summary(fit) 
#note, this is the same thing that would happen if you ran summary(lm(formula = mathach ~ mathClass, data = dat))

#What do these estimates mean in words?

#            Estimate Std. Error t value Pr(>|t|)    
#(Intercept)  80.4691     0.3423  235.06   <2e-16 ***
#mathClass     4.9366     0.4193   11.77   <2e-16 ***

#Note the values of x when interpreting the intercept:
unique(dat$mathClass)

#Multiple R-squared:  0.3834. #38% of the outcome variance is explained by math class (math placement.)

#There are many useful functions to act on lm() regression models. One is the coef() function, which will return the model coefficients:

coef(fit)
#(Intercept)   mathClass 
#  80.469080    4.936636 

#Note that this is a named vector....
coef(fit)[1]
coef(fit)["(Intercept)"]

#Let's save the intercept and slope from this model ...

b0 <- coef(fit)["(Intercept)"]
b1 <- coef(fit)["mathClass"]

#We can use this to calculate y-hat and residual values 'by-hand' in R.

yhatByHand <- b0 + b1*dat$mathClass
eiByHand <- dat$mathach - yhatByHand

#Note that just as SPSS will allow you to save predicted values and residuals in the save menu, R has functions that do this automatically.

#The predict() function will calculate yhat values automatically.
#The resid() function will calculate residuals automatically.

yhat <- predict(fit)
ei <- resid(fit)

#Are these the same as the by-hand versions? Let's look at them side by side

data.frame(yhatByHand, yhat)
data.frame(eiByHand, ei)

yhatByHand - yhat
round(eiByHand - ei, 2)
#Yup, they're the same!

######################################################################
# Part 2: Verifying our Conditional and Marginal Means and Variances #
######################################################################

#Let's look at the conditional means, starting with mathClass == 1 (AP math):

mean(dat$mathach[dat$mathClass == 1])
b0 + b1*1

#Very close ... recall that the conditional mean of the residuals is *expected* to be zero, but may not be due to sampling error.

#Let's see what this value is:

mean(ei[dat$mathClass == 1]) #Not exactly zero in the sample data.

#Let's try this again ..
mean(dat$mathach[dat$mathClass == 1])
b0 + b1*1 + mean(ei[dat$mathClass == 1]) #Exact match!

mean(dat$mathach[dat$mathClass == 0])
b0 + b1*0 + mean(ei[dat$mathClass == 0]) #Exact match!

mean(dat$mathach[dat$mathClass == -1])
b0 + b1*(-1) + mean(ei[dat$mathClass == -1]) #Exact match!


#What about the conditional variances?
var(dat$mathach[dat$mathClass == 1])
var(ei[dat$mathClass == 1])

var(dat$mathach[dat$mathClass == 0])
var(ei[dat$mathClass == 0])

var(dat$mathach[dat$mathClass == -1])
var(ei[dat$mathClass == -1])

#Very close to equal at each conditional value....


#What about the overall mean and variance?
b0 + b1*mean(dat$mathClass); mean(dat$mathach)

b1^2*var(dat$mathClass) + var(ei); var(dat$mathach)

#Yup! Works out just like on the slides...

#Proportion of variance explained:
rsquared <- var(yhat)/var(dat$mathach) 
round(rsquared, 4) #[1] 0.3834

summary(fit)
#Multiple R-squared:  0.3834.

#Also the same as the squared bivariate correlation between x and y in the one-predictor case:
round(cor(dat$mathClass, dat$mathach)^2, 4)

##########################################################
# Part 2: Bivariate Scatterplots using the Plot Function #
##########################################################

plot(x = dat$mathClass, y = dat$mathach)
#plot(x,  y) will create a scatterplot by default.

#abline(fit) will superimpose a regression line. 
abline(fit)

#Note: optional arguments for prettying up this type of plot can be found by consulting the help files for plot and par() #graphical parameters

?plot
?par

#Here are some that I like:
plot(x = dat$mathClass, dat$mathach, bty = "l", xlab = "Math Class", font.axis = 2, cex.axis = 1.25, col.axis = "slategray4", ylab = "Math Achievement", font.lab = 2, cex.lab = 1.5, col.lab = "royalblue", col = "slategray4", lwd = 2)
#plot(x,  y) will create a scatterplot by default.

#abline(fit) will superimpose a regression line. 
abline(fit, col = "royalblue", lwd = 3)

#Note that you can look up the names of all colors in R with the function colors()

colors()

