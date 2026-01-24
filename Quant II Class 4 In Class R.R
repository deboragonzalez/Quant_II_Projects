#Quant II Class 3 In Class R Part I

#Today we will learn a number of important skills involving 
#reading-in and working with realistic datasets in R.

#To begin, we will read the file that is based on the in class example from the slides.

#Try running this function, as written:

file.choose()

# this gives us the path to the file we select

#Using the gui (graphical user interface) window that pops up,
#select the file hoursGradeData.csv

#This should produce a file path like this (note: below is a Mac version):

#/Your/File/Path/hoursGradeData.csv

#You can copy this path into the read.csv and put it in the file = argument of the function.

classData <- read.csv(file = "/Your/Directory/hoursGradeData.csv", header = TRUE)

# Integrating my local path
classData <- read.csv(file = "/Users/debig/Documents/PhD Y1/Stats II/Quant II Projects/hoursGradeData.csv", header = TRUE)

#Tim's file path:
classData <- read.csv(file = "/Users/thayes/Dropbox/Mac Documents/Quant II Spring 2025/Week by Week 2025 Post/Topic 3 Introduction to Bivariate Regression/3. In Class R/hoursGradeData.csv", header = TRUE)

	#Important Argument:
		#header =
			#if header = TRUE, indicates that your dataset has column names that are to be read in separate from the data (this is the default).
			#if header = FALSE, indicates that your dataset does NOT have column names, and therefore the first row of the
				#dataset should be read as data.

#Or you could NEST the file.choose() function inside the read.csv function

classData <- read.csv(file = file.choose(), header = T)

	#Because file.choose() returns the file path, putting this inside the read.csv function is 
	#the same as writing the path inside the function!

##Pros and Cons of writing the full file path vs. using read.csv(file = file.choose(), header = T)
	#If you write down the full file path and put it in the function, 
		#then the next time you run this R script you can easily read in your data 
		#without searching through your directories and folders.
		
		#However, if you move your file to a different folder in the future, 
		#you'll need to change the directory path in your R script.
		
	#file.choose() is very easy and user-friendly.
		#Using this method allows you to find your datafile 
		#even if you've moved it to a different folder.
		
		#However, it is slightly more effortful to go in and select your folder each time.

#read.csv() is a function for reading in .csv files.

#It is related to a broader function called read.table.

classData <- read.table(file = "/Your/Directory/hoursGradeData.csv", header = T, sep = ",")

	#The read.table function has a sep = argument
		#sep = 
			#If sep = "," this indicates a comma-separated (.csv) file
			#If sep = " " this indicates a tab-delimited ("white space" delimited) file, such as a .txt


#To learn a bit more about functions, let's learn how to access information about functions and retrieve help files in R:

#-------------------------------------------------------
#  Accessing Information about Objects and Functions 
#-------------------------------------------------------

# You can display information about the objects in your workspace, specific objects, and specific functions
# using the functions below:

################################################################
###### Displaying Information About Objects and Functions ######
################################################################


#==============#======================================#=====================#
#   Function   #           What it Does               # Example             #
#==============#======================================#=====================#
# ls()         # Displays objects in the workspace.   # ls()                #
#--------------#--------------------------------------#---------------------#
# str(object)  # Compactly Displays the structure of  # str(data.frame(     #
#              # an object.                           #  a = 1:10,          #
#              #                                      #  b = rep("a", 10))) #
#--------------#--------------------------------------#---------------------#
# ls.str()     # Compactly displays the structure of  # ls.str()            #
#              # objects in the workspace.            #                     #
#--------------#--------------------------------------#---------------------#
# functionName # Typing the function name and running # lm                  #
#              # the command returns the body of the  # IQR                 #
#              # function.                            #                     #
#--------------#--------------------------------------#---------------------#
# args()       # Display the function's arguments.    # args(lm)            #
#--------------#--------------------------------------#---------------------#

	ls() #lists objects we've created.
	
	str(classData) #display brief description of the basic structure of classData object.
	
	ls.str() #display brief description of the structure of objects in the workspace.
	
	#Now let's find information about a function.
	
	read.csv #this displays the code for the read.csv() function
	
	args(read.csv) #this displays the function's arguments.

########################
##### Getting Help #####
########################

