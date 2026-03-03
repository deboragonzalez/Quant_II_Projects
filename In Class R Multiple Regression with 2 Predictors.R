####################################################
# In Class R Multiple Regression with 2 Predictors #
####################################################

#Read in data (Change file path to the path on your computer)
dat <- read.csv("/Users/thayes/Dropbox/Mac Documents/Quant II Spring 2022/Week By Week/Week 6/Week 6 Post/2. In Class Example Data Smoking Attitudes/smokeData.csv")

#Examine the data:
head(dat)

# Risk-seeking:
	# 1 = risk averse (25%)
	# 2 = risk neutral (50%)
	# 3 = risk seeking (25%)

# Perceptions of Peer Norms (2 items)

	#Item 1: PeerSmoking
		#5 = Almost all of my friends smoke (5%)
		#4 = more of my friends are smokers than do non-smokers (10%)
		#3 = equal number of smokers and non-smokers (15%)
		#2 = more of my friends are non-smokers than smokers (20%)
		#1 = none of my friends smoke (50%)
				
	#Item 2: Peer Approval of Smoking
		#My closest friends:
		# 5 = Strongly Approve of Smoking (.05)
		# 4 = Somewhat Approve of Smoking (.15)
		# 3 = Neither Approve nor Disapprove of Smoking (.25)
		# 2 = Somewhat Disapprove of Smoking (.30)
		# 1 = Strongly Disapprove (.25)


#smoking Attitudes
	#3 = strongly approve of smoking/smoking is extremely cool
	#2 = somewhat approve of smoking/smoking is somewhat cool
	#1 = slightly approve of smoking/smoking is slightly cool
	#0 = neither approve nor disapprove of smoking/smoking is neither cool nor uncool
	#-1 = slightly disapprove of smoking/smoking is slightly uncool
	#-2 = somewhat disapprove of smoking/smoking is somewhat uncool
	#-3 = strongly disapprove of smoking/smoking is extremely uncool

#########################
# Brief Data Management #
#########################
	
#First, we need to average peerSmoke and peerApprove to form the peer norms variable. We can do this in either of 2 ways.

#Option 1:
(dat$peerSmoke + dat$peerApprove)/2

#Option 2:
rowMeans(dat[,c("peerSmoke", "peerApprove")])

#Let's use option 2.

dat$peerNorms <- rowMeans(dat[,c("peerSmoke", "peerApprove")])

############
# Analyses #
############

#We can easily add additional predictors to lm() by separating them with plus signs.

#E.g., y ~ x1 + x2 + x3 + ... 
fit1 <- lm(smokeAtts ~ risk + peerNorms, dat)
summary(fit1) 

#            Estimate Std. Error t value Pr(>|t|)    
#(Intercept) -2.11898    0.30441  -6.961  4.9e-11 ***
#risk         0.40094    0.14716   2.724  0.00702 ** 
#peerNorms    0.56346    0.09701   5.808  2.5e-08 ***

#Interpretations:
	#Intercept: the predicted y value when risk and peerNorms equals zero is -2.11 (close to 'moderately disapprove' of smoking/'smoking is moderately uncool'). But ... no zero value exists for risk or peerNorms.
	
	#b1 (risk coefficient): A unit increase in risk predicts a .4-unit (40% of 1 likert-type scale point) increase in smoking attitudes, holding peer norms constant (partialling out shared variance with peer norms).
	
	#b2 (peerNorms coefficient): A unit increase in peerNorms predicts a .56-unit (56% of 1 likert-type scale point) increase in smoking attitudes, holding risk constant (partialling out shared variance with risk).

#==================================
# Analysis 2: Centered Predictors 
#==================================

#Let's center our predictor variables to give our intercept a more meaningful value.

dat$riskC <- scale(dat$risk, center = TRUE, scale = FALSE)
dat$peerNormsC <- scale(dat$peerNorms, center = TRUE, scale = FALSE)

fit2 <- lm(smokeAtts ~ riskC + peerNormsC, dat)
summary(fit2)

#(Intercept) -0.09500
	#The predicted smoking attitude for individuals with average attitudes toward risk and average peer influences is -0.095. This value is close to zero, indicating 'neither favorable nor unfavorable toward smoking".
	
	
#=======================================
# Analysis 3: Standardized Coefficients 
#=======================================

#Let's obtain standardized coefficients using the beta() function from the reghelper package.

library("reghelper")

beta(fit1) #Great ... but that scientific notation. Ugh. 

round(coef(beta(fit1)), 2)

#            Estimate Std. Error t value Pr(>|t|)
#(Intercept)     0.00       0.06    0.00     1.00
#risk.z          0.18       0.07    2.72     0.01
#peerNorms.z     0.39       0.07    5.81     0.00

#Interpretations:
	#beta1 (risk): a 1-standard deviation increase in attitudes toward risk predicts an 18% of 1-standard deviation increase in attitudes toward smoking, holding peer norms constant.
	
	#beta2 (peerNorms): a 1-standard deviation increase in peer norms predicts an 39% of 1-standard deviation increase in attitudes toward smoking, holding risk attitudes constant.

#Just to double check that the usual tricks work ...

sdy <- sd(dat$smokeAtts)
sdx1 <- sd(dat$risk)
sdx2 <- sd(dat$peerNorms)

beta1 <- coef(fit1)["risk"]*(sdx1/sdy)
beta2 <- coef(fit1)["peerNorms"]*(sdx2/sdy)

round(beta1, 2); round(beta2, 2) #It is the same!

## Challenge Question In Class (Time Permitting):
#Is there another way you can think of to give these predictors a meaningful zero point?


dat$riskRecode <- dat$risk - 2

fit3 <- lm(smokeAtts ~ riskRecode + peerNormsC, dat)
summary(fit3)
