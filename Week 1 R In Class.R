#######################
### Week 1: Vectors ###
#######################

#I am a comment, indicated by a number sign (/pound sign/hashtag).

#-----------------------
# 1. R as a calculator
#-----------------------


#In many ways, R is just a fancy calculator ...

2 + 3

	#To run this command ON A MAC, highlight it and press COMMAND+ENTER.
   
   #ON A PC, press CTRL+R. NOTE: On PC in R Studio, you would press CTRL + ENTER.

#In R, you can perform:

2 + 1 #addition
7 - 3 #subtraction
2 * 4 #multiplication
8 / 2   #division

#You can also work with exponents:

4^2 #4 to the 2nd power
4**2 #same thing

#Square Roots:

sqrt(16)

#And perform a variety of other operations.

#Here's a helpful table:

############################################
########### Arithmetic Operators ###########
############################################


#===========#==================#===========#
# Operator  #   Meaning        # Example   #
#===========#==================#===========#
#    +      #   Addition       # 2 + 2     #
#-----------#------------------#-----------#
#    -      #   Subtraction    # 5 - 3     #
#-----------#------------------#-----------#
#    *      # Multiplication   # 3 * 4     #
#-----------#------------------#-----------#
#    /      #   Division       # 12 / 3    #
#-----------#------------------#-----------#
#  ^ or **  #    Power         # 3^3; 2**4 #
#-----------#------------------#-----------#
#  sqrt()   #   square root    # sqrt(16)  #
#-----------#------------------#-----------#
#  abs()    # absolute value   # abs(-5)   #
#-----------#------------------#-----------#

#Like any calculator, order of operations counts in R:
   
   3*6+5/4
   (3*6)+(5/4) #same

   3*(6+5)/4   #different
   3*((6+5)/4) #same as above

#Remember PEMDAS?
#(Parentheses, Exponents, Multiplication, Division, Addition, Subtraction)