#===============================#====================#==========================#========================#
#       Help Function           #     Shortcut       #      What it Does        #        Example         # 
#===============================#====================#==========================#========================#
# help.start()                  #                    # Brings up help index.    # help.start()           # 
#-------------------------------#--------------------#--------------------------#------------------------#
# help(exactFunctionName)       # ?exactFunctionName # Looks up help file       # ?mean                  #
#                               #                    # for specified function.  #                        #
#-------------------------------#--------------------#--------------------------#------------------------#
# help(,package="packageName")  #                    # If first argument is     # help(,package="psych") #
#                               #                    # unspecified, brings up   #                        #
#                               #                    # help table of contents   #                        #
#                               #                    # for specified library.   #                        #
#                               #                    #                          #                        #    
#                               #                    # If first argument is     # help(describe,         #
#                               #                    # specified, brings up     # package = "psych")     #
#                               #                    # help page for specified  #                        #
#                               #                    # function in specified    #                        #
#                               #                    # library.                 #                        #
#-------------------------------#--------------------#--------------------------#------------------------#
# help.search("searchTerm")     # ??'searchTerm'     # Searches help files for  # ??'describe'           #
#                               #                    # specified search term.   #                        #
#-------------------------------#--------------------#--------------------------#------------------------#
# apropos(what, where =FALSE)   #                    # Find subjects by         # apropos("lm")          #
# find(what, mode = "any")      #                    # (partial) name.          # find("sd")             #
#                               #                    # apropos returns all      #                        #
#                               #                    # functions matching       #                        #
#                               #                    # "what", whereas find     #                        #
#                               #                    # returns the package      #                        #
#                               #                    # where "what" is located. #                        #
#-------------------------------#--------------------#--------------------------#------------------------#
# example(function)             #                    # View demonstration/      # example(rnorm)         #
# demo(topic)                   #                    # examples of function,    # demo() #see list of    #
#                               #                    # or broad topic,          #         demo topics    #
#                               #                    # respectively.            # demo('recursion')      #
#-------------------------------#--------------------#--------------------------#------------------------#

###IF YOU KNOW WHAT YOU'RE LOOKING FOR?
	#("Is it 'mean' you're looking for?")
		
mean # tells us the structure of the function
help.start() #call index of R manuals.
help(mean) #help for the function mean
?mean     #shortcut for the same thing (can help with order of function elements)
mean.default #detailed function breakdown
##If you do NOT know what you're looking for

help.search("read.table") #search for search terms in quotes (will provide results on the web instead of internally in R)
??'read.table'  #shortcut for the same thing

#Can type in keywords and partial strings and retrieve a list of topics
??'read'  
??'csv'


#Searching within specific packages:

#Soon we will learn about installing and loading packages.
#Many functions we will use are from a package called reghelper.
#If we try to search for simple_slopes as a function 
#(which we will use for interactions soon)...

?simple_slopes
help(simple_slopes)

??"simple_slopes"

help( , package = "reghelper") #bring up table of contents for the lavaan package
help('simple_slopes', 'reghelper') #search for sem() function in package:lavaan 

apropos("mean") #find functions with "mean" in the name.
find("mean") #what package is the function mean located in? package:base.

##Viewing examples:

example(mean)
example(cor)


#Finally, demo() provides demonstrations for some select topics.

#Run demo() without arguments for a list:

demo()

#Run demo(, package = .packages(all.available = TRUE)) to list demos in all loaded packages

demo(, package = .packages(all.available = TRUE))

####

#### BACK TO THE TASK AT HAND ####

####

#... Which is learning about working with datasets in R.
#Most datasets, most of the time, are going to be saved as a type of object called a DATA FRAME.

