.data
	gameObjective: 		.asciiz "	The object of the game is to find as many possible word combinations as you can given the letters you are provided with.\n"
	intro:			.asciiz "*********************************************************How To Play*******************************************************************\n"
	rulesOne:		.asciiz	"1. You have 60 seconds to input as many words as you can.\n"
	rulesTwo:		.asciiz "2. There is no penalty for wrong words.\n"
	rulesThree: 		.asciiz "3. Each word MUST have the key letter in the word, the key letter is located in the center of the grid.\n"
	rulesFour: 		.asciiz "4. Each word must have at least 4 different letters in it (no duplicate letters are allowed).\n"
	rulesFive:		.asciiz "5. When the 60 seconds is up the game is over or simply quit by entering 0.\n\n"
	beginGame: 		.asciiz "Enter 1 to begin the game or 0 to quit!"
	newline: 		.asciiz "\n"
	newSpace:		.asciiz " "
	clear:			.asciiz ""
	
	gameOver:		.asciiz "\n**************************************** GAME  OVER!! *************************************\n"
	scoreMessage:		.asciiz "\nTotal score: "
	missedWordsNumber:	.asciiz "Total number of missed words: "
	possibleWordsNumber:	.asciiz "\nNumber of possible words: "
	inputBad:		.asciiz "Invalid Entry, Please Try Again!\n"
	playAgainMessage:	.asciiz "\nWould you like to play again? Type '1' for Yes or '0' for No (Exit Program): "
	successMessage1: 	.asciiz "\nThe total number of correct words you enetered was: "
	duplicateMessage:	.asciiz "\nDuplicate word entered!\n"
	promptUser:		.asciiz "\nEnter your word or type '0' to Quit: "
	keyError:		.asciiz "\nYou didn's use the key letter! Try again...\n"
	gridPrint:		.asciiz "| "
	filler:			.asciiz "n "
	gridPrintRow:		.asciiz " ___ ___ ___\n"
	gridWord: 		.space 8
	keyLetter:		.space 1
	userScore:		.word 0
	userInput:		.space 20
	zeroString:		.asciiz "0"
	
	startTime: .word 0
	displayTime: .asciiz "Time remaining: "
	timeRemaining: .word 0 #reset each game!!!
	currentTime: .word 0
	gameTime: .word 0
	remainingTime: .word 20
	youHaveTimeLeft: .asciiz "You have time left!"
	timeHasRunOutMessage: .asciiz "You don't have time left!"
	timeInvalidMessage: .asciiz "You ran out of time, give me your green card!"
	
	letterA: .byte 'a'
	letterB: .byte 'b'
	letterC: .byte 'c'
	letterD: .byte 'd'
	letterE: .byte 'e'
	letterF: .byte 'f'
	letterG: .byte 'g'
	letterH: .byte 'h'
	letterI: .byte 'i'
	letterJ: .byte 'j'
	letterK: .byte 'k'
	letterL: .byte 'l'
	letterM: .byte 'm'
	letterN: .byte 'n'
	letterO: .byte 'o'
	letterP: .byte 'p'
	letterQ: .byte 'q'
	letterR: .byte 'r'
	letterS: .byte 's'
	letterT: .byte 't'
	letterU: .byte 'u'
	letterV: .byte 'v'
	letterW: .byte 'w'
	letterX: .byte 'x'
	letterY: .byte 'y'
	letterZ: .byte 'z'
	
	wordLength:		.word 0
	validWordMessage: 	.asciiz "Valid word"		
	invalidWordMessage:	.asciiz "Invalid word"		
	
	buffer: 		.space 2000000
	fileword: .space 30
	alphabet: .asciiz "abcdefghijklmnopqrstuvwxyz"
	Afile: .asciiz "words/awords.txt"      # filename for input
	Bfile: .asciiz "words/bwords.txt"      # filename for input
	Cfile: .asciiz "words/cwords.txt"      # filename for input
	Dfile: .asciiz "words/dwords.txt"      # filename for input
	Efile: .asciiz "words/ewords.txt"      # filename for input
	Ffile: .asciiz "words/fwords.txt"      # filename for input
	Gfile: .asciiz "words/gwords.txt"      # filename for input
	Hfile: .asciiz "words/hwords.txt"      # filename for input
	Ifile: .asciiz "words/iwords.txt"      # filename for input
	Jfile: .asciiz "words/jwords.txt"      # filename for input
	Kfile: .asciiz "words/kwords.txt"      # filename for input
	Lfile: .asciiz "words/lwords.txt"      # filename for input
	Mfile: .asciiz "words/mwords.txt"      # filename for input
	Nfile: .asciiz "words/nwords.txt"      # filename for input
	Ofile: .asciiz "words/owords.txt"      # filename for input
	Pfile: .asciiz "words/pwords.txt"      # filename for input
	Qfile: .asciiz "words/qwords.txt"      # filename for input
	Rfile: .asciiz "words/rwords.txt"      # filename for input
	Sfile: .asciiz "words/swords.txt"      # filename for input
	Tfile: .asciiz "words/twords.txt"      # filename for input
	Ufile: .asciiz "words/uwords.txt"      # filename for input
	Vfile: .asciiz "words/vwords.txt"      # filename for input
	Wfile: .asciiz "words/wwords.txt"      # filename for input
	Xfile: .asciiz "words/xwords.txt"      # filename for input
	Yfile: .asciiz "words/ywords.txt"      # filename for input
	Zfile: .asciiz "words/zwords.txt"      # filename for input
	dictionaryCheck: .asciiz "Checking the dictionary!\n"
	
	duplicateString: 	.space 200
	duplicateStringEnd:	.word 0
.text
startScreen:	
	sw $0, userScore
	
	jal storeStartTime
	
	li $v0, 4
     	la $a0, gameObjective
     	syscall   
    
     	la $a0, intro
     	syscall   
     	
     	la $a0, rulesOne
     	syscall   
     	
     	la $a0, rulesTwo
     	syscall   
     	
     	la $a0, rulesThree
     	syscall   
     	
     	la $a0, rulesFour
     	syscall   
     	
     	la $a0, rulesFive
     	syscall
     	
     	la $a0, newline
     	syscall  
inputPrompt:     	
     	la $a0, beginGame
     	syscall
     	
     	li $v0, 5
     	syscall
     	
     	addi $t0, $zero, 1
     	
     	beq $v0, $zero, programEnd
     	bne $v0, $t0, badInput
     	add $t0, $zero, $zero 
     	
     	jal letterGen
     	
     	
printGameGrid:
	move $t5, $zero
	
	li $v0, 4
	la $a0, newline
	syscall
	
	la $a0, gridPrintRow
     	syscall
	
     	la $a0, gridPrint
     	syscall   
     				
	li $v0, 11
     	lb $a0, gridWord($t5)
     	syscall
     	
     	addi $t5, $t5, 1
     	
	li $v0, 4
	la $a0, newSpace
	syscall
	
     	la $a0, gridPrint
     	syscall
     	
   	li $v0, 11
     	lb $a0, gridWord($t5)
     	syscall
     	
     	addi $t5, $t5, 1
     	
	li $v0, 4
	la $a0, newSpace
	syscall
	
     	la $a0, gridPrint
     	syscall
	
     	li $v0, 11
     	lb $a0, gridWord($t5)
     	syscall
     	
     	addi $t5, $t5, 1
     	
	li $v0, 4
	la $a0, newSpace
	syscall
	
     	la $a0, gridPrint
     	syscall
     	
     	la $a0, newline
     	syscall
     	
     	la $a0, gridPrintRow
     	syscall
     	
     	la $a0, gridPrint
     	syscall   
     	
     	li $v0, 11
     	lb $a0, gridWord($t5)
     	syscall
     	
     	addi $t5, $t5, 1
     	
	li $v0, 4
	la $a0, newSpace
	syscall
	
     	la $a0, gridPrint
     	syscall
     	
    #######key letter######
   	j keyGenerator
 printKeyLetter:
     	li $v0, 11
     	lb $a0, keyLetter		
     	syscall
     	
	li $v0, 4
	la $a0, newSpace
	syscall
	
     	la $a0, gridPrint
     	syscall
     	
printGameGridHalf:
   	li $v0, 11
     	lb $a0, gridWord($t5)		
     	syscall
     	
     	addi $t5, $t5, 1
     	
	li $v0, 4
	la $a0, newSpace
	syscall
	
     	la $a0, gridPrint
     	syscall
     	
     	la $a0, newline
     	syscall
     	
     	la $a0, gridPrintRow
     	syscall
     	
     	la $a0, gridPrint
     	syscall   
     	
   	li $v0, 11
     	lb $a0, gridWord($t5)		
     	syscall
     	
     	addi $t5, $t5, 1
     	
	li $v0, 4
	la $a0, newSpace
	syscall
	
     	la $a0, gridPrint
     	syscall
     	
   	li $v0, 11
     	lb $a0, gridWord($t5)		
     	syscall
     	
     	addi $t5, $t5, 1
     	
	li $v0, 4
	la $a0, newSpace
	syscall
	
     	la $a0, gridPrint
     	syscall
     	
   	li $v0, 11
     	lb $a0, gridWord($t5)		
     	syscall
     	
	li $v0, 4
	la $a0, newSpace
	syscall
	
     	la $a0, gridPrint
     	syscall
     	
     	la $a0, newline
     	syscall
 	
     	la $a0, gridPrintRow
     	syscall
     	
clearDuplicateString:
	li $t2, 0
	lw $t0, duplicateStringEnd
	lb $t1, clear
clearLoop:	
	sb $t1, duplicateString($t2)
	addi $t2, $t2, 1
	bgt $t2, $t0, endClearDuplicateString 
	j clearLoop
endClearDuplicateString:
	sw $0, duplicateStringEnd
	
userInputFunction:

checkTime: 	 
 	 li $v0, 30				#Syscall 30 to get systime in ms
	syscall					#Now $a0 has lower 32 bits of system time
	
	li $t0, 1000			#This converts system time from milliseconds to seconds
	div $a0, $t0			#Lo will now hold the seconds value
	mflo $t0			#Return the seconds
	
	lw $t1, startTime
	sub $t0, $t0, $t1
	lw $t1, remainingTime
	sub $t0, $t1, $t0
	
	bgt $t0, 0, timeValid 
timeInvalid:	
	li $v0, 4
	la $a0, newline
	syscall
	
	li $v0, 4
	la $a0, timeInvalidMessage
	syscall
	j gameEnd