#------------------------------------------------
# 2. Assigning Objects and Basic Data Entry
#------------------------------------------------

	#Run these commands:

	a <- 3   # <- assigns a value to a name on the right.
	b = 4    # =  also assigns a value to a name on the right;
	
	#These lines have assigned the numbers 3 and 6 to the labels a and b, respectively.
	
	#Now try running these lines, which simply disply the contents of a and b.
	
	a
	b
	
	#Now try running these lines, to call A and B:
	
	A
	B
	
	#Returns:
		#Error: object 'A' not found
		#Error: object 'B' not found
	
	#Why?
		#Because R is caSE-seNSitivE
	
	
	#We can perform the same operations on a and b as above:
	
	a + b
	
	a #a is unchanged. To change a, we would have to assign a <- a + b.
	
	a * b	
	a^b
	
	#Etc.
	
	#We can also assign more than one number to a label, to form a numeric vector.
	
	#This is accomplished with the c() function, which concatenates a string of values separated by commas.

	vec <- c(1, 3, 5, 7, 9)
	vec
	
	vec2 <- c(2, 4, 6, 8, 10)
	vec2
	
	#You can similarly perform mathematical operations on these vectors. 
	
	#Here are some basic ones:
	
	vec + vec2 #vector addition
	
	vec*2 #scalar multiplication. 
	vec*a #scalar multiplication. 
	
	#ELEMENTWISE multiplication:
	
	vec*vec2
	
	#ELEMENTWISE division:
	
	vec/vec2
	
	#********************		    
	#Length of a vector:
	#********************
	
	#How long are vec and vec2? 
	#The length() function will tell us.
	
	length(vec)
	length(vec2)
	
	#5

	#***********************************************		    
	#A simple way to generate consecutive integers:
	#***********************************************
	
		#use the colon(:) between the first and last
		#consecutive number in a sequence:
		
			#That is, from:to format
			
				#Ex:
				
				1:10
				
				#This is the same as:
				
				c(1, 2, 3, 4, 5, 6, 7, 8, 9, 10)
				
				#And also the same as:
				
				seq(from = 1, to = 10, by =1) #see next section
				
				#But much more compact.
				
				#Sequences generated using from:to must be integers.
				
				#E.g., this won't work:
				
				(.1):(.9)
				
				#However, you can go from negative to positive using from:to
				
				#Ex:
				-5:5
				
				#Note: This has implications for negation:
				
				-1:4
				
				#and
				
				-(1:4)
				
				#Are quite different...
	
	
	#********************************************
	#Another Way to Create sequences of numbers:
	#********************************************
	
		#The seq() function allows us to create sequences of numbers.
		
		#Here's another way to generate the vector c(1,3,5,7,9)
		
		seq(from = 1, to = 9, by = 2)
		
		#Note that seq is a function. 
		#This is indicated by paranetheses.
		
		#The function's first three arguments are from, by, and to.
		
		#Function arguments are separated by commas and indicated by argument names.
		
		#There are two ways to set a function's arguments in a function call:
		
			#1. Supply values for function arguments in the correct 
			    #POSITION in the function, with or without including the argument names: 
			
				#In this case the positions are seq(from, to, by).
				#That is, the three argument slots, separated by commas,
				#indicate where the sequence begins, where it ends, 
				#and the increment of the sequence.
				
				#So we could omit the names in the previous code 
				#and generate the same result:
				
				seq(1, 9, 2)
				
			#2. Supply the argument names and function values, separated by commas,
			    #in any position (regardless of the original argument order).
			    
			    seq(by=2, from=1, to = 9)
			    
			    #This generates the same result.
			    
			    #However:
			    
			    seq(2, 1, 9)
			    
			    #Generates an error message.
			    
			    #Note: sequences to not have to be integers:
			    
			    seq(.1, .9, .1)
			    seq(from = .1, to = .9, by = .1)
	
	
	#*****************************
	#Repeating numbers with rep()
	#*****************************
	
		#The rep(x, times) function has two arguments:
		
			#x is the scalar or vector to be repeated.
			#times is the number of times to repeat.
			
			rep(x=2, times=4)
			rep(2, 4)
			rep(4, 2)
			rep(times=4, x=2)
			
		#x and times can each (or both) be vectors, too..
		
			rep(c(2, 4), 4)
			rep(c(2, 4), each = 4) # Shows each element 4 times instead of each verctor 4 times like the above.
			rep(c(2, 4), c(3, 5))
			rep(4:1, 1:4)
	
		#In R, you can nest functions within functions. One useful, basic example of this concept
		#is that you can concatenate any of these simple data generation functions using the c() function
	
			c(rep(2, 4), seq(1, 9, 2), 30:40)
	
	#Removing an object from the workspace:
	
		#You can remove objects using the function (rm)
		
		#For example: remember the object a that we created earlier?
		
		a
		
		#let's remove it:
		
		rm(a)
		
		#Now try to call a:
		
		a
		
		#Error: object 'a' not found.
		
	#*****************************
	#Unique elements of a vector
	#*****************************
	
	#Sometimes, it is useful to find the unique elements of a vector.
	#e.g.,
	
	repVec <- rep(c(2, 4), 4)
	repVec
	
	unique(repVec)
	#only displays unique elements.
	
#***************
#*** VECTORS ***
#***************

	#*****************
	#Defining Vectors
	#*****************
	
	#We've been working with vectors this whole time ... let's define them!
	
	#A vector in R is a one dimensional object consisting of n elements.
	
	#A special case is a scalar, when n = 1. This is actually still considered a vector in R.
	
	is.vector(1) #TRUE
	
	#EVERYTHING IN R IS A VECTOR.
	
