	.text
main:
		# Guess Frequencies
		# $g_ "array" holding guess values
		# f_ frequency of color
		j freqloop
		
freqloop:	
		beq	$count, 4, done
		j gr
gr:		bne g1, '01010010', gor
		add fr, fr, 1
		add count, count, 1
		j update
gor:	bne g1, '01001111', gy
		add fog, fog, 1
		add	count, count, 1
		j update
gy:		bne g1, '01011001', gg
		add fy, fy, 1
		add count, count, 1
		j update
gg: 	bne g1, '01000111', gb
		add fg, fg, 1
		add count, count, 1
		j update
gb:		bne g1, '01000111', gp
		add, fb, fb, 1
		add count, count, 1
		j update
gp:		bne g1, '01010000', yell
		add fp, fp, 1
		add count, count, 1
		j update
		
update:	add g1, 0(arr), 1
		 freqloop
		 
done:
yell:
		# Print the angry message
		la		$a0, angry				# load the addr of player1_prompt into $a0
		li		$v0, 4					# 4 is the print_string syscall.
		syscall

		.data
angry: 	.asciiz 	"You suck"