timeValid:	
	li $v0, 4
	la $a0, newline
	syscall
	
	li $v0, 4
	la $a0, displayTime
	syscall
	
	li $v0, 1
	add $a0, $0, $t0	#time left message
	syscall
	
	#jal getTimeElapsed
	#lw $t1, timeRemaining #Load the timeRemaining value onto $t1 
	#sub $v0, $t1, $v0     # Subtract the timeRemaining from the difference between now and startTime
	
	#sw $v0, timeRemaining #Store the result of that calculation in timeRemaining
	
	#li $v0, 4
	#la $a0, displayTime
	#syscall
	
	#li $v0, 1
	#la $a0, timeRemaining
	#syscall
	
	###### Franco Input
	
	li $v0, 4 
	la $a0, promptUser
	syscall

	 li $v0, 8
 	 la $a0, userInput
 	 li $a1, 500
 	 syscall
 	 
 	 addi $t3, $zero, 1
 	 lb $t0, userInput($zero)
 	 lb $t1, zeroString($zero)		#this checks if the user entered 0 when asked for a word
 	 lb $t2, userInput($t3)			#ends the game
 	 #bne $t2, $zero, validateUserInput
 	 beq $t0, $t1, gameEnd
 	 
validateUserInput:
	j Checks
	
     	##################### jump to the check file, to determine if the word is valid
     	
     	##################### if the word is valid
     	
	
validUserInput:
	jal writeToDuplicateString		#causes main not to work becuase of the path name of the duplicate file
     	jal incrementScore
     	j userInputFunction
invalidInput:
	li $v0, 4
	la $a0, inputBad
	syscall
	
	j userInputFunction	#this sends you back to the prompt, where you can exit or start a new game

	##################### -jump back up to the userInput function
     	
	##################### if the timer ends, the game has to end		
     	
###################################################  end of main  ##################################################### 
storeStartTime:
	li $v0, 30				#Syscall 30 to get systime in ms
	syscall					#Now $a0 has lower 32 bits of system time
	
	li $t0, 1000			#This converts system time from milliseconds to seconds
	div $a0, $t0			#Lo will now hold the seconds value
	mflo $t0			#Return the seconds
	
	sw $t0, startTime
	jr $ra
endStoreStartTime:
		
badInput:
	li $v0, 4
	la $a0, inputBad
	syscall
	
	j inputPrompt
gameEnd:
	li $v0, 4
	la $a0, scoreMessage
	syscall
	
	li $v0, 1
	lw $a0, userScore
	syscall
	
	li $v0, 4
	la $a0, gameOver   #prints game over screen
	syscall
	
	li $v0, 4 
	la $a0, playAgainMessage   #ask user to play agin
	syscall
	
	li $v0, 5   #takes input
	syscall
	
	move $t0, $zero
	beq $v0, 1, startScreen
	beq $v0, $zero, programEnd   #logic to start game over or quit
     	bne $v0, $t0, badInput
	
	j startScreen

######### Timer functions ########

getTimeCurrent:
	li $v0, 30				#Syscall 30 to get systime in ms
	syscall					#Now $a0 has lower 32 bits of system time
	
	li $t0, 1000			#This converts system time from milliseconds to seconds
	div $a0, $t0			#Lo will now hold the seconds value
	mflo $v0			#Return the seconds
	jr $ra	
	
getTimeElapsed:					#parameter is $a1 (start)
	lw $a1, currentTime
	addi $sp, $sp, -8
	sw $ra, ($sp)
	sw $a1, 4($sp)
	jal getTimeCurrent			#find currentTime, and put it on $v0
	lw $t0, 4($sp)				#load startTime onto $t0
	lw $ra, ($sp)
	addi $sp, $sp, 8
	sub $v0, $v0, $t0			#Calculate difference in time and return it on $v0
	jr $ra
	
programEnd:
	li $v0, 10
	syscall
keyGenerator:
	li   $v0, 41       	# get a random int
	syscall

	divu $t0, $a0, 5   	# mod it by 5 so we can generate a vowel with that vowel
	mfhi $v0		# Get the remainder value
	addi $v0, $v0, 1	# add 1 to modValue to handle case where the div operation results in 0
	move $s0, $v0 		# move the mod value to $s0

	move $a0, $s0 		# move the modValue to $a0

	jal getVowel 		# Call the function to return 1 vowel

	sb $v1, keyLetter($zero)
	j printKeyLetter

keyModValueOne:
	la $a0, letterA  # Get the address
	lb $v1, ($a0)  # Get the value at that address
	jr $ra
keyModValueTwo:
	la $a0, letterE  # Get the address
	lb $v1, ($a0)  # Get the value at that address
	jr $ra
keyModValueThree:
	la $a0, letterI  # Get the address
	lb $v1, ($a0)  # Get the value at that address
	jr $ra
keyModValueFour:
	la $a0, letterO  # Get the address
	lb $v1, 0($a0)  # Get the value at that address
	jr $ra
keyModValueFive:
	la $a0, letterU  # Get the address
	lb $v1, ($a0)  # Get the value at that address
	jr $ra
getVowel:
	#a0 holds the mod value, which is 1, 2, 3, 4 or 5 to be mapped to a variable
	beq $a0, 1 keyModValueOne #branch if $s0 == 1
	beq $a0, 2 keyModValueTwo #branch if $s0 == 2
	beq $a0, 3 keyModValueThree #branch if $s0 == 3
	beq $a0, 4 keyModValueFour #branch if $s0 == 4
	beq $a0, 5 keyModValueFive #branch if $s0 == 5

	jr $ra

letterGen:
  	add $t0, $0, $0 # Set $t0 to zero. This will be our counter
	jal loop
	add $t0, $0, $0 # Set $t0 to zero. This will be our counter
	jal loop
	add $t0, $0, $0 # Set $t0 to zero. This will be our counter
	jal loop
	add $t0, $0, $0 # Set $t0 to zero. This will be our counter
	jal loop
	add $t0, $0, $0 # Set $t0 to zero. This will be our counter
	jal loop
	add $t0, $0, $0 # Set $t0 to zero. This will be our counter
	jal loop
	add $t0, $0, $0 # Set $t0 to zero. This will be our counter
	jal loop
	add $t0, $0, $0 # Set $t0 to zero. This will be our counter
	jal loop
loop:
        addi $sp, $sp, -12   # make room on the stack
   	sw  $ra, -8($sp)     # store the address

   	bgt $t0,0, exit # If $t0 is greater than 2, branch to exit
    	addi $t0,$t0,1 # Add one to the value of $t0

   	li   $v0, 41       	# get a random integer
	syscall

	divu $t2, $a0, 26  	# mod the value in $a0 by 26 and store in $t2 so we can generate a letter number
	mfhi $v0		# Get the remainder value
	addi $v0, $v0, 1	# add 1 to modValue to make numbers match those of the alphabet
	move $s0, $v0 		# move the mod value to $s0 to use elsewhere

	move $a0, $s0   # Move the random int to $a0 to pass to the getLetter function
	jal getLetter

	move $t7, $v1
	sb $t7, gridWord($t6)
	addi $t6, $t6, 1
    	
	beq $t6, 8, printGameGrid
	
    	j loop
exit:
	lw  $ra, 4($sp) # Do not change this or it will break
	jr $ra # return us to the caller, which brings us back to main
getLetter:
	#a0 holds the mod value, which should be 1 through 26 to be mapped to a letter of the alphabet
	beq $a0, 1 modValueOne #branch if $s0 == 1
	beq $a0, 2 modValueTwo #branch if $s0 == 2
	beq $a0, 3 modValueThree #branch if $s0 == 3
	beq $a0, 4 modValueFour #branch if $s0 == 4
	beq $a0, 5 modValueFive #branch if $s0 == 5
	beq $a0, 6 modValueSix #branch if $s0 == 6
	beq $a0, 7 modValueSeven #branch if $s0 == 7
	beq $a0, 8 modValueEight #branch if $s0 == 8
	beq $a0, 9 modValueNine #branch if $s0 == 9
	beq $a0, 10 modValueTen #branch if $s0 == 10
	beq $a0, 11 modValueEleven #branch if $s0 == 11
	beq $a0, 12 modValueTwelve #branch if $s0 == 12
	beq $a0, 13 modValueThirteen #branch if $s0 == 13
	beq $a0, 14 modValueFourteen #branch if $s0 == 14
	beq $a0, 15 modValueFifteen #branch if $s0 == 15
	beq $a0, 16 modValueSixteen #branch if $s0 == 16
	beq $a0, 17 modValueSeventeen #branch if $s0 == 17
	beq $a0, 18 modValueEighteen #branch if $s0 == 18
	beq $a0, 19 modValueNineteen #branch if $s0 == 19
	beq $a0, 20 modValueTwenty #branch if $s0 == 20
	beq $a0, 21 modValueTwentyOne #branch if $s0 == 21
	beq $a0, 22 modValueTwentyTwo #branch if $s0 == 22
	beq $a0, 23 modValueTwentyThree #branch if $s0 == 23
	beq $a0, 24 modValueTwentyFour #branch if $s0 == 24
	beq $a0, 25 modValueTwentyFive #branch if $s0 == 25
	beq $a0, 26 modValueTwentySix #branch if $s0 == 26
	jr $ra
modValueOne:
	beq $s2, 1, letterGen
	addi $s2, $s2, 1
	la $a0, letterA  # Get the address
	lb $v1, ($a0)  # Get the value at that address
	jr $ra
modValueTwo:
	beq $s2, 1, letterGen
	addi $s2, $s2, 1
	la $a0, letterB  # Get the address
	lb $v1, ($a0)  # Get the value at that address
	jr $ra
modValueThree:
	beq $s2, 1, letterGen
	addi $s2, $s2, 1
	la $a0, letterC  # Get the address
	lb $v1, ($a0)  # Get the value at that address
	jr $ra
modValueFour:
	beq $s2, 1, letterGen
	addi $s2, $s2, 1
	la $a0, letterD  # Get the address
	lb $v1, ($a0)  # Get the value at that address
	jr $ra
modValueFive:
	beq $s2, 1, letterGen
	addi $s2, $s2, 1
	la $a0, letterE  # Get the address
	lb $v1, ($a0)  # Get the value at that address
	jr $ra
modValueSix:
	beq $s2, 1, letterGen
	addi $s2, $s2, 1
	la $a0, letterF  # Get the address
	lb $v1, ($a0)  # Get the value at that address
	jr $ra
modValueSeven:
	beq $s2, 1, letterGen
	addi $s2, $s2, 1
	la $a0, letterG  # Get the address
	lb $v1, ($a0)  # Get the value at that address
	jr $ra
modValueEight:
	beq $s2, 1, letterGen
	addi $s2, $s2, 1
	la $a0, letterH  # Get the address
	lb $v1, ($a0)  # Get the value at that address
	jr $ra
modValueNine:
	beq $s2, 1, letterGen
	addi $s2, $s2, 1
	la $a0, letterI  # Get the address
	lb $v1, ($a0)  # Get the value at that address
	jr $ra
modValueTen:
	beq $s2, 1, letterGen
	addi $s2, $s2, 1
	la $a0, letterJ  # Get the address
	lb $v1, ($a0)  # Get the value at that address
	jr $ra