#Outline:

	#1. Vectors
		#a. Numeric
		#b. Character
		#c. Factor
		#d. Logical
		
		#Indexing and Replacement of Vector Elements

	#*****************
	# Numeric Vectors
	#*****************
	
	#We've been working with numeric vectors all along.
	
	#Some useful basic functions.
	
		#Here are a few useful basic functions that work on numerical vectors:
	
		#vector for examples
		myvec <- rep(c(1,2,3,4,5), c(2,4,6,3,2))
		myvec
	
		sum(myvec)   #take the sum of all elements
		mean(myvec)  #take the mean
		sd(myvec)    #take the standard deviation
		var(myvec)   #variance
		max(myvec)   #max value
		min(myvec)   #min value
		range(myvec) #range

	#*******************
	# Character Vectors
	#*******************
	
	#From the R Language documentation (R-Core, 2011, p.3):
	
		#"String vectors have mode and storage "character". 
		# A single element of a character vector is often referred to as a character string."
	
	#You can create a character vector using c() just as you can a numeric vector.
	
	#The character strings (elements) are in quotes "" or apostrophes '' and are separated by commas.
	
	stringvec <- c("Nick", "Jess", "Schmidt", "Cece", "Winston", "Coach")
	
	mode(stringvec) #"character"
	
	#You can coerce a vector to character using as.character()
	
	as.character(1:10)
	
	#Note the quotes around the numbers.
	
	#String manipulation could be a whole workshop, in and of itself.
	#For our purposes, here are some fundamental and useful functions 
	#for manipulating character data:
		

	#*********
	# FACTORS 
	#*********
	
	#In experimental psychology, factors (in an ANOVA, say) are used to break an experiment into 
	#discrete conditions.
	
		#Maybe some people get a drug, whereas others get a placebo.
		
		#In the data, people would be categorized as "Drug" or "Placebo".
		
		#The vector may look like this, for 10 people:
		
		drugVec <- rep(c("drug", "placebo"), c(5,5))
		drugVec
		
	 	class(drugVec) #class of the object?
		
		#However, the vector we just created is simply "character", and does not capture the strucure
		#of the data, in which people get one of two different levels of the factor.
	
	#In R, factors are vectors that have their own special class, "factor"
	#and an attribute, levels() that indicates the levels of the factor.
	
	#You can create a factor variable with the factor() command:
	
	drugVec <- factor(rep(c("drug", "placebo"), c(5,5)))
	drugVec
	#note the Levels: drug, placebo attribute
	
	#this can be accessed using:
	
	levels(drugVec)
	
	#The class of this object?
	
	class(drugVec) #factor.
	
	#Now, let's look a little more closely at the structure of this factor variable:
	
	str(drugVec) #structure
	
	#Returns:
	
		#Factor w/ 2 levels "drug","placebo": 1 1 1 1 1 2 2 2 2 2
	
	#What are these 1s and 2s? 
	
	#This gives a clue to the structure of factor variables in R.
	
	#Another clue can be found by using the unclass() function to remove the factor class attribute from the object:
	
	unclass(drugVec)

		# [1] 1 1 1 1 1 2 2 2 2 2
		#attr(,"levels")
		#[1] "drug"    "placebo"
	
	#What this shows is that factors are COMPOUND OBJECTS with labels attached to numbers, 
	#each corresponding to the levels of the factor.
	
	#This can be important to know when factors are merely numbers.
	
	#Note that with character vectors, coercion to numeric can be simple:
	
	numChar <- as.character(c(1, 3, 5, 3, 5, 5, 3, 1, 1))
	
	numChar
	as.numeric(numChar)
	#[1] 1 3 5 3 5 5 3 1 1

	#But with factors, this is not so:
	
	numFac <- factor(c(1, 3, 5, 3, 5, 5, 3, 1, 1))
	
	numFac
	levels(numFac) #"1" "3" "5"
	as.numeric(numFac)
	#This returns [1] 1 2 3 2 3 3 2 1 1
	
	#This is because the 1, 3, and 5 of the factor variable are not
	#merely character representations of the numbers 1, 3, and 5.
	
	#Instead, they are labels attached to the levels of the factor.
	
	#(Like value labels in SPSS, for those who are familiar).
	
	#This notion of levels as labels for ordered numbers is even more important when factors are ordered:
	
	# Use this: 
	as.numeric(as.character(numFac))
	# This keeps the original characters now as numbers instead of the underlying factor coding.

	#*******************
	# LOGICAL VECTORS
	#*******************
	
	#In the preceding examples, we have occasionally performed a test that generated a true or false answer.
	
	#In R, TRUE and T indicate true, and FALSE and F indicate false.
	
	#For example,
	
	TRUE
	T
	FALSE
	F
	
	logicalVec <- rep(c(TRUE,FALSE), c(5, 5))
	
	logicalVec
	
	#This vector consists of TRUE and FALSE values.
	
	mode(logicalVec) #"logical"
	
	#Although once in a great while there might be some occasion to create a logical vector in this way,
	#more often logical vectors are RETURNED after you have applied some test.
	
	#To quote the Intro R manual (Venables, Smith, & R-Core, 2011, p. 9): 
	
		#"Logical vectors are created by CONDITIONS."
		 
		 #(emphasis changed from italics in orig.)
	
	#Two sets of operators allow us to test conditions and return logical vectors.
	
		# 1. Comparison Operators allow us to perform comparisons and return T or F values.
		
		# 2. (Boolean) Logical Operators allow us to combine vectors in various ways when submitting them to such a comparison.
	