#*******************
#*** DATA FRAMES ***
#*******************


	#We Will Discuss:
	
		#1. Defining Data Frames
		#2. Creating Data Frames
		#3. Subsetting and Replacement Functions for Data Frames
	
	#As well as some basic computations on data frames.

	#************************
	# Data Frame Definition
	#************************
	
		#Conceptually, a data frame is akin to a spreadsheet with rows representing observations
		#and columns representing variables.
		
		#Like many spreadsheet formats (e.g., SPSS, Excel), each column (variable) of a data frame
		#could contain data of a different mode (e.g., numeric, character, factor, etc.).
		
		#So, intuitively, a data frame is like a matrix with columns of potentially different data types.
		
		#According to the R Language manual: 
		
			#"A data frame is a list of vectors, factors, and or matrices 
			# all having the same length (number of rows in the case of matrices).
			
			#In addition, a data frame generally has a names attribute labeling the variables 
			#and a row.names attribute for labeling the cases." (R-core, 2011, p. 9).
		
		#According to the Introduction to R manual:
		
			#"A data frame is a list with class "data.frame".  (Venables et al., 2011, p. 29)
			
		#Finally, according to Chambers (2008): 
		
			# "A "data.frame" object is essentially a named list, 
			# with the elements of the list representing variables" (p. 168).
			
		
		#From these basic definitions, we can draw out some conclusions about data frames:
		
			#Data frames are LISTS of vectors, factors, and/or matrices all having the same length/number of rows.
			
			#We will learn about lists in R later. 
			
			#The most important things to understand are:
			
				#A data frame is constructed like a big (list) vector, where:
					#Each element of the vector is a column.
					#Each column is a vector of the same length.
					#Each column can contain a different type of data (numeric, character, factor).
		
	
	#***********************
	# CREATING DATA FRAMES
	#***********************
	
	#To fully understand data frames, let's create one from scratch.
	
	#Data frames, not surprisingly, can be created using the function data.frame.
	
	#Similar to lists, data frames can be constructed using:
	
		#data.frame(name1 = vector1, name2 = vector2, name3 = vector3, ...)
		
	#And, in fact, the arguments not not only be vectors (although they typically are).
	
	#Let's make an example.
	
	#Say we conduct an experiment where participants are exposed to a drug or a placebo and we measure some health outcome, Y.
	
 	Treatment <- factor(rep(c(1, 2), c(5, 5)), levels = c(1, 2), labels = c("Placebo", "Drug"))
	Outcome <- c(.3, .4, .2, .4, .1, .8, .6, .7, .5, .8)
	
	length(Treatment)
	length(Outcome)
	
	#Both objects have length 10, and therefore can be put in a data frame spreadsheet.
	
	myFrame <- data.frame(Treatment, Outcome)
	
	myFrame
	
	#Let's look at the attributes of this data frame:
	
	class(myFrame) #data.frame
	
	##################################
	### Data Frames and Dimensions ###
	##################################
	
	#Let's look at the structure of our data frame using the head() function:
	
	head(myFrame)
	#What does this do? Let's consult the help file.
	
	?head
	#This is returning the first part of the dataframe.
	#The n = argument tells R how many lines to return.
	
	head(myFrame, n = 4)
	
	#We can also examine the data frame's structure using str()
	
	str(myFrame)
	#This shows that one of our variables is a factor, and one is numeric.
	
	#vectors are 1-dimensional objects that have a length() but do not have dimensions (plural).
	#data frames (spreadsheets) are 2-dimensional objects
	
	#Dimensions can be assessed using the dim() function:
	
	dim(myFrame)
	#10 3
	
	#Data frames have 2 dimensions, like matrices.
		#The FIRST dimension is the number of ROWS.
		#The SECOND dimension is the number of COLUMNS.
		
	#You can also assess the number of rows and columns
	nrow(myFrame) #number of rows = 10
	ncol(myFrame) #number of cols = 2
	
	dimnames(myFrame)
	#[[1]]
	# [1] "1"  "2"  "3"  "4"  "5"  "6"  "7"  "8"  "9"  "10"

	#[[2]]
	#[1] "Treatment"  "Outcome"  
	
	#Data frames have dimnames!
	
	#What about names?
	#Data frames have rownames and colnames
	
	colnames(myFrame)
	#[1] "Treatment"    "Outcome" 
	
	rownames(myFrame)
	#[1] "1"  "2"  "3"  "4"  "5"  "6"  "7"  "8"  "9"  "10"
	
	#Note that this object has rownames by default
		
	#You can replace row and colnames, if you wish
	
	#colnames(myFrame) <- vectorOfColnames
	
	#Let's say that you wanted to call the first column name "Group" instead of "Treatment"
	
	colnames(myFrame) <- c("Group", "Outcome")
	colnames(myFrame)	
	#[1] "Group" "Outcome"
	
	#Let's change JUST the first element back:
	colnames(myFrame)[1] <- "Treatment"
	colnames(myFrame)
	#[1] "Treatment" "Outcome"
	
	#This is a finer point, but notice that R treats the column names as a vector.
	#So you can use what we know about vectors to index and replace elements.
	
			
	#***********************
	# SUBSETTING DATA FRAMES 
	#***********************
	
	#In week 1 we learned how to select elements in a vector.
	#E.g., vec[1] returns element 1.
	
	#This week, we will learn how to select rows and columns in a data frame spreadsheet.
	
	#You can think of this like "select cases" in SPSS. But perhaps even more flexible.
	
	#First, observe
	
	#We may subset a dataset in 3 ways
	
		#1. Numeric Index Vectors.
			#myFrame[rowNumbers,colNumbers]
			
			
		#2. Names.
			#Row and column Names using myFrame["rowName", "colName"]
			#Column indexing (or list indexing) using the recursive $ operator,
				#e.g, myFrame$Treatment
			
		#3. Logical Vectors
			#dFrame[logicalTest, logicalTest]
		
		
	#Here are some highlights:
	
	#recall what the dataset looks like:
	head(myFrame)
	
	##====================================
	## Calling Rows and Columns by Number
	##====================================
	
	myFrame[1,2] #element in first row, 2nd column
	myFrame[2,1] #element in 2nd row, 1st column
	
	#What if you want to display a row but not a column (or vice versa)?
	myFrame[1,] #first row
	myFrame[,2] #second column
		
	myFrame[,1:2] #first two columns
	
	##something to watch out for
	myFrame[1:2] #Works for columns, because data.frame is technically a list, which is a vector....

	
	myFrame[c(1,3,5),]
	
	# if we enter a single index, it will assume we are asking for columns
	
	##====================================
	## Calling Columns using Column Names
	##====================================
	
	#Much of the time, you will probably want to look at certain columns (variables) in your dataset
	#based on the names of the variables/columns.
	myFrame[, "Treatment"] #Treatment vector
	
	#With data frames (but NOT with matrices, which we'll learn later)
	#you can use the dollar sign $ as a shortcut
	#With the format:
	
	#dataFrame$VariableName
	
	#E.g.,
	myFrame$Treatment 
	
	#Of course, to use names you have to get them exactly right.
	
	myframe$Treatment
	
	#returns an error, because the F in myFrame needs to be capitalized.
	
	#Similarly"
	
	myFrame$treatment
	
	#returns NULL because there is no lower-case-t treatment variable. 
	
	#If you forget your column names, use:
	
	colnames(myFrame)
	
	#Where myFrame can be switched out for whatever you've named your dataframe.
	
	#Note that you can do the same thing with rownames
	
	rownames(myFrame)
	myFrame["1", ] #returns first row.
	
	#here this is not useful, but sometimes objects will have descriptive rownames that can be useful.
	
	##======================================================================
	## Calling Rows and Columns using Logical Vectors/Comparison Operators
	##======================================================================
	
	#Logical
	
	myFrame$Treatment == "Drug" #produces vector of T/F values.
	
	myFrame[myFrame$Treatment == "Drug",] #note use of $ here. 
	
	myFrame[myFrame$Treatment == "Drug" & myFrame$Outcome > .6, ]	
	