modValueEleven:
	beq $s2, 1, letterGen
	addi $s2, $s2, 1
	la $a0, letterK  # Get the address
	lb $v1, ($a0)  # Get the value at that address
	jr $ra
modValueTwelve:	
	beq $s2, 1, letterGen
	addi $s2, $s2, 1
	la $a0, letterL  # Get the address
	lb $v1, ($a0)  # Get the value at that address
	jr $ra
modValueThirteen:
	beq $s2, 1, letterGen
	addi $s2, $s2, 1
	la $a0, letterM  # Get the address
	lb $v1, ($a0)  # Get the value at that address
	jr $ra
modValueFourteen:
	beq $s2, 1, letterGen
	addi $s2, $s2, 1
	la $a0, letterN  # Get the address
	lb $v1, ($a0)  # Get the value at that address
	jr $ra
modValueFifteen:
	beq $s2, 1, letterGen
	addi $s2, $s2, 1
	la $a0, letterO  # Get the address
	lb $v1, ($a0)  # Get the value at that address
	jr $ra
modValueSixteen:
	beq $s2, 1, letterGen
	addi $s2, $s2, 1
	la $a0, letterP  # Get the address
	lb $v1, ($a0)  # Get the value at that address
	jr $ra
modValueSeventeen:
	beq $s2, 1, letterGen
	addi $s2, $s2, 1
	la $a0, letterQ  # Get the address
	lb $v1, ($a0)  # Get the value at that address
	jr $ra
modValueEighteen:
	beq $s2, 1, letterGen
	addi $s2, $s2, 1
	la $a0, letterR  # Get the address
	lb $v1, ($a0)  # Get the value at that address
	jr $ra
modValueNineteen:
	beq $s2, 1, letterGen
	addi $s2, $s2, 1
	la $a0, letterS  # Get the address
	lb $v1, ($a0)  # Get the value at that address
	jr $ra
modValueTwenty:
	beq $s2, 1, letterGen
	addi $s2, $s2, 1
	la $a0, letterT  # Get the address
	lb $v1, ($a0)  # Get the value at that address
	jr $ra
modValueTwentyOne:
	beq $s2, 1, letterGen
	addi $s2, $s2, 1
	la $a0, letterU  # Get the address
	lb $v1, ($a0)  # Get the value at that address
	jr $ra
modValueTwentyTwo:
	beq $s2, 1, letterGen
	addi $s2, $s2, 1
	la $a0, letterV  # Get the address
	lb $v1, ($a0)  # Get the value at that address
	jr $ra
modValueTwentyThree:
	beq $s2, 1, letterGen
	addi $s2, $s2, 1
	la $a0, letterW  # Get the address
	lb $v1, ($a0)  # Get the value at that address
	jr $ra
modValueTwentyFour:
	beq $s2, 1, letterGen
	addi $s2, $s2, 1
	la $a0, letterX  # Get the address
	lb $v1, ($a0)  # Get the value at that address
	jr $ra
modValueTwentyFive:
	beq $s2, 1, letterGen
	addi $s2, $s2, 1
	la $a0, letterY  # Get the address
	lb $v1, ($a0)  # Get the value at that address
	jr $ra
modValueTwentySix:
	beq $s2, 1, letterGen
	addi $s2, $s2, 1
	la $a0, letterZ  # Get the address
	lb $v1, ($a0)  # Get the value at that address
	jr $ra

writeToDuplicateString:			##### new	for duplicates
	lw $t0, wordLength
	li $t1, 0			#word index
	lw $t2, duplicateStringEnd 	#duplicate string index	
   writeLoop:
 	lb $t3, userInput($t1)	
	sb $t3, duplicateString($t2)
	addi $t1, $t1, 1
	addi $t2, $t2, 1
	bne $t1, $t0, writeLoop
   doneWrite:	
	lb $t3, newSpace
	sb $t3, duplicateString($t2)
	addi $t2, $t2, 1
	sw $t2, duplicateStringEnd	

	jr $ra
endWriteToDuplicateString:		##### new	for duplicates

incrementScore:
     lw $t0, userScore
     addi $t0, $t0, 1
     sw $t0, userScore

     jr $ra

Checks:
	add $v0, $zero, $zero
	add $v1, $zero, $zero
	add $a0, $zero, $zero
	add $a1, $zero, $zero
	add $a2, $zero, $zero
	add $a3, $zero, $zero
	add $t0, $zero, $zero
	add $t1, $zero, $zero
	add $t2, $zero, $zero
	add $t3, $zero, $zero
	add $t4, $zero, $zero
	add $t5, $zero, $zero
	add $t6, $zero, $zero
	add $t7, $zero, $zero
	add $t8, $zero, $zero
	add $s1, $zero, $zero
	add $s2, $zero, $zero
	
CheckLength:
        addi $t0, $zero, 4
        addi $t1, $zero, 9
lengthLoop:
        lb $t2, userInput($t3) # load the next character into t2
        addi $t3, $t3, 1 # increment the string pointer
        bne $t2, $zero, lengthLoop # check for the null character
        subi $t3, $t3, 2
       
        bgt $t3, $t1, invalidWord
        blt $t3, $t0, invalidWord
        
        sw $t3, wordLength
        
	add $t1, $zero, $zero
	add $t3, $zero, $zero
	add $t4, $zero, $zero
		
	lw $t5, wordLength($0)
wordGridCheck: 
	lb $t0, userInput($t1)
        lb $t2, gridWord($t3)
        beq $t1, $t5, gridChecked	###new
        beq $t2, $zero, gridFail
        beq $t0, $zero, gridChecked
        bne $t2, $t0, moveGridArray
        j moveUserArray
moveGridArray:	
	addi $t3, $t3, 1
	j wordGridCheck
moveUserArray:
	addi $t1, $t1, 1
	move $t3, $zero
	j wordGridCheck
gridFail:
	lb $t4, keyLetter		###new
	beq $t0, $t4, moveUserArray	###new
	j invalidWord
gridChecked:
	add $t0, $zero, $zero
    	add $t1, $zero, $zero
    	add $t2, $zero, $zero
    	add $t3, $zero, $zero
    	add $t4, $zero, $zero
    	add $t5, $zero, $zero  	
	
	lb $t0, keyLetter 	
keyLoop:
        lb $t1, userInput($t2)
        addi $t2, $t2, 1
        beq $t1, $zero, invalidWord	#null check
        beq $t1, $t0, keyDone		#key check
        j keyLoop
keyDone:
	add $t0, $zero, $zero
	add $t1, $zero, $zero
	add $t2, $zero, $zero
	add $t3, $zero, $zero						
	
duplicateCheck:
	lw $t0, userScore		#case that duplicateString is empty
	beq $t0, 0, endDuplicateCheck
	add $t1, $zero, $zero
	add $t3, $zero, $zero
	lw $t4, wordLength
	subi $t4, $t4, 1			#userInput length-1 for loop condition
	lw $t5, duplicateStringEnd		#DS length
	lb $t6, newSpace
duplicateCheckLoop:
	lb $t0, userInput($t1)			#load letters
	lb $t2, duplicateString($t3)
	
	addi $t1, $t1, 1			#increment couunters
	addi $t3, $t3, 1
	bne $t0, $t2, notMatch 			#if same letters
	beq $t1, $t4, invalidWord
	j duplicateCheckLoop
notMatch:
	bgt $t3, $t5, endDuplicateCheck		#case that last string in DS wasn't a match
	add $t1, $zero, $zero			#set word counter back to zero for new check
notMatchLoop:
	lb $t2, duplicateString($t3)
	addi $t3, $t3, 1
	bne $t2, $t6, notMatchLoop
	j duplicateCheckLoop
endDuplicateCheck:																		
	add $t0, $zero, $zero
	add $t1, $zero, $zero
	add $t2, $zero, $zero
	add $t3, $zero, $zero
	add $t4, $zero, $zero
	add $t5, $zero, $zero
	add $t6, $zero, $zero
																																																																																																													
checkWordDictionary:
	li $v0, 4
	la $a0, dictionaryCheck
	syscall
	
	lw $a3, wordLength($0)
	la $a0, userInput		#word
	la $a1, alphabet
	lb $t0, 0($a0)		
	lb $t1, 0($a1)	
		
	bne $t0, $t1, bWords
##########################################################		file	begin	
	#open a file for writing
	li   $v0, 13       # system call for open file
	la   $a0, Afile    # board file name
	li   $a1, 0        # Open for reading
	li   $a2, 0
	syscall            # open a file (file descriptor returned in $v0)
	move $s6, $v0      # save the file descriptor 

	#read from file
	li   $v0, 14       # system call for read from file
	move $a0, $s6      # file descriptor 
	la   $a1, buffer   # address of buffer to which to read
	li   $a2, 200000       # hardcoded buffer length
	syscall            # read from file
	
	add $t1, $zero, $zero
	lb $t3, newline
Aloop:	
	lb $t0, buffer($t2)
	addi $t2, $t2, 1
	beq $t0, $t1, Aend	#branch if it's the end of the file	
	bne $t0, $t3, Aloop	#branch if it's not a newline
	beq $t5, $zero, AfirstStart
	addi $t5, $t6, 2
AfirstStart:	
	subi $t6, $t2, 2		# $t5 to $t6 holds a word from file	
	
	sub $t8, $t6, $t5
	addi $t8, $t8, 1
	
	bne $t8, $a3, AnotLength
			#holds word of correct length
	addi $t6, $t6, 1
	add $t9, $t5, $zero
	add $s2, $zero, $zero
Ado:	lb $s0, buffer($t9)	#compares ith letter of myword to ith letter of word in dictionary
	lb $s1, userInput($s2)
	bne $s0, $s1, Anotword
	
	addi $t9, $t9, 1
	addi $s2, $s2, 1		
	bne $t9, $t6, Ado	#loop that iterates whole word through $t5
	
	addi $v1, $zero, 1		# return 1 for true, ie word exists
	
	j Aend
Anotword:
	subi $t6, $t6, 1			
AnotLength:
	bne $t5, $zero, Aloop		
	addi $t5, $t6, 2
	j Aloop
Aend:			# Close the file 
	li   $v0, 16       # system call for close file
	move $a0, $s6      # file descriptor to close
	syscall            # close file
##########################################################		file	end
	
	j goBack  
bWords:
	lb $t1, 1($a1)		
	bne $t0, $t1, cWords
##########################################################		file	begin	
	#open a file for writing
	li   $v0, 13       # system call for open file
	la   $a0, Bfile    # board file name
	li   $a1, 0        # Open for reading
	li   $a2, 0
	syscall            # open a file (file descriptor returned in $v0)
	move $s6, $v0      # save the file descriptor 

	#read from file
	li   $v0, 14       # system call for read from file
	move $a0, $s6      # file descriptor 
	la   $a1, buffer   # address of buffer to which to read
	li   $a2, 200000       # hardcoded buffer length
	syscall            # read from file
	
	add $t1, $zero, $zero
	lb $t3, newline
