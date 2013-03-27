# Mastermind -- A game of sequences

# Main text of the program
		.text
main:
		la		$a0, welcome_msg		# load the addr of welcome_msg into $a0
		li		$v0, 4					# 4 is the print_string syscall.
		syscall
		
		la $a0, space 					# breakline
        li $v0, 4
        syscall
		
		# Ask player 1 for a 4-digit sequence that player 2 will guess
		la		$a0, player1_prompt		# load the addr of player1_prompt into $a0
		li		$v0, 4					# 4 is the print_string syscall.
		syscall
		
		# Print the colors
		la		$a0, colors				# load the addr of player1_prompt into $a0
		li		$v0, 4					# 4 is the print_string syscall.
		syscall
		
		# Get player 1's code
		li $v0, 8 						# take in input
        la $a0, code 					# load byte space into address
        li $a1, 5 						# allot the byte space for string
        move $t0,$a0 					# save string to t0
        syscall
		
		# Store code in array
		la 		$a0, code					#reload byte space to primary address
		move 	$a0, $t0
		
		la $a0, space					# line break
        li $v0, 4
        syscall
		
		la $a0, space					# line break
        li $v0, 4
        syscall
		
		# Ask player 2 to guess the sequence
		la		$a0, player2_prompt		# load the addr of player1_prompt into $a0
		li		$v0, 4					# 4 is the print_string syscall.
		syscall
		
		# Get player 2's guess
		li $v0, 8 						# take in input
        la $a0, guess 					# load byte space into address
        li $a1, 5 						# allot the byte space for string
        move $t1,$a0 					# save string to t1
        syscall
		
		# Store guess in array
		la 		$s1, guess					#reload byte space to primary address
		move 	$s1, $t1
		la		$s1, 4
		
		la $a0, vert_line				# line
        li $v0, 4
        syscall
		
		# Print correct colors
		la		$a0, corcols			# load the addr of player1_prompt into $a0
		li		$v0, 4					# 4 is the print_string syscall.
		syscall
		
		la $a0, vert_line				# line
        li $v0, 4
        syscall
		
		# Print number of colors in correct spots
		la		$a0, corspot			# load the addr of player1_prompt into $a0
		li		$v0, 4					# 4 is the print_string syscall.
		syscall
		
		li		$v0, 10					# 10 is the exit syscall
		syscall							# execute syscall

# Data for the program:
		.data
code: 				.space 5
guess:				.space 5
welcome_msg:		.asciiz "Are you a Mastermind?!\n"
player1_prompt:		.asciiz "Player 1, enter a 4 color sequence: \n"
colors:				.asciiz "(R - Red, O - Orange, Y - Yellow, G - Green, B - Blue, P - Purple) \n"
player2_prompt:		.asciiz "Player 2, guess the 4-digit sequence: \n"
corcols:			.asciiz "# of correct colors:"
vert_line:			.asciiz " | "
corspot:			.asciiz "# of colors in correct slots: \n"
space: 				.asciiz "\n"

	
# end of Mastermind