##=============================================================================
## But What If I Really, Really Want To Look at My Data In Spreadsheet Form???
##=============================================================================
	
	#Two options:
		#1. Go back and look at the .csv file, outside of R.
		#2. Use the fix() function.
		
		fix(myFrame)
		#Note: to use the R windows, you'll need to click ('x') out of the the spreadsheet window to close it.
	
##=============================================================================
## apply(), rowMeans, colMeans, rowSums, and colSums
##=============================================================================

	#Before we stop, let's learn some very useful functions.
	
	#apply(x, MARGIN, FUN) 
		#applies a function to the MARGIN (rows or columns) of an object, x
		#Arguments
			#x = a data frame or matrix.
			#MARGIN = either 1 for rows, or 2 for columns
			#FUN = some function to apply.
	
	#Recall  that classData consists only of numeric variables.
	
	apply(classData, 2, mean)
		#2 = columns
		#this returns the mean of each column of classData
	
	apply(classData, 1, mean)
		#1 = rows
		#this returns the mean of each row
	
	#You can apply different functions.
	
	apply(classData, 2, max)
		#max value of each column
	
	apply(classData, 2, sd)
		#sd of each column
	
	apply(classData, 1, sum)
		#sum of each row.
	
	#for means and sums, there are the shortcut functions:
	
	rowMeans(classData) #row means
	colMeans(classData) #column means
	rowSums(classData) #row sums
	colSums(classData) #column sums