Bloop:	
	lb $t0, buffer($t2)
	addi $t2, $t2, 1
	beq $t0, $t1, Bend	#branch if it's the end of the file	
	bne $t0, $t3, Bloop	#branch if it's not a newline
	beq $t5, $zero, BfirstStart
	addi $t5, $t6, 2
BfirstStart:	
	subi $t6, $t2, 2		# $t5 to $t6 holds a word from file	
	
	sub $t8, $t6, $t5
	addi $t8, $t8, 1
	
	bne $t8, $a3, BnotLength
			#holds word of correct length
	addi $t6, $t6, 1
	add $t9, $t5, $zero
	add $s2, $zero, $zero
Bdo:	lb $s0, buffer($t9)	#compares ith letter of myword to ith letter of word in dictionary
	lb $s1, userInput($s2)
	bne $s0, $s1, Bnotword
	
	addi $t9, $t9, 1
	addi $s2, $s2, 1		
	bne $t9, $t6, Bdo	#loop that iterates whole word through $t5
	
	addi $v1, $zero, 1		# return 1 for true, ie word exists
	
	j Bend
Bnotword:
	subi $t6, $t6, 1			
BnotLength:
	bne $t5, $zero, Bloop		
	addi $t5, $t6, 2
	j Bloop
Bend:			# Close the file 
	li   $v0, 16       # system call for close file
	move $a0, $s6      # file descriptor to close
	syscall            # close file
##########################################################		file	end
	j goBack 
cWords:
	lb $t1, 2($a1)		
	bne $t0, $t1, dWords
##########################################################		file	begin	
	#open a file for writing
	li   $v0, 13       # system call for open file
	la   $a0, Cfile    # board file name
	li   $a1, 0        # Open for reading
	li   $a2, 0
	syscall            # open a file (file descriptor returned in $v0)
	move $s6, $v0      # save the file descriptor 

	#read from file
	li   $v0, 14       # system call for read from file
	move $a0, $s6      # file descriptor 
	la   $a1, buffer   # address of buffer to which to read
	li   $a2, 200000       # hardcoded buffer length
	syscall            # read from file
	
	add $t1, $zero, $zero
	lb $t3, newline
Cloop:	
	lb $t0, buffer($t2)
	addi $t2, $t2, 1
	beq $t0, $t1, Cend	#branch if it's the end of the file	
	bne $t0, $t3, Cloop	#branch if it's not a newline
	beq $t5, $zero, CfirstStart
	addi $t5, $t6, 2
CfirstStart:	
	subi $t6, $t2, 2		# $t5 to $t6 holds a word from file	
	
	sub $t8, $t6, $t5
	addi $t8, $t8, 1
	
	bne $t8, $a3, CnotLength
			#holds word of correct length
	addi $t6, $t6, 1
	add $t9, $t5, $zero
	add $s2, $zero, $zero
Cdo:	lb $s0, buffer($t9)	#compares ith letter of myword to ith letter of word in dictionary
	lb $s1, userInput($s2)
	bne $s0, $s1, Cnotword
	
	addi $t9, $t9, 1
	addi $s2, $s2, 1		
	bne $t9, $t6, Cdo	#loop that iterates whole word through $t5
	
	addi $v1, $zero, 1		# return 1 for true, ie word exists
	
	j Cend
Cnotword:
	subi $t6, $t6, 1			
CnotLength:
	bne $t5, $zero, Cloop		
	addi $t5, $t6, 2
	j Cloop
Cend:			# Close the file 
	li   $v0, 16       # system call for close file
	move $a0, $s6      # file descriptor to close
	syscall            # close file
##########################################################		file	end
	j goBack 
dWords:
	lb $t1, 3($a1)		
	bne $t0, $t1, eWords
##########################################################		file	begin	
	#open a file for writing
	li   $v0, 13       # system call for open file
	la   $a0, Dfile    # board file name
	li   $a1, 0        # Open for reading
	li   $a2, 0
	syscall            # open a file (file descriptor returned in $v0)
	move $s6, $v0      # save the file descriptor 

	#read from file
	li   $v0, 14       # system call for read from file
	move $a0, $s6      # file descriptor 
	la   $a1, buffer   # address of buffer to which to read
	li   $a2, 200000       # hardcoded buffer length
	syscall            # read from file
	
	add $t1, $zero, $zero
	lb $t3, newline
Dloop:	
	lb $t0, buffer($t2)
	addi $t2, $t2, 1
	beq $t0, $t1, Dend	#branch if it's the end of the file	
	bne $t0, $t3, Dloop	#branch if it's not a newline
	beq $t5, $zero, DfirstStart
	addi $t5, $t6, 2
DfirstStart:	
	subi $t6, $t2, 2		# $t5 to $t6 holds a word from file	
	
	sub $t8, $t6, $t5
	addi $t8, $t8, 1
	
	bne $t8, $a3, DnotLength
			#holds word of correct length
	addi $t6, $t6, 1
	add $t9, $t5, $zero
	add $s2, $zero, $zero
Ddo:	lb $s0, buffer($t9)	#compares ith letter of myword to ith letter of word in dictionary
	lb $s1, userInput($s2)
	bne $s0, $s1, Dnotword
	
	addi $t9, $t9, 1
	addi $s2, $s2, 1		
	bne $t9, $t6, Ddo	#loop that iterates whole word through $t5
	
	addi $v1, $zero, 1		# return 1 for true, ie word exists
	
	j Dend
Dnotword:
	subi $t6, $t6, 1			
DnotLength:
	bne $t5, $zero, Dloop		
	addi $t5, $t6, 2
	j Dloop
Dend:			# Close the file 
	li   $v0, 16       # system call for close file
	move $a0, $s6      # file descriptor to close
	syscall            # close file
##########################################################		file	end	
	j goBack 
eWords:
	lb $t1, 4($a1)		
	bne $t0, $t1, fWords
##########################################################		file	begin	
	#open a file for writing
	li   $v0, 13       # system call for open file
	la   $a0, Efile    # board file name
	li   $a1, 0        # Open for reading
	li   $a2, 0
	syscall            # open a file (file descriptor returned in $v0)
	move $s6, $v0      # save the file descriptor 

	#read from file
	li   $v0, 14       # system call for read from file
	move $a0, $s6      # file descriptor 
	la   $a1, buffer   # address of buffer to which to read
	li   $a2, 200000       # hardcoded buffer length
	syscall           # read from file
	
	add $t1, $zero, $zero
	lb $t3, newline
Eloop:	
	lb $t0, buffer($t2)
	addi $t2, $t2, 1
	beq $t0, $t1, Eend	#branch if it's the end of the file	
	bne $t0, $t3, Eloop	#branch if it's not a newline
	beq $t5, $zero, EfirstStart
	addi $t5, $t6, 2
EfirstStart:	
	subi $t6, $t2, 2		# $t5 to $t6 holds a word from file	
	
	sub $t8, $t6, $t5
	addi $t8, $t8, 1
	
	bne $t8, $a3, EnotLength
			#holds word of correct length
	addi $t6, $t6, 1
	add $t9, $t5, $zero
	add $s2, $zero, $zero
Edo:	lb $s0, buffer($t9)	#compares ith letter of myword to ith letter of word in dictionary
	lb $s1, userInput($s2)
	bne $s0, $s1, Enotword
	
	addi $t9, $t9, 1
	addi $s2, $s2, 1		
	bne $t9, $t6, Edo	#loop that iterates whole word through $t5
	
	addi $v1, $zero, 1		# return 1 for true, ie word exists
	
	j Eend
Enotword:
	subi $t6, $t6, 1			
EnotLength:
	bne $t5, $zero, Eloop		
	addi $t5, $t6, 2
	j Eloop
Eend:			# Close the file 
	li   $v0, 16       # system call for close file
	move $a0, $s6      # file descriptor to close
	syscall            # close file
##########################################################		file	end		
	j goBack 
fWords:
	lb $t1, 5($a1)		
	bne $t0, $t1, gWords
##########################################################		file	begin	
	#open a file for writing
	li   $v0, 13       # system call for open file
	la   $a0, Ffile    # board file name
	li   $a1, 0        # Open for reading
	li   $a2, 0
	syscall            # open a file (file descriptor returned in $v0)
	move $s6, $v0      # save the file descriptor 

	#read from file
	li   $v0, 14       # system call for read from file
	move $a0, $s6      # file descriptor 
	la   $a1, buffer   # address of buffer to which to read
	li   $a2, 200000       # hardcoded buffer length
	syscall            # read from file
	
	add $t1, $zero, $zero
	lb $t3, newline
Floop:	
	lb $t0, buffer($t2)
	addi $t2, $t2, 1
	beq $t0, $t1, Fend	#branch if it's the end of the file	
	bne $t0, $t3, Floop	#branch if it's not a newline
	beq $t5, $zero, FfirstStart
	addi $t5, $t6, 2
FfirstStart:	
	subi $t6, $t2, 2		# $t5 to $t6 holds a word from file	
	
	sub $t8, $t6, $t5
	addi $t8, $t8, 1
	
	bne $t8, $a3, FnotLength
			#holds word of correct length
	addi $t6, $t6, 1
	add $t9, $t5, $zero
	add $s2, $zero, $zero
Fdo:	lb $s0, buffer($t9)	#compares ith letter of myword to ith letter of word in dictionary
	lb $s1, userInput($s2)
	bne $s0, $s1, Fnotword
	
	addi $t9, $t9, 1
	addi $s2, $s2, 1		
	bne $t9, $t6, Fdo	#loop that iterates whole word through $t5
	
	addi $v1, $zero, 1		# return 1 for true, ie word exists
	
	j Fend
Fnotword:
	subi $t6, $t6, 1			
FnotLength:
	bne $t5, $zero, Floop		
	addi $t5, $t6, 2
	j Floop
Fend:			# Close the file 
	li   $v0, 16       # system call for close file
	move $a0, $s6      # file descriptor to close
	syscall            # close file
##########################################################		file	end		
	j goBack 
gWords:
	lb $t1, 6($a1)		
	bne $t0, $t1, hWords
##########################################################		file	begin	
	#open a file for writing
	li   $v0, 13       # system call for open file
	la   $a0, Gfile    # board file name
	li   $a1, 0        # Open for reading
	li   $a2, 0
	syscall            # open a file (file descriptor returned in $v0)
	move $s6, $v0      # save the file descriptor 

	#read from file
	li   $v0, 14       # system call for read from file
	move $a0, $s6      # file descriptor 
	la   $a1, buffer   # address of buffer to which to read
	li   $a2, 200000       # hardcoded buffer length
	syscall            # read from file
	
	add $t1, $zero, $zero
	lb $t3, newline
