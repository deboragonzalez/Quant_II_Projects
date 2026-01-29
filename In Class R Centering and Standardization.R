############################################
# In Class R Centering and Standardization #
############################################

#Let's read in the class data:
file.choose()

dat <- read.csv("/Users/thayes/Dropbox/Mac Documents/Quant II Spring 2025/Week by Week 2025 Post/Topic 4 Centering and Standardization/2. In Class Software Demonstration/hoursGradeData.csv")

head(dat)

#==================================================#
# Part I: Basic Regression and Predictor Centering #
#==================================================#

#Let's run our first regression in R! 

#To do this, we will use the lm() linear model function
	#lm stands for linear model
	#Function takes at least 2 main arguments:
		#lm(formula, data, ...)
		
		#Formula is your regression model formula:
			# y ~ x
				#where y is the dv (outcome)
				#~ indicates 'regressed on'/'is predicted by'/'is distributed as a function of'
				#x, the predictor
				
	rawScoreFit <- lm(grade ~ hours, data = dat)
	rawScoreFit
	
	summary(rawScoreFit)
	
	coef(rawScoreFit)
	
	#Recreate slope and intercept from slide/texbook formulas
	coef(rawScoreFit)["hours"]
	
	#formula: b1 = cov(x, y)/var(x)
	coef(rawScoreFit)["hours"]
	cov(x = dat$hours, y = dat$grade)/var(dat$hours) #They are the same!
	
	coef(rawScoreFit)["(Intercept)"]
	
	#Formula from the slides: b0 = ybar - b1*mean(x)
	mean(dat$grade) - coef(rawScoreFit)["hours"]*mean(dat$hours)
	
	#### Back to the matter at hand
	
	#Couple of useful things....
	
	#What if you want y-hat values?
	
	#Method 1: calculate using a formula (tedious)
	
	b0 <- coef(rawScoreFit)["(Intercept)"]
	b1 <- coef(rawScoreFit)["hours"]
	x <- dat$hours
	
	b0 + b1*x
	
	#Residuals = y - yhat
	
	y <- dat$grade
	
	#residuals, by hand
	
	y - b0 - b1*x
	
	yhat <- b0 + b1*x
	y - yhat
	
	#There are built in, automated shortcuts for this, however ...
	
	
	predict(rawScoreFit)
	
	data.frame(fromR = predict(rawScoreFit), byHand = yhat)
	
	#resid() will calculate residuals
	
	resid(rawScoreFit)
	
	#Just a teaser for some stuff we'll see in detail later ...
	
	rawScoreResults <- summary(rawScoreFit)$coefficients

#*********************************	
# Regression with a Centered X
#*********************************

#Let's create a centered version of hours

#One way to do this is by hand 
	dat$hours - mean(dat$hours)

#A second, minimally easier way is using the scale()

	#scale(x, center = TRUE, scale = TRUE)
		#x = a vector
		#center = do you want to mean center x (default = TRUE)
		#scale = do you want to divide by sdx, creating a zscore if center = TRUE (default is scale = TRUE)
		
	scale(dat$hours, center = TRUE, scale = FALSE)
	
	#again
	
	data.frame(byHand = dat$hours - mean(dat$hours), usingScaleFunction = scale(dat$hours, center = TRUE, scale = FALSE))
	
	#let's add a version of centered hours to the dat data frame
	
	dat$hoursC <- scale(dat$hours, center = TRUE, scale = FALSE)
	
	head(dat)
	
	#Regression with a centered X
	centeredFit <- lm(grade ~ hoursC, dat)
	
	summary(centeredFit)
	
	#How does this compare to raw score fit?
	summary(rawScoreFit)
	
	#what is the mean hours in our sample, again?
	mean(dat$hours)
	
	#Also, per the slides ...
	
	coef(centeredFit)["(Intercept)"] #predicted y-hat when xC = 0 = its mean ... and also ...
	mean(dat$grade)

#==========================#	
# Part II: Standardization #
#==========================#

#Two ways to get standardized coefficient interpretations ...

#*******************************************************#
# Option 1: Explicitly z-Score your Variables (x and y) #
#*******************************************************#

#The scale() function automatically z-scores a variable (vector) that is input to the function.

#The default arguments (as shown before) are center = TRUE and scale = TRUE

dat$zhours <- scale(dat$hours)
dat$zgrade <- scale(dat$grade)

#did it work?
round(mean(dat$zhours), 2)
round(sd(dat$zhours), 2)

zscoreFit <- lm(zgrade ~ zhours, data = dat)

summary(zscoreFit)
round(coef(zscoreFit), 2)

# Option 2: Multiply by SDx/SDy using the beta() function in the reghelper # package
#

#install.packages("reghelper") #To install the reghelper package, uncomment and run this code

#To load the reghelper library
library(reghelper)

#once this package is loaded, you may use any function from the reghelper package

#What functions are available in this package?

help(package = "reghelper")

?beta

reghelperBetaFit <- beta(rawScoreFit)

round(coef(zscoreFit), 2)

round(cor(dat$hours, dat$grade), 2)


SDy <- sd(dat$grade)
SDx <- sd(dat$hours)


Beta1 <- coef(zscoreFit)[2]

b1*(SDx/SDy)

############
# Plotting #
############

plot(x = dat$hours, y = dat$grade)
#Add regression line from the rawScoreFit object
abline(rawScoreFit)

#Prettier plot with optional arguments
plot(x = dat$hours, y = dat$grade, bty = "l", xlab = "Hours", font.axis = 2, cex.axis = 1.25, col.axis = "slategray4", ylab = "Grade", font.lab = 2, cex.lab = 1.5, col.lab = "royalblue", col = "slategray4", lwd = 2)
#Add regression line from the rawScoreFit object
abline(rawScoreFit, lwd = 3, col = "orangered3")

colors()
