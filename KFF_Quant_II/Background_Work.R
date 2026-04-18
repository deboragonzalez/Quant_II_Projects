library(haven)

# Identifying my first data file
file.choose()
# [1] "/Users/debig/Downloads/KFF Data for JAGS (2.19.26).sav"

# Converting from sav to csv
kff_data <- read_sav("/Users/debig/Downloads/KFF Data for JAGS (2.19.26).sav")
write.csv(kff_data, "/Users/debig/Downloads/KFF Data for JAGS (2.19.26).csv")
  
# Identifying the weekly data file
file.choose()
  # [1] "/Users/debig/Downloads/KFF Weekly Therapist Session Summary data (LONG) abridged for grad students 3.7.26.sav"

# Importing sav file
kff_data_weekly <- read_sav("/Users/debig/Downloads/KFF Weekly Therapist Session Summary data (LONG) abridged for grad students 3.7.26.sav")
# Writing csv
write.csv(kff_data_weekly, "/Users/debig/Downloads/KFF Data for JAGS_weekly_3.7.26.csv")


# Variables of interest:

Flexibility
  # In KFF Data Weekly we have:
    # Sess_Fit 
    # Sess_Tail
# Both of which constitute our key flexibility variables. These are in long format.

Key Predictors of Flexibility
# Baseline Anxiety
# Behavior Problems

Demographics
# Race/Ethinicity: Need to make race variable based on several variables in kff_data
# Age
# Gender

Caregiver related variables (in KFF_data)
# Caregiver education --> Educ_C (number of years) or Educ3_C (3 categories) --> could use college completed vs not
# Caregiver complexity --> composite of caregiver depression score, anxiety score, stress level score, and overprotection score.
  Add variable names here to create composite of caregiver complexity from kff_data
# Each component will first be standardized and then averaged. 
# Higher values indicate greater caregiver clinical complexity. 
# Thus, a one-unit increase reflects a one-standard-deviation increase in caregiver clinical complexity across these four indicators.

  
Other potential controls/predictors of flexibility need at baseline
# Youth non-anxiety disorders at baseline (>1) --> DxMH_Any_non_Anx_C_B OR DxMH_Tot_non_Anx_C_B - SCRATCH
# Consider adding ACEs score at baseline as a predictor of flexibility need. --> look into the 4 or more cutoff and look at the model continuous vs. binary


Outcomes
# controls could include: 
  # b_3 (BaselineAnxiety_i)+b_4 (BehaviorProblems_i)+b_5 (CaregiverComplexity_i)+b_6 (Age_i)+b_7 (Gender_i)+b_8 (CaregiverEducation_i)
  # Potentially also ACEs total score and non-anxiety diagnosis

# Post Anxiety OR Anxiety Slope

# Caregiver Satisfaction at post

# Youth Satisfaction at post


# Dummy code Region (4-1) -- site1, site2, and site3 OR figure out how to make a categorical variable and have the model treat it as such, Language of Care (binary), youth age group (binary) AgeGrp0, Youth gender (cis male or not), Household Resource Insecurity (dichotomous)-- InsecurityStatusPool