Gloop:	
	lb $t0, buffer($t2)
	addi $t2, $t2, 1
	beq $t0, $t1, Gend	#branch if it's the end of the file	
	bne $t0, $t3, Gloop	#branch if it's not a newline
	beq $t5, $zero, GfirstStart
	addi $t5, $t6, 2
GfirstStart:	
	subi $t6, $t2, 2		# $t5 to $t6 holds a word from file	
	
	sub $t8, $t6, $t5
	addi $t8, $t8, 1
	
	bne $t8, $a3, GnotLength
			#holds word of correct length
	addi $t6, $t6, 1
	add $t9, $t5, $zero
	add $s2, $zero, $zero
Gdo:	lb $s0, buffer($t9)	#compares ith letter of myword to ith letter of word in dictionary
	lb $s1, userInput($s2)
	bne $s0, $s1, Gnotword
	
	addi $t9, $t9, 1
	addi $s2, $s2, 1		
	bne $t9, $t6, Gdo	#loop that iterates whole word through $t5
	
	addi $v1, $zero, 1		# return 1 for true, ie word exists
	
	j Gend
Gnotword:
	subi $t6, $t6, 1			
GnotLength:
	bne $t5, $zero, Gloop		
	addi $t5, $t6, 2
	j Gloop
Gend:			# Close the file 
	li   $v0, 16       # system call for close file
	move $a0, $s6      # file descriptor to close
	syscall            # close file
##########################################################		file	end		
	j goBack 
hWords:
	lb $t1, 7($a1)		
	bne $t0, $t1, iWords
##########################################################		file	begin	
	#open a file for writing
	li   $v0, 13       # system call for open file
	la   $a0, Hfile    # board file name
	li   $a1, 0        # Open for reading
	li   $a2, 0
	syscall            # open a file (file descriptor returned in $v0)
	move $s6, $v0      # save the file descriptor 

	#read from file
	li   $v0, 14       # system call for read from file
	move $a0, $s6      # file descriptor 
	la   $a1, buffer   # address of buffer to which to read
	li   $a2, 200000       # hardcoded buffer length
	syscall            # read from file
	
	add $t1, $zero, $zero
	lb $t3, newline
Hloop:	
	lb $t0, buffer($t2)
	addi $t2, $t2, 1
	beq $t0, $t1, Hend	#branch if it's the end of the file	
	bne $t0, $t3, Hloop	#branch if it's not a newline
	beq $t5, $zero, HfirstStart
	addi $t5, $t6, 2
HfirstStart:	
	subi $t6, $t2, 2		# $t5 to $t6 holds a word from file	
	
	sub $t8, $t6, $t5
	addi $t8, $t8, 1
	
	bne $t8, $a3, HnotLength
			#holds word of correct length
	addi $t6, $t6, 1
	add $t9, $t5, $zero
	add $s2, $zero, $zero
Hdo:	lb $s0, buffer($t9)	#compares ith letter of myword to ith letter of word in dictionary
	lb $s1, userInput($s2)
	bne $s0, $s1, Hnotword
	
	addi $t9, $t9, 1
	addi $s2, $s2, 1		
	bne $t9, $t6, Hdo	#loop that iterates whole word through $t5
	
	addi $v1, $zero, 1		# return 1 for true, ie word exists
	
	j Hend
Hnotword:
	subi $t6, $t6, 1			
HnotLength:
	bne $t5, $zero, Hloop		
	addi $t5, $t6, 2
	j Hloop
Hend:			# Close the file 
	li   $v0, 16       # system call for close file
	move $a0, $s6      # file descriptor to close
	syscall            # close file
##########################################################		file	end				
	j goBack 
iWords:
	lb $t1, 8($a1)		
	bne $t0, $t1, jWords
##########################################################		file	begin	
	#open a file for writing
	li   $v0, 13       # system call for open file
	la   $a0, Ifile    # board file name
	li   $a1, 0        # Open for reading
	li   $a2, 0
	syscall            # open a file (file descriptor returned in $v0)
	move $s6, $v0      # save the file descriptor 

	#read from file
	li   $v0, 14       # system call for read from file
	move $a0, $s6      # file descriptor 
	la   $a1, buffer   # address of buffer to which to read
	li   $a2, 200000       # hardcoded buffer length
	syscall            # read from file
	
	add $t1, $zero, $zero
	lb $t3, newline
Iloop:	
	lb $t0, buffer($t2)
	addi $t2, $t2, 1
	beq $t0, $t1, Iend	#branch if it's the end of the file	
	bne $t0, $t3, Iloop	#branch if it's not a newline
	beq $t5, $zero, IfirstStart
	addi $t5, $t6, 2
IfirstStart:	
	subi $t6, $t2, 2		# $t5 to $t6 holds a word from file	
	
	sub $t8, $t6, $t5
	addi $t8, $t8, 1
	
	bne $t8, $a3, InotLength
			#holds word of correct length
	addi $t6, $t6, 1
	add $t9, $t5, $zero
	add $s2, $zero, $zero
Ido:	lb $s0, buffer($t9)	#compares ith letter of myword to ith letter of word in dictionary
	lb $s1, userInput($s2)
	bne $s0, $s1, Inotword
	
	addi $t9, $t9, 1
	addi $s2, $s2, 1		
	bne $t9, $t6, Ido	#loop that iterates whole word through $t5
	
	addi $v1, $zero, 1		# return 1 for true, ie word exists
	
	j Iend
Inotword:
	subi $t6, $t6, 1			
InotLength:
	bne $t5, $zero, Iloop		
	addi $t5, $t6, 2
	j Iloop
Iend:			# Close the file 
	li   $v0, 16       # system call for close file
	move $a0, $s6      # file descriptor to close
	syscall            # close file
##########################################################		file	end				
	j goBack 	
jWords:
	lb $t1, 9($a1)		
	bne $t0, $t1, kWords
##########################################################		file	begin	
	#open a file for writing
	li   $v0, 13       # system call for open file
	la   $a0, Jfile    # board file name
	li   $a1, 0        # Open for reading
	li   $a2, 0
	syscall            # open a file (file descriptor returned in $v0)
	move $s6, $v0      # save the file descriptor 

	#read from file
	li   $v0, 14       # system call for read from file
	move $a0, $s6      # file descriptor 
	la   $a1, buffer   # address of buffer to which to read
	li   $a2, 200000       # hardcoded buffer length
	syscall            # read from file
	
	add $t1, $zero, $zero
	lb $t3, newline
Jloop:	
	lb $t0, buffer($t2)
	addi $t2, $t2, 1
	beq $t0, $t1, Jend	#branch if it's the end of the file	
	bne $t0, $t3, Jloop	#branch if it's not a newline
	beq $t5, $zero, JfirstStart
	addi $t5, $t6, 2
JfirstStart:	
	subi $t6, $t2, 2		# $t5 to $t6 holds a word from file	
	
	sub $t8, $t6, $t5
	addi $t8, $t8, 1
	
	bne $t8, $a3, JnotLength
			#holds word of correct length
	addi $t6, $t6, 1
	add $t9, $t5, $zero
	add $s2, $zero, $zero
Jdo:	lb $s0, buffer($t9)	#compares ith letter of myword to ith letter of word in dictionary
	lb $s1, userInput($s2)
	bne $s0, $s1, Jnotword
	
	addi $t9, $t9, 1
	addi $s2, $s2, 1		
	bne $t9, $t6, Jdo	#loop that iterates whole word through $t5
	
	addi $v1, $zero, 1		# return 1 for true, ie word exists
	
	j Jend
Jnotword:
	subi $t6, $t6, 1			
JnotLength:
	bne $t5, $zero, Jloop		
	addi $t5, $t6, 2
	j Jloop
Jend:			# Close the file 
	li   $v0, 16       # system call for close file
	move $a0, $s6      # file descriptor to close
	syscall            # close file
##########################################################		file	end				
	j goBack 
kWords:
	lb $t1, 10($a1)		
	bne $t0, $t1, lWords
##########################################################		file	begin	
	#open a file for writing
	li   $v0, 13       # system call for open file
	la   $a0, Kfile    # board file name
	li   $a1, 0        # Open for reading
	li   $a2, 0
	syscall            # open a file (file descriptor returned in $v0)
	move $s6, $v0      # save the file descriptor 

	#read from file
	li   $v0, 14       # system call for read from file
	move $a0, $s6      # file descriptor 
	la   $a1, buffer   # address of buffer to which to read
	li   $a2, 200000       # hardcoded buffer length
	syscall            # read from file
	
	add $t1, $zero, $zero
	lb $t3, newline
Kloop:	
	lb $t0, buffer($t2)
	addi $t2, $t2, 1
	beq $t0, $t1, Kend	#branch if it's the end of the file	
	bne $t0, $t3, Kloop	#branch if it's not a newline
	beq $t5, $zero, KfirstStart
	addi $t5, $t6, 2
KfirstStart:	
	subi $t6, $t2, 2		# $t5 to $t6 holds a word from file	
	
	sub $t8, $t6, $t5
	addi $t8, $t8, 1
	
	bne $t8, $a3, KnotLength
			#holds word of correct length
	addi $t6, $t6, 1
	add $t9, $t5, $zero
	add $s2, $zero, $zero
Kdo:	lb $s0, buffer($t9)	#compares ith letter of myword to ith letter of word in dictionary
	lb $s1, userInput($s2)
	bne $s0, $s1, Knotword
	
	addi $t9, $t9, 1
	addi $s2, $s2, 1		
	bne $t9, $t6, Kdo	#loop that iterates whole word through $t5
	
	addi $v1, $zero, 1		# return 1 for true, ie word exists
	
	j Kend
Knotword:
	subi $t6, $t6, 1			
KnotLength:
	bne $t5, $zero, Kloop		
	addi $t5, $t6, 2
	j Kloop
Kend:			# Close the file 
	li   $v0, 16       # system call for close file
	move $a0, $s6      # file descriptor to close
	syscall            # close file
##########################################################		file	end				
	j goBack 
lWords:
	lb $t1, 11($a1)		
	bne $t0, $t1, mWords
##########################################################		file	begin	
	#open a file for writing
	li   $v0, 13       # system call for open file
	la   $a0, Lfile    # board file name
	li   $a1, 0        # Open for reading
	li   $a2, 0
	syscall            # open a file (file descriptor returned in $v0)
	move $s6, $v0      # save the file descriptor 

	#read from file
	li   $v0, 14       # system call for read from file
	move $a0, $s6      # file descriptor 
	la   $a1, buffer   # address of buffer to which to read
	li   $a2, 200000       # hardcoded buffer length
	syscall            # read from file
	
	add $t1, $zero, $zero
	lb $t3, newline
Lloop:	
	lb $t0, buffer($t2)
	addi $t2, $t2, 1
	beq $t0, $t1, Lend	#branch if it's the end of the file	
	bne $t0, $t3, Lloop	#branch if it's not a newline
	beq $t5, $zero, LfirstStart
	addi $t5, $t6, 2
