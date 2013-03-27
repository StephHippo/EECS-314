# Mastermind -- A game of sequences

# Main text of the program
		.text
main:
		la		$a0, welcome_msg		# load the addr of welcome_msg into $a0
		li		$v0, 4					# 4 is the print_string syscall.
		syscall
		
		la 		$a0, space 					# breakline
        li 		$v0, 4
        syscall
		
		# Ask player 1 for a 4-digit sequence that player 2 will guess
		la		$a0, player1_prompt		# load the addr of player1_prompt into $a0
		li		$v0, 4					# 4 is the print_string syscall.
		syscall
		
		# Print the color choices
		la		$a0, colors				# load the addr of player1_prompt into $a0
		li		$v0, 4					# 4 is the print_string syscall.
		syscall
		
		# Get player 1's code
        li $v0, 8 						# take in input
		sw $a0, code 					# load byte space into address
        syscall
		
		# Ask player 2 to guess the code
		la		$a0, player2_prompt
		li		$v0, 4
		syscall
		
		# Get player 2's guess
		li $v0, 8 						# take in input
        la $a0, guess 					# load byte space into address
        syscall
		
		la		$t1, guess				# loads address of guess into t1
		lb		$a0, 0($t1)				# loads first byte of the guess
		li		$v0, 11					# prints the byte
		syscall
		
		la		$t0, guess				# loads address of guess into t1
		lb		$a0, 3($t0)				# loads last byte of the code
		li		$v0, 11					# prints the byte
		syscall
		
		li		$v0, 10					# 10 is the exit syscall
		syscall							# execute syscall
		
# Data for the program:
		.data
code:				.space	4
guess:				.space 	4
welcome_msg:		.asciiz "Are you a Mastermind?!\n"
player1_prompt:		.asciiz "Player 1, enter a 4 color sequence: \n"
colors:				.asciiz "(R - Red, O - Orange, Y - Yellow, G - Green, B - Blue, P - Purple) \n"
player2_prompt:		.asciiz "Player 2, guess the 4-digit sequence: \n"
corcols:			.asciiz "# of correct colors:"
vert_line:			.asciiz " | "
corspot:			.asciiz "# of colors in correct slots: \n"
space: 				.asciiz "\n"

	
# end of Mastermind