#==========================================================
# A Quick Note About Covariance and Correlation *Matrices*
#==========================================================
	
	#The cov() and cor() functions will act EITHER on:
		#(A) Two variables, x and y
		
		cor(classData$hours, classData$grade)
		#returns vector of length 1 with single number, representing the correlation between these variables.
		
		#(B) A data frame or matrix with ALL COLUMNS being numeric variables. 
	
		cor(classData)
		#returns a correlation matrix containing bivariate correlations among all variables in the dataset.
	
		#cov() functions the same, e.g.,
		cov(classData$hours, classData$grade)
		cov(classData)
		
		#Let us save the correlation matrix and examine it.
		
		corMat <- cor(classData)
		corMat
		#          hours     grade
		#hours 1.0000000 0.3051692
		#grade 0.3051692 1.0000000
		
		#What type of R object is this?
		
		class(corMat)
		
		#"matrix" "array"
		
		#This correlation matrix is ... a MATRIX. 
		
		#Matrices are special types of objects in R.
		#For our purposes, matrix objects function very similarly to data frames.
		
		#Both matrices and dataframes are 2 dimensional tables with rows and columns, 
		#indexed with a row and column place
			#e.g., matrix[rowNum, colNum]
			
		#HOWEVER, the dollar sign operator $ does not work with matrices.
		
		corMat$hours
		#Error in corMat$hours : $ operator is invalid for atomic vectors
		
		#Another KEY DIFFERENCE between matrices and data frames is that
			#data frames can contain columns of different data types (e.g., factor variables, numeric variables, character variables)
			
			#matrices must contain only one type of data.
				#Most prototypically, a matrix is all numbers (to facilitate matrix algebra operations that you'll learn next semester).
				
				#But matrices can also contain all character data, and in some cases, all logical data.
				
					#e.g., resulting from a logical test
					corMat < 1
		
		#We will PRIMARILY be interacting with data frames when we read in our datasets in R, but it is worth knowing that matrix objects exists and that some R functions return matrices.
		
		#When working with a matrix object, all types of subsetting EXCEPT for the $ operator will work.
		
		#E.g.,
		
		corMat[1,]
		corMat[,2]
		
		corMat["hours","grade"]
		
		#Additionally, it is worth knowing FOUR FUNCTIONS for creating matrices, in case you ever want two.
		
		#1. The matrix(x, nrow, ncol, byrow = FALSE ...) function will turn a vector into a matrix with nrow rows and ncol columns.
			vec <- 1:8
			matrix(vec, nrow = 2, ncol = 4, byrow = FALSE)
			
			#byrow = TRUE will make the numbers go in order by ROW (not column)
			matrix(vec, nrow = 2, ncol = 4, byrow = TRUE)
			
		
		#2. as.matrix() will convert another object into a matrix.
			
			classData_mat <- as.matrix(classData)
			class(classData_mat)
			classData_mat$hours #nope
			classData_mat[,"hours"] #works
			
		#3. The rbind() and cbind() functions will create a matrics by binding vectors together as either ROWS or COLUMNS.
			
			vec1 <- 1:4
			vec2 <- 5:8
			
			rbind(vec1, vec2)
			cbind(vec1, vec2)
			
			#note, you can name the rows or columns by adding name = 
			
			cbind(column1 = vec1, column2 = vec2)
			cbind(hours = vec1, grade = vec2)
			
	###########################
	### Summary Data Frames ###
	###########################
	
	#What did we learn?
	
		#1. Definition of Data Frame: a list of equal-lengthed vectors and factors in an observation by variable table (spreadsheet) format.
		#2. Creating data frames: data.frame(name1 = vector1, name2 = vector2, ...)
		#3. Indexing data frames: dataframe[i,j], dataframe$ColumnName...

	
	#Main Take-homes:
		#Each column of a data frame is a vector of the same length.
		#Each column can contain data of a different type (factor, numeric, etc)
		#Data frames have 2 dimensions, that can be accessed using:
			#dim(x)
			#nrow(x)
			#ncol(x)
				#where x = the name of your data frame.
		#When subsetting a data frame, remember the format:
			#myDF[row, col]
		#And subscript in any of the three main ways:
			#1. Using row numbers or col numbers.
			#2. Using rownames or colnames.
			#3. Using logical vectors returned by some comparison operator.
				#e.g., myDF[myDF$Outcome < 5, ]
		