LfirstStart:	
	subi $t6, $t2, 2		# $t5 to $t6 holds a word from file	
	
	sub $t8, $t6, $t5
	addi $t8, $t8, 1
	
	bne $t8, $a3, LnotLength
			#holds word of correct length
	addi $t6, $t6, 1
	add $t9, $t5, $zero
	add $s2, $zero, $zero
Ldo:	lb $s0, buffer($t9)	#compares ith letter of myword to ith letter of word in dictionary
	lb $s1, userInput($s2)
	bne $s0, $s1, Lnotword
	
	addi $t9, $t9, 1
	addi $s2, $s2, 1		
	bne $t9, $t6, Ldo	#loop that iterates whole word through $t5
	
	addi $v1, $zero, 1		# return 1 for true, ie word exists
	
	j Lend
Lnotword:
	subi $t6, $t6, 1			
LnotLength:
	bne $t5, $zero, Lloop		
	addi $t5, $t6, 2
	j Lloop
Lend:			# Close the file 
	li   $v0, 16       # system call for close file
	move $a0, $s6      # file descriptor to close
	syscall            # close file
##########################################################		file	end				
	j goBack 
mWords:
	lb $t1, 12($a1)		
	bne $t0, $t1, nWords
##########################################################		file	begin	
	#open a file for writing
	li   $v0, 13       # system call for open file
	la   $a0, Mfile    # board file name
	li   $a1, 0        # Open for reading
	li   $a2, 0
	syscall            # open a file (file descriptor returned in $v0)
	move $s6, $v0      # save the file descriptor 

	#read from file
	li   $v0, 14       # system call for read from file
	move $a0, $s6      # file descriptor 
	la   $a1, buffer   # address of buffer to which to read
	li   $a2, 200000       # hardcoded buffer length
	syscall            # read from file
	
	add $t1, $zero, $zero
	lb $t3, newline
Mloop:	
	lb $t0, buffer($t2)
	addi $t2, $t2, 1
	beq $t0, $t1, Mend	#branch if it's the end of the file	
	bne $t0, $t3, Mloop	#branch if it's not a newline
	beq $t5, $zero, MfirstStart
	addi $t5, $t6, 2
MfirstStart:	
	subi $t6, $t2, 2		# $t5 to $t6 holds a word from file	
	
	sub $t8, $t6, $t5
	addi $t8, $t8, 1
	
	bne $t8, $a3, MnotLength
			#holds word of correct length
	addi $t6, $t6, 1
	add $t9, $t5, $zero
	add $s2, $zero, $zero
Mdo:	lb $s0, buffer($t9)	#compares ith letter of myword to ith letter of word in dictionary
	lb $s1, userInput($s2)
	bne $s0, $s1, Mnotword
	
	addi $t9, $t9, 1
	addi $s2, $s2, 1		
	bne $t9, $t6, Mdo	#loop that iterates whole word through $t5
	
	addi $v1, $zero, 1		# return 1 for true, ie word exists
	
	j Mend
Mnotword:
	subi $t6, $t6, 1			
MnotLength:
	bne $t5, $zero, Mloop		
	addi $t5, $t6, 2
	j Mloop
Mend:			# Close the file 
	li   $v0, 16       # system call for close file
	move $a0, $s6      # file descriptor to close
	syscall            # close file
##########################################################		file	end				
	j goBack 
nWords:
	lb $t1, 13($a1)		
	bne $t0, $t1, oWords
##########################################################		file	begin	
	#open a file for writing
	li   $v0, 13       # system call for open file
	la   $a0, Nfile    # board file name
	li   $a1, 0        # Open for reading
	li   $a2, 0
	syscall            # open a file (file descriptor returned in $v0)
	move $s6, $v0      # save the file descriptor 

	#read from file
	li   $v0, 14       # system call for read from file
	move $a0, $s6      # file descriptor 
	la   $a1, buffer   # address of buffer to which to read
	li   $a2, 2000000       # hardcoded buffer length
	syscall            # read from file
	
	add $t1, $zero, $zero
	lb $t3, newline
Nloop:	
	lb $t0, buffer($t2)
	addi $t2, $t2, 1
	beq $t0, $t1, Nend	#branch if it's the end of the file	
	bne $t0, $t3, Nloop	#branch if it's not a newline
	beq $t5, $zero, NfirstStart
	addi $t5, $t6, 2
NfirstStart:	
	subi $t6, $t2, 2		# $t5 to $t6 holds a word from file	
	
	sub $t8, $t6, $t5
	addi $t8, $t8, 1
	
	bne $t8, $a3, NnotLength
			#holds word of correct length
	addi $t6, $t6, 1
	add $t9, $t5, $zero
	add $s2, $zero, $zero
Ndo:	lb $s0, buffer($t9)	#compares ith letter of myword to ith letter of word in dictionary
	lb $s1, userInput($s2)
	bne $s0, $s1, Nnotword
	
	addi $t9, $t9, 1
	addi $s2, $s2, 1		
	bne $t9, $t6, Ndo	#loop that iterates whole word through $t5
	
	addi $v1, $zero, 1		# return 1 for true, ie word exists
	
	j Nend
Nnotword:
	subi $t6, $t6, 1			
NnotLength:
	bne $t5, $zero, Nloop		
	addi $t5, $t6, 2
	j Nloop
Nend:			# Close the file 
	li   $v0, 16       # system call for close file
	move $a0, $s6      # file descriptor to close
	syscall            # close file
##########################################################		file	end				
	j goBack 
oWords:
	lb $t1, 14($a1)		
	bne $t0, $t1, pWords
##########################################################		file	begin	
	#open a file for writing
	li   $v0, 13       # system call for open file
	la   $a0, Ofile    # board file name
	li   $a1, 0        # Open for reading
	li   $a2, 0
	syscall            # open a file (file descriptor returned in $v0)
	move $s6, $v0      # save the file descriptor 

	#read from file
	li   $v0, 14       # system call for read from file
	move $a0, $s6      # file descriptor 
	la   $a1, buffer   # address of buffer to which to read
	li   $a2, 2000000       # hardcoded buffer length
	syscall            # read from file
	
	add $t1, $zero, $zero
	lb $t3, newline
Oloop:	
	lb $t0, buffer($t2)
	addi $t2, $t2, 1
	beq $t0, $t1, Oend	#branch if it's the end of the file	
	bne $t0, $t3, Oloop	#branch if it's not a newline
	beq $t5, $zero, OfirstStart
	addi $t5, $t6, 2
OfirstStart:	
	subi $t6, $t2, 2		# $t5 to $t6 holds a word from file	
	
	sub $t8, $t6, $t5
	addi $t8, $t8, 1
	
	bne $t8, $a3, OnotLength
			#holds word of correct length
	addi $t6, $t6, 1
	add $t9, $t5, $zero
	add $s2, $zero, $zero
Odo:	lb $s0, buffer($t9)	#compares ith letter of myword to ith letter of word in dictionary
	lb $s1, userInput($s2)
	bne $s0, $s1, Onotword
	
	addi $t9, $t9, 1
	addi $s2, $s2, 1		
	bne $t9, $t6, Odo	#loop that iterates whole word through $t5
	
	addi $v1, $zero, 1		# return 1 for true, ie word exists
	
	j Oend
Onotword:
	subi $t6, $t6, 1			
OnotLength:
	bne $t5, $zero, Oloop		
	addi $t5, $t6, 2
	j Oloop
Oend:			# Close the file 
	li   $v0, 16       # system call for close file
	move $a0, $s6      # file descriptor to close
	syscall            # close file
##########################################################		file	end				
	j goBack 
pWords:
	lb $t1, 15($a1)		
	bne $t0, $t1, qWords
##########################################################		file	begin	
	#open a file for writing
	li   $v0, 13       # system call for open file
	la   $a0, Pfile    # board file name
	li   $a1, 0        # Open for reading
	li   $a2, 0
	syscall            # open a file (file descriptor returned in $v0)
	move $s6, $v0      # save the file descriptor 

	#read from file
	li   $v0, 14       # system call for read from file
	move $a0, $s6      # file descriptor 
	la   $a1, buffer   # address of buffer to which to read
	li   $a2, 2000000       # hardcoded buffer length
	syscall            # read from file
	
	add $t1, $zero, $zero
	lb $t3, newline
Ploop:	
	lb $t0, buffer($t2)
	addi $t2, $t2, 1
	beq $t0, $t1, Pend	#branch if it's the end of the file	
	bne $t0, $t3, Ploop	#branch if it's not a newline
	beq $t5, $zero, PfirstStart
	addi $t5, $t6, 2
PfirstStart:	
	subi $t6, $t2, 2		# $t5 to $t6 holds a word from file	
	
	sub $t8, $t6, $t5
	addi $t8, $t8, 1
	
	bne $t8, $a3, PnotLength
			#holds word of correct length
	addi $t6, $t6, 1
	add $t9, $t5, $zero
	add $s2, $zero, $zero
Pdo:	lb $s0, buffer($t9)	#compares ith letter of myword to ith letter of word in dictionary
	lb $s1, userInput($s2)
	bne $s0, $s1, Pnotword
	
	addi $t9, $t9, 1
	addi $s2, $s2, 1		
	bne $t9, $t6, Pdo	#loop that iterates whole word through $t5
	
	addi $v1, $zero, 1		# return 1 for true, ie word exists
	
	j Pend
Pnotword:
	subi $t6, $t6, 1			
PnotLength:
	bne $t5, $zero, Ploop		
	addi $t5, $t6, 2
	j Ploop
Pend:			# Close the file 
	li   $v0, 16       # system call for close file
	move $a0, $s6      # file descriptor to close
	syscall            # close file
##########################################################		file	end				
	j goBack 
qWords:
	lb $t1, 16($a1)		
	bne $t0, $t1, rWords
##########################################################		file	begin	
	#open a file for writing
	li   $v0, 13       # system call for open file
	la   $a0, Qfile    # board file name
	li   $a1, 0        # Open for reading
	li   $a2, 0
	syscall            # open a file (file descriptor returned in $v0)
	move $s6, $v0      # save the file descriptor 

	#read from file
	li   $v0, 14       # system call for read from file
	move $a0, $s6      # file descriptor 
	la   $a1, buffer   # address of buffer to which to read
	li   $a2, 2000000       # hardcoded buffer length
	syscall            # read from file
	
	add $t1, $zero, $zero
	lb $t3, newline
Qloop:	
	lb $t0, buffer($t2)
	addi $t2, $t2, 1
	beq $t0, $t1, Qend	#branch if it's the end of the file	
	bne $t0, $t3, Qloop	#branch if it's not a newline
	beq $t5, $zero, QfirstStart
	addi $t5, $t6, 2
QfirstStart:	
	subi $t6, $t2, 2		# $t5 to $t6 holds a word from file	
	
	sub $t8, $t6, $t5
	addi $t8, $t8, 1
	
	bne $t8, $a3, QnotLength
			#holds word of correct length
	addi $t6, $t6, 1
	add $t9, $t5, $zero
	add $s2, $zero, $zero
Qdo:	lb $s0, buffer($t9)	#compares ith letter of myword to ith letter of word in dictionary
	lb $s1, userInput($s2)
	bne $s0, $s1, Qnotword
	
	addi $t9, $t9, 1
	addi $s2, $s2, 1		
	bne $t9, $t6, Qdo	#loop that iterates whole word through $t5
	
	addi $v1, $zero, 1		# return 1 for true, ie word exists
	
	j Qend
Qnotword:
	subi $t6, $t6, 1			
QnotLength:
	bne $t5, $zero, Qloop		
	addi $t5, $t6, 2
	j Qloop
Qend:			# Close the file 
	li   $v0, 16       # system call for close file
	move $a0, $s6      # file descriptor to close
	syscall            # close file
##########################################################		file	end				
	j goBack 
rWords:
	lb $t1, 17($a1)		
	bne $t0, $t1, sWords
##########################################################		file	begin	
	#open a file for writing
	li   $v0, 13       # system call for open file
	la   $a0, Rfile    # board file name
	li   $a1, 0        # Open for reading
	li   $a2, 0
	syscall            # open a file (file descriptor returned in $v0)
	move $s6, $v0      # save the file descriptor 

	#read from file
	li   $v0, 14       # system call for read from file
	move $a0, $s6      # file descriptor 
	la   $a1, buffer   # address of buffer to which to read
	li   $a2, 2000000       # hardcoded buffer length
	syscall            # read from file
	
	add $t1, $zero, $zero
	lb $t3, newline
Rloop:	
	lb $t0, buffer($t2)
	addi $t2, $t2, 1
	beq $t0, $t1, Rend	#branch if it's the end of the file	
	bne $t0, $t3, Rloop	#branch if it's not a newline
	beq $t5, $zero, RfirstStart
	addi $t5, $t6, 2
RfirstStart:	
	subi $t6, $t2, 2		# $t5 to $t6 holds a word from file	
	
	sub $t8, $t6, $t5
	addi $t8, $t8, 1
	
	bne $t8, $a3, RnotLength
			#holds word of correct length
	addi $t6, $t6, 1
	add $t9, $t5, $zero
	add $s2, $zero, $zero
Rdo:	lb $s0, buffer($t9)	#compares ith letter of myword to ith letter of word in dictionary
	lb $s1, userInput($s2)
	bne $s0, $s1, Rnotword
	
	addi $t9, $t9, 1
	addi $s2, $s2, 1		
	bne $t9, $t6, Rdo	#loop that iterates whole word through $t5
	
	addi $v1, $zero, 1		# return 1 for true, ie word exists
	
	j Rend
Rnotword:
	subi $t6, $t6, 1			
RnotLength:
	bne $t5, $zero, Rloop		
	addi $t5, $t6, 2
	j Rloop
Rend:			# Close the file 
	li   $v0, 16       # system call for close file
	move $a0, $s6      # file descriptor to close
	syscall            # close file
##########################################################		file	end				
	j goBack 
sWords:
	lb $t1, 18($a1)		
	bne $t0, $t1, tWords
##########################################################		file	begin	
	#open a file for writing
	li   $v0, 13       # system call for open file
	la   $a0, Sfile    # board file name
	li   $a1, 0        # Open for reading
	li   $a2, 0
	syscall            # open a file (file descriptor returned in $v0)
	move $s6, $v0      # save the file descriptor 

	#read from file
	li   $v0, 14       # system call for read from file
	move $a0, $s6      # file descriptor 
	la   $a1, buffer   # address of buffer to which to read
	li   $a2, 2000000       # hardcoded buffer length
	syscall            # read from file
	
	add $t1, $zero, $zero
	lb $t3, newline
Sloop:	
	lb $t0, buffer($t2)
	addi $t2, $t2, 1
	beq $t0, $t1, Send	#branch if it's the end of the file	
	bne $t0, $t3, Sloop	#branch if it's not a newline
	beq $t5, $zero, SfirstStart
	addi $t5, $t6, 2
SfirstStart:	
	subi $t6, $t2, 2		# $t5 to $t6 holds a word from file	
	
	sub $t8, $t6, $t5
	addi $t8, $t8, 1
	
	bne $t8, $a3, SnotLength
			#holds word of correct length
	addi $t6, $t6, 1
	add $t9, $t5, $zero
	add $s2, $zero, $zero
Sdo:	lb $s0, buffer($t9)	#compares ith letter of myword to ith letter of word in dictionary
	lb $s1, userInput($s2)
	bne $s0, $s1, Snotword
	
	addi $t9, $t9, 1
	addi $s2, $s2, 1		
	bne $t9, $t6, Sdo	#loop that iterates whole word through $t5
	
	addi $v1, $zero, 1		# return 1 for true, ie word exists
	
	j Send
Snotword:
	subi $t6, $t6, 1			
SnotLength:
	bne $t5, $zero, Sloop		
	addi $t5, $t6, 2
	j Sloop
Send:			# Close the file 
	li   $v0, 16       # system call for close file
	move $a0, $s6      # file descriptor to close
	syscall            # close file
##########################################################		file	end		
	j goBack 
tWords:
	lb $t1, 19($a1)		
	bne $t0, $t1, uWords
##########################################################		file	begin	
	#open a file for writing
	li   $v0, 13       # system call for open file
	la   $a0, Tfile    # board file name
	li   $a1, 0        # Open for reading
	li   $a2, 0
	syscall            # open a file (file descriptor returned in $v0)
	move $s6, $v0      # save the file descriptor 

	#read from file
	li   $v0, 14       # system call for read from file
	move $a0, $s6      # file descriptor 
	la   $a1, buffer   # address of buffer to which to read
	li   $a2, 2000000       # hardcoded buffer length
	syscall            # read from file
	
	add $t1, $zero, $zero
	lb $t3, newline
Tloop:	
	lb $t0, buffer($t2)
	addi $t2, $t2, 1
	beq $t0, $t1, Tend	#branch if it's the end of the file	
	bne $t0, $t3, Tloop	#branch if it's not a newline
	beq $t5, $zero, TfirstStart
	addi $t5, $t6, 2
TfirstStart:	
	subi $t6, $t2, 2		# $t5 to $t6 holds a word from file	
	
	sub $t8, $t6, $t5
	addi $t8, $t8, 1
	
	bne $t8, $a3, TnotLength
			#holds word of correct length
	addi $t6, $t6, 1
	add $t9, $t5, $zero
	add $s2, $zero, $zero
Tdo:	lb $s0, buffer($t9)	#compares ith letter of myword to ith letter of word in dictionary
	lb $s1, userInput($s2)
	bne $s0, $s1, Tnotword
	
	addi $t9, $t9, 1
	addi $s2, $s2, 1		
	bne $t9, $t6, Tdo	#loop that iterates whole word through $t5
	
	addi $v1, $zero, 1		# return 1 for true, ie word exists
	
	j Tend
Tnotword:
	subi $t6, $t6, 1			
TnotLength:
	bne $t5, $zero, Tloop		
	addi $t5, $t6, 2
	j Tloop
Tend:			# Close the file 
	li   $v0, 16       # system call for close file
	move $a0, $s6      # file descriptor to close
	syscall            # close file
##########################################################		file	end		
	j goBack 
uWords:
	lb $t1, 20($a1)		
	bne $t0, $t1, vWords
##########################################################		file	begin	
	#open a file for writing
	li   $v0, 13       # system call for open file
	la   $a0, Ufile    # board file name
	li   $a1, 0        # Open for reading
	li   $a2, 0
	syscall            # open a file (file descriptor returned in $v0)
	move $s6, $v0      # save the file descriptor 

	#read from file
	li   $v0, 14       # system call for read from file
	move $a0, $s6      # file descriptor 
	la   $a1, buffer   # address of buffer to which to read
	li   $a2, 2000000       # hardcoded buffer length
	syscall            # read from file
	
	add $t1, $zero, $zero
	lb $t3, newline
Uloop:	
	lb $t0, buffer($t2)
	addi $t2, $t2, 1
	beq $t0, $t1, Uend	#branch if it's the end of the file	
	bne $t0, $t3, Uloop	#branch if it's not a newline
	beq $t5, $zero, UfirstStart
	addi $t5, $t6, 2
UfirstStart:	
	subi $t6, $t2, 2		# $t5 to $t6 holds a word from file	
	
	sub $t8, $t6, $t5
	addi $t8, $t8, 1
	
	bne $t8, $a3, UnotLength
			#holds word of correct length
	addi $t6, $t6, 1
	add $t9, $t5, $zero
	add $s2, $zero, $zero
Udo:	lb $s0, buffer($t9)	#compares ith letter of myword to ith letter of word in dictionary
	lb $s1, userInput($s2)
	bne $s0, $s1, Unotword
	
	addi $t9, $t9, 1
	addi $s2, $s2, 1		
	bne $t9, $t6, Udo	#loop that iterates whole word through $t5
	
	addi $v1, $zero, 1		# return 1 for true, ie word exists
	
	j Uend
Unotword:
	subi $t6, $t6, 1			
UnotLength:
	bne $t5, $zero, Uloop		
	addi $t5, $t6, 2
	j Uloop
Uend:			# Close the file 
	li   $v0, 16       # system call for close file
	move $a0, $s6      # file descriptor to close
	syscall            # close file
##########################################################		file	end		
	j goBack 
vWords:
	lb $t1, 21($a1)		
	bne $t0, $t1, wWords
##########################################################		file	begin	
	#open a file for writing
	li   $v0, 13       # system call for open file
	la   $a0, Vfile    # board file name
	li   $a1, 0        # Open for reading
	li   $a2, 0
	syscall            # open a file (file descriptor returned in $v0)
	move $s6, $v0      # save the file descriptor 

	#read from file
	li   $v0, 14       # system call for read from file
	move $a0, $s6      # file descriptor 
	la   $a1, buffer   # address of buffer to which to read
	li   $a2, 2000000       # hardcoded buffer length
	syscall            # read from file
	
	add $t1, $zero, $zero
	lb $t3, newline
Vloop:	
	lb $t0, buffer($t2)
	addi $t2, $t2, 1
	beq $t0, $t1, Vend	#branch if it's the end of the file	
	bne $t0, $t3, Vloop	#branch if it's not a newline
	beq $t5, $zero, VfirstStart
	addi $t5, $t6, 2
VfirstStart:	
	subi $t6, $t2, 2		# $t5 to $t6 holds a word from file	
	
	sub $t8, $t6, $t5
	addi $t8, $t8, 1
	
	bne $t8, $a3, VnotLength
			#holds word of correct length
	addi $t6, $t6, 1
	add $t9, $t5, $zero
	add $s2, $zero, $zero
