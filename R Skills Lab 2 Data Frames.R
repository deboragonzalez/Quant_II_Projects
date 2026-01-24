#R Skills Lab 2 Data Frames

##Answer the following questions as best you can. 
##For most answers, write your CODE as the answer,
##unless the question asks for a conceptual/verbal response
##(e.g., "what does this output mean?" or "What does this result tell you?") 

#1. Read in the lab data using one of the techniques shown in class and 
	#save this as an object called labData.
	
	#This dataset contains three variables in a fictional study of PhD student motivation vs. burnout. See the accompanying data description word doc in the 2. HW file on Dropbox.

labData <- read.csv(file = "/Your/File/Path/academicMotivation.csv", header = T)

	#but change the file path to your own directory, using file.choose()
	#or writing the path.

#2. Examine this data frame using the head() function. (Put your code below - not a trick question).


#3. Now use the n = argument of head() to display the first 10 lines of the labData dataframe.
	
	
#4. Use the str() function to examine the structure of labData. 
		
		
	#(a) What does it say on the first line, about the type of object, number of observations, and number of variables? 
	
	
#5. Use the colnames() function to display the column names of the labData object.
	
	
#6. Using the numeric index method, return: 
	#(a) The element in the 4th row and 3rd column of labData
		 
	#(b) Just the first ROW of labData.
		 
	#(c) Just the first COLUMN of labData.
		 
	#(d) Rows 1, 2, and 5.
		 
	#(c) Columns 1 and 3.
		 
#6. Display the hrs variable using the dollar sign method (dataFrame$VariableName).
		
#7. What is the mean of this variable? (Hint: mean(dataFrame$VariableName))?
	
	
#8. What is the standard deviation?
	
	
#9. Use the c("variableName1", "variableName2" ...) method to display the columns corresponding to
	#advisorSupport and academicMotivation.
	
	
#10. Use the cov() function to display a covariance matrix for the variables in question 9.
	
	 
#11. Since every variable in labData is numeric (use str() again if you want to check this),
	#it is possible to use cor() to obtain the correlation matrix of all of the variables.
	#Use cor() to obtain the correlation matrix of the entire labData dataframe.
	#Save this object as labDataCors.
	
	
#12. Use the dim() function to return the dimensions of this dataset.
	
	#(a) How many rows are there? (Write your answer as a comment).
	
		 
	#(b) How many columns are there? (Write your answer as a comment).
	
		 
#13 Cross-verify this by using:
	#(a) nrow() to see how many rows labData has.
	
		 
	#(b) ncol() to see how many cols labData has.
	

#14. Using apply, find the standard deviations of each COLUMN of labData.


#15. Using the colMeans() function, find the column means of labData.


#16. Using apply() find the column means of labData (replicate the result from 15).
	
#17. Based on the discussion of matrix objects at the end of the in-class R demonstration, what are TWO differences between a matrix and a dataframe in R:
