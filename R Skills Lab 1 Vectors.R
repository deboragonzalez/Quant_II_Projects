#R Skills Lab 1
#Do your best to answer the following questions.
#Do not forget to put your NAME at the top of your script and save your name in the filename.

#As you work, note the following COMMON MISTAKES if your code doesn't work:
	#1. Capital/lower case/not calling the object by the right name.
		#e.g., calling vec when you saved the object as Vec (or vice versa).
	#2. Forgetting a comma (e.g., in a function).
	#3. Forgetting to close parentheses.
	#4. Using brackets when you meant parentheses or parentheses when you meant brackets.
		#In R:
			#(a) Parentheses () indicate a FUNCTION
				#mean(x) #returns mean of object x
			#(b) Brackets [] are used to index an object. 
				#x[1:5] #returns the first through fifth elements of x.
			#(c) Curly brackets {} will be used in later labs to contain multi-line code for for loops and functions.
				#for(i in 1:10){
					#code
				#}
				
				#do not worry about these for now.

###Questions###

#Answer the following questions, with your CODE beneath each question.
##(For these assignments, the code you used to get a result is what is primarily being evaluated, 
#more than the result the code produces, unless otherwise noted)

#*******************************************
#Part 1: Creating Vectors and Vector Basics.
#*******************************************

#1. Create a vector of the numbers 1, 2, 3, 4, and 5 using c() and assign it the name vec1 (using <- or = to assign the name).

#2. Create a vector of the number 6 through 10 using the from:to format and assign it the name vec2.

#3. Create a sequence of numbers from .1 to .5 by increments of .1. Save this as vec3.

#4. Perform elementwise multipliation of vec1 and vec3 (multiply the two vectors together).

#5. Create a character vector storing the names "Egon", "Peter", "Ray", and "Winston". Save this object, with the name ghostbusters. 
#(Or Ghostbusters, but remember your capitalization).

#6. Using rep(), create another character vector in which the first five elements are "Control" and the second five elements are "Treatment". Save this as an object named group.

#7. Turn this variable into a factor using the factor() function. Save the factor version as groupFac.

#8. Create a Logical Vector with five (5) elements, in which the first two elements are TRUE (or T), the third element is FALSE (or F), and the last two elements are TRUE (or T). Save this vector as logicVec.


#***************************************************************************
#Part II: Indexing (Subscripting) Vectors - Returning the Elements You Want
#***************************************************************************

#9. Take the vector vec1, assigned in question 1, and have R print out the THIRD (3rd) element, using the vec1[number] method.

#10. Now, let's print everything BUT the third element. Take logicVec from question 8 and put this in the brackets. E.g., vec1[logicVec]. Do this below:

#11. What happened when you did #10?

#12. Continuing to use our vector indexing methods (vec[]), select:
	#(a) The element(s) of vec1 that are EXACTLY EQUAL to 3.
	
	#(b) The element(s) of vec1 that are GREATER THAN 2.
	
	#(c) The element(s) of vec2 (not vec1) that are LESS THAN OR EQUAL TO 9.
	
	#(d) The element(s) of vec2 that are LESS THAN 7 OR GREATER THAN 8.
	
	#(e) The element(s) of vec2 that are NOT EQUAL TO 6.
	
	#(f) The element(s) of vec2 that are NOT EQUAL TO 6 AND GREATER THAN 8.


#13. Using the negative (-) index method, display all of the elements of vec1 BUT NOT element 3.

#14. Using the -c() method, display all of the elements of vec1 BUT NOT elements 2 and 4.

#***************************
#Part III: Other Operations
#***************************

#15. What is the length of groupFac?

#16. Use R to display the unique elements of groupFac.

#17. Use the levels() function to display the levels of groupFac.

#18. Use R to find:
	#(a) The mean of vec3.
	#(b) The maximum element of vec3.
	#(c) The minimum element of vec3.
	#(d) The variance of vec3.
	#(e) The standard deviation of vec3 (hint: this is the square root of the variance).

#19. Create a vector with the numbers 4, 2, 7, 3, 7, 1 IN THIS ORDER.

#20. Sort this vector using the sort() function.