Vdo:	lb $s0, buffer($t9)	#compares ith letter of myword to ith letter of word in dictionary
	lb $s1, userInput($s2)
	bne $s0, $s1, Vnotword
	
	addi $t9, $t9, 1
	addi $s2, $s2, 1		
	bne $t9, $t6, Vdo	#loop that iterates whole word through $t5
	
	addi $v1, $zero, 1		# return 1 for true, ie word exists
	
	j Vend
Vnotword:
	subi $t6, $t6, 1			
VnotLength:
	bne $t5, $zero, Vloop		
	addi $t5, $t6, 2
	j Vloop
Vend:			# Close the file 
	li   $v0, 16       # system call for close file
	move $a0, $s6      # file descriptor to close
	syscall            # close file
##########################################################		file	end		
	j goBack 
wWords:
	lb $t1, 22($a1)		
	bne $t0, $t1, xWords
##########################################################		file	begin	
	#open a file for writing
	li   $v0, 13       # system call for open file
	la   $a0, Wfile    # board file name
	li   $a1, 0        # Open for reading
	li   $a2, 0
	syscall            # open a file (file descriptor returned in $v0)
	move $s6, $v0      # save the file descriptor 

	#read from file
	li   $v0, 14       # system call for read from file
	move $a0, $s6      # file descriptor 
	la   $a1, buffer   # address of buffer to which to read
	li   $a2, 2000000       # hardcoded buffer length
	syscall            # read from file
	
	add $t1, $zero, $zero
	lb $t3, newline
Wloop:	
	lb $t0, buffer($t2)
	addi $t2, $t2, 1
	beq $t0, $t1, Wend	#branch if it's the end of the file	
	bne $t0, $t3, Wloop	#branch if it's not a newline
	beq $t5, $zero, WfirstStart
	addi $t5, $t6, 2
WfirstStart:	
	subi $t6, $t2, 2		# $t5 to $t6 holds a word from file	
	
	sub $t8, $t6, $t5
	addi $t8, $t8, 1
	
	bne $t8, $a3, WnotLength
			#holds word of correct length
	addi $t6, $t6, 1
	add $t9, $t5, $zero
	add $s2, $zero, $zero
Wdo:	lb $s0, buffer($t9)	#compares ith letter of myword to ith letter of word in dictionary
	lb $s1, userInput($s2)
	bne $s0, $s1, Wnotword
	
	addi $t9, $t9, 1
	addi $s2, $s2, 1		
	bne $t9, $t6, Wdo	#loop that iterates whole word through $t5
	
	addi $v1, $zero, 1		# return 1 for true, ie word exists
	
	j Wend
Wnotword:
	subi $t6, $t6, 1			
WnotLength:
	bne $t5, $zero, Wloop		
	addi $t5, $t6, 2
	j Wloop
Wend:			# Close the file 
	li   $v0, 16       # system call for close file
	move $a0, $s6      # file descriptor to close
	syscall            # close file
##########################################################		file	end		
	j goBack 
xWords:
	lb $t1, 23($a1)		
	bne $t0, $t1, yWords
##########################################################		file	begin	
	#open a file for writing
	li   $v0, 13       # system call for open file
	la   $a0, Xfile    # board file name
	li   $a1, 0        # Open for reading
	li   $a2, 0
	syscall            # open a file (file descriptor returned in $v0)
	move $s6, $v0      # save the file descriptor 

	#read from file
	li   $v0, 14       # system call for read from file
	move $a0, $s6      # file descriptor 
	la   $a1, buffer   # address of buffer to which to read
	li   $a2, 2000000       # hardcoded buffer length
	syscall            # read from file
	
	add $t1, $zero, $zero
	lb $t3, newline
Xloop:	
	lb $t0, buffer($t2)
	addi $t2, $t2, 1
	beq $t0, $t1, Xend	#branch if it's the end of the file	
	bne $t0, $t3, Xloop	#branch if it's not a newline
	beq $t5, $zero, XfirstStart
	addi $t5, $t6, 2
XfirstStart:	
	subi $t6, $t2, 2		# $t5 to $t6 holds a word from file	
	
	sub $t8, $t6, $t5
	addi $t8, $t8, 1
	
	bne $t8, $a3, XnotLength
			#holds word of correct length
	addi $t6, $t6, 1
	add $t9, $t5, $zero
	add $s2, $zero, $zero
Xdo:	lb $s0, buffer($t9)	#compares ith letter of myword to ith letter of word in dictionary
	lb $s1, userInput($s2)
	bne $s0, $s1, Xnotword
	
	addi $t9, $t9, 1
	addi $s2, $s2, 1		
	bne $t9, $t6, Xdo	#loop that iterates whole word through $t5
	
	addi $v1, $zero, 1		# return 1 for true, ie word exists
	
	j Xend
Xnotword:
	subi $t6, $t6, 1			
XnotLength:
	bne $t5, $zero, Xloop		
	addi $t5, $t6, 2
	j Xloop
Xend:			# Close the file 
	li   $v0, 16       # system call for close file
	move $a0, $s6      # file descriptor to close
	syscall            # close file
##########################################################		file	end		
	j goBack 
yWords:
	lb $t1, 24($a1)		
	bne $t0, $t1, zWords
##########################################################		file	begin	
	#open a file for writing
	li   $v0, 13       # system call for open file
	la   $a0, Yfile    # board file name
	li   $a1, 0        # Open for reading
	li   $a2, 0
	syscall            # open a file (file descriptor returned in $v0)
	move $s6, $v0      # save the file descriptor 

	#read from file
	li   $v0, 14       # system call for read from file
	move $a0, $s6      # file descriptor 
	la   $a1, buffer   # address of buffer to which to read
	li   $a2, 2000000       # hardcoded buffer length
	syscall            # read from file
	
	add $t1, $zero, $zero
	lb $t3, newline
Yloop:	
	lb $t0, buffer($t2)
	addi $t2, $t2, 1
	beq $t0, $t1, Yend	#branch if it's the end of the file	
	bne $t0, $t3, Yloop	#branch if it's not a newline
	beq $t5, $zero, YfirstStart
	addi $t5, $t6, 2
YfirstStart:	
	subi $t6, $t2, 2		# $t5 to $t6 holds a word from file	
	
	sub $t8, $t6, $t5
	addi $t8, $t8, 1
	
	bne $t8, $a3, YnotLength
			#holds word of correct length
	addi $t6, $t6, 1
	add $t9, $t5, $zero
	add $s2, $zero, $zero
Ydo:	lb $s0, buffer($t9)	#compares ith letter of myword to ith letter of word in dictionary
	lb $s1, userInput($s2)
	bne $s0, $s1, Ynotword
	
	addi $t9, $t9, 1
	addi $s2, $s2, 1		
	bne $t9, $t6, Ydo	#loop that iterates whole word through $t5
	
	addi $v1, $zero, 1		# return 1 for true, ie word exists
	
	j Yend
Ynotword:
	subi $t6, $t6, 1			
YnotLength:
	bne $t5, $zero, Yloop		
	addi $t5, $t6, 2
	j Yloop
Yend:			# Close the file 
	li   $v0, 16       # system call for close file
	move $a0, $s6      # file descriptor to close
	syscall            # close file
##########################################################		file	end		
	j goBack 
zWords:
##########################################################		file	begin	
	#open a file for writing
	li   $v0, 13       # system call for open file
	la   $a0, Zfile    # board file name
	li   $a1, 0        # Open for reading
	li   $a2, 0
	syscall            # open a file (file descriptor returned in $v0)
	move $s6, $v0      # save the file descriptor 

	#read from file
	li   $v0, 14       # system call for read from file
	move $a0, $s6      # file descriptor 
	la   $a1, buffer   # address of buffer to which to read
	li   $a2, 2000000       # hardcoded buffer length
	syscall            # read from file
	
	add $t1, $zero, $zero
	lb $t3, newline
Zloop:	
	lb $t0, buffer($t2)
	addi $t2, $t2, 1
	beq $t0, $t1, Zend	#branch if it's the end of the file	
	bne $t0, $t3, Zloop	#branch if it's not a newline
	beq $t5, $zero, ZfirstStart
	addi $t5, $t6, 2
ZfirstStart:	
	subi $t6, $t2, 2		# $t5 to $t6 holds a word from file	
	
	sub $t8, $t6, $t5
	addi $t8, $t8, 1
	
	bne $t8, $a3, ZnotLength
			#holds word of correct length
	addi $t6, $t6, 1
	add $t9, $t5, $zero
	add $s2, $zero, $zero
Zdo:	lb $s0, buffer($t9)	#compares ith letter of myword to ith letter of word in dictionary
	lb $s1, userInput($s2)
	bne $s0, $s1, Znotword
	
	addi $t9, $t9, 1
	addi $s2, $s2, 1		
	bne $t9, $t6, Zdo	#loop that iterates whole word through $t5
	
	addi $v1, $zero, 1		# return 1 for true, ie word exists
	
	j Zend
Znotword:
	subi $t6, $t6, 1			
ZnotLength:
	bne $t5, $zero, Zloop		
	addi $t5, $t6, 2
	j Zloop
Zend:			# Close the file 
	li   $v0, 16       # system call for close file
	move $a0, $s6      # file descriptor to close
	syscall            # close file
##########################################################		file	end		
	 
goBack:
	
endCheckWordDictionary:		
	add $t0, $zero, $zero
	beq $v1, $t0, invalidWord 
	
	j validWord
invalidWord:
	#will jump back to the correct label in main here
	li $v0, 4				
	la $a0, invalidWordMessage		
	syscall	
	
	add $v0, $zero, $zero
	add $v1, $zero, $zero
	add $a0, $zero, $zero
	add $a1, $zero, $zero
	add $a2, $zero, $zero
	add $a3, $zero, $zero
	add $t0, $zero, $zero
	add $t1, $zero, $zero
	add $t2, $zero, $zero
	add $t3, $zero, $zero
	add $t4, $zero, $zero
	add $t5, $zero, $zero
	add $t6, $zero, $zero
	add $t7, $zero, $zero
	add $t8, $zero, $zero
	add $s1, $zero, $zero
	add $s2, $zero, $zero				
													
	j userInputFunction			
validWord:
	#will jump back to the correct label in main here
	li $v0, 4				
	la $a0, validWordMessage		
	syscall	
	
	add $v0, $zero, $zero
	add $v1, $zero, $zero
	add $a0, $zero, $zero
	add $a1, $zero, $zero
	add $a2, $zero, $zero
	add $a3, $zero, $zero
	add $t0, $zero, $zero
	add $t1, $zero, $zero
	add $t2, $zero, $zero
	add $t3, $zero, $zero
	add $t4, $zero, $zero
	add $t5, $zero, $zero
	add $t6, $zero, $zero
	add $t7, $zero, $zero
	add $t8, $zero, $zero
	add $s1, $zero, $zero
	add $s2, $zero, $zero
	
	j validUserInput	
	