############################################
########### Comparison Operators ###########
############################################


#=============#==================#==============#
# Operator    #   Meaning        #   Example    #
#=============#==================#==============#
#     >       #   Greater Than   # 4 > 3        #
#-------------#------------------#--------------#
#     <       #   Less Than      # 5 < 10       #
#-------------#------------------#--------------#
#    >=       # Greater Than or  # 1:12 >= 2    #
#             #   Equal To       #              #
#-------------#------------------#--------------#
#    <=       #   Less Than or   # 1:10 <= 1    #
#             #   Equal To       #              #
#-------------#------------------#--------------#
#    ==       #  Exactly Equals  # 2 == 2       #
#-------------#------------------#--------------#
#    !=       #  Does Not Equal  # 2 != 4       #
#-------------#------------------#--------------#

	#Here are some basic examples:
	
	myvec < 5
	
	vec == 3
	
	1:10 <=5
	
	1:10 != 3
	
	
#As stated, you can also use logical operators to combine vectors in various ways in logical tests:

############################################
########### Logical  Operators #############
############################################


#===========#===================#==================#
# Operator  #      Meaning      #      Example     #
#===========#===================#==================#
#    &      #       And         # 1:3 >2 & 7:9 >8  #
#-----------#-------------------#------------------#
#    |      #       Or          # 1:3 >1 | 7:9 >8  #
#-----------#-------------------#------------------#
#    !      #       Not         #       !TRUE      #
#-----------#-------------------#------------------#


	#For vectors:

	vec < 5 & vec2 < 5  #'AND'

	vec == 5 & vec2 == 5

	vec  == 5 | vec2 == 5 #'OR'

	#Single arguments:

	a <- 5
	b <- 10

	a  == 5 && b == 5  #'AND'
	a == 10 || b == 10 #'OR'



	#*********************************************************************
	# INDEXING AND REPLACEMENT OF VECTOR ELEMENTS AND DATA MANIPULATION 
	#*********************************************************************
	
	#This is one of the most important sections of this entire tutorial.
	#Master its contents, and the related sections for each object below,
	#and you will be able to use R with facility and nuance where many beginners
	#mights struggle.
	
	#The basic forms of extraction and replacement of vector elements, respectively, are (Chambers, 2008):
	
	#x[i]
	#x[i] <- y
	
	#Recall our string vector:
	
	stringvec <- c("Nick", "Jess", "Schmidt", "Cece", "Winston", "Coach")

	#Using braces, you can select any element of the vector:
	
	stringvec[1]
	stringvec[3]
	
	#You can also replace an element:
	
	stringvec[1] <- "Tran"
	
	stringvec[1]
	
	#Or change it back

	stringvec[1] <- "Nick"	
	
	
	#-----------------------------------------
	# Formal Rules for Indexing Objects in R
	#-----------------------------------------
	
	#There are many clever ways to index and retrieve subsets of objects in R, as we shall see,
	#but all of them boil down to 3 formal rules.
	
	#Vectors can be indexed:
	
		#1. By supplying a vector of integers indicating the number(s) of the elements/rows/columns to be subsetted.
		
			#a. A vector of POSITIVE INTEGERS indicates the elements to be selected.
			
			#b. A vector of NEGATIVE INTEGERS indicates the elements NOT to be selected (to be removed).
		
		#2. By supplying a character vector indicating the names() of the elements/rows/columns to be selected.
			#(row/colnames for table objects).
		
		#3. By supplying a logical vector of TRUE and FALSE (T and F) of the same length as the vector or dimension to be subsetted. 
			#In this case, elements flagged as TRUE will be selected and those flagged as FALSE will be omitted.
			
			#COROLLARY: A vector may be indexed in any of these three ways
			#OR BY SUPPLYING AS AN INDEX ANY OBJECT OR OPERATION THAT RETURNS ONE OF THESE THREE THINGS.
			
		#Let us demonstrate each of these things in turn:

		################
		### EXAMPLES ###
		################

		#1a. Positive integers indicating element numbers.
		
			stringvec[c(1,3,5)] #Returns 1st, 3rd, and 5th elements
		
		#1b. Negative integers indicating element numbers to be omitted:
		
			stringvec[-c(2,4,6)]
			
			#Note that this is because
			
			-c(2,4,6)
			
			#Negates all three numbers.
			
			#Also note that:
			
			stringvec[c(1,-2,3)]
			
			#Returns an error.
			
				#this is because selecting certain (positive) numbers already implies omitting others, so the negative integer
				#is confusing and redundant.
			
		#2. Character vector corresponding to element names.
		
			#Let's give our object some names:
			
			names(stringvec) <- paste("Friend", 1:length(stringvec), sep="")
			stringvec
			
			stringvec["Friend1"]
			stringvec[c("Friend3","Friend5")]
			stringvec[paste("Friend", c(1, 2, 5), sep="")]
			
		#3.	Logical Vector:
		
			#Let's say we want to select "Nick", "Schmidt", "Winston", and "Coach".
			
			stringvec[c(T, F, T, F, T, T)]
			
			#Now let's create a vector that stores each character's gender identification:
			
			genderID <- factor(c(1, 2, 1, 2, 1, 1), levels = c(1,2), labels = c("Male", "Female"))
			
			#Now we can select "Nick", "Schmidt", "Winston", and "Coach" by simply entering:
			
			stringvec[genderID == "Male"]
			
			#Or we could select Jess and Cece using:
			
			stringvec[genderID == "Female"]
			
			#We could get even more creative ...
			
			stringvec[(genderID == "Female" | stringvec == "Nick")]
			
			
			#Why do all of these things work and actually return sensible results?
			
			#It's because they all return logical vectors of the appropriate length, with
			#TRUE values in the slots we want.
			
			#We can demonstrate this by running these commands outside of the braces:
			
			genderID == "Male"
			genderID == "Female"
			
			#Even though this is a completely separate variable, these commands return logical vectors of the appropriate length,
			#with TRUE and FALSE values in the appropriate places.
			
			(genderID == "Female" | stringvec == "Nick")
			
			#Here again, same thing.
			
			## Although different types of objects we will discuss have different numbers of dimensions and different formats,
			## if you remember these THREE WAYS TO SUBSET AN OBJECT 
			## (integers = element index, characters = element name, logical = flag element as TRUE),
			## you will be a master at subsetting any object in R.
			
			#With this in mind, here are some further, useful data manipulation functions:
			
			#*******************
			# SORTING A VECTOR 
			#*******************
			
			#Very quickly, another useful function is sort()
			
			newVec <- c(3, 2, 7, 5, 9)
			newVec
			
			sort(newVec)