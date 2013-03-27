import java.util.Scanner;

public class Mastermind {
	public static void main(String[] args){
		//Initialize the scanner for input.
		Scanner input = new Scanner(System.in);
		
		//Start the game.
		System.out.println("Are you a Masterind? \n Player 1, enter your code:");
		String code = input.nextLine();
		
		//Ask player 2 to guess.
		System.out.println("Player 2, begin to guess:");
		
		//Player 2 begins to guess.
		boolean solved = false;
		while (solved == false){
			/* Initialize all the variables needed.
			 * They will initialize each time through the loop to 0.
			 */
			int correctcolors = 0;
			int correctspots = 0;
			int codeR = 0;
			int codeO = 0;
			int codeY = 0;
			int codeG = 0;
			int codeB = 0;
			int codeP = 0;
			int guessR = 0;
			int guessO = 0;
			int guessY = 0;
			int guessG = 0;
			int guessB = 0;
			int guessP = 0;
			
			//Get Player 2's guess.
			String guess = input.nextLine();
			
			//Check for correct solution right away.
			if (code == guess) {
				System.out.print("Winner!");
			}
			else {
				//Count the correct spots.
				for(int i = 0; i < code.length(); i++) {
					if(code.charAt(i)==guess.charAt(i)) {
						correctspots++;
					}
				}
				//Count the frequencies of colors in the code.
				for(int j = 0; j < code.length(); j++){
					if(code.charAt(j) == 'R'){
						codeR++;
					}
					if (code.charAt(j) == 'O'){
						codeO++;
					}
					if (code.charAt(j) == 'Y'){
						codeY++;
					}
					if (code.charAt(j) == 'G'){
						codeG++;
					}
					if (code.charAt(j) == 'B'){
						codeB++;
					}
					if (code.charAt(j) == 'P'){
						codeP++;
					}
				}
				//Count the frequencies of colors in the guess
				for(int k = 0; k < guess.length(); k++){
					if(guess.charAt(k) == 'R'){
						guessR++;
					}
					if (guess.charAt(k) == 'O'){
						guessO++;
					}
					if (guess.charAt(k) == 'Y'){
						guessY++;
					}
					if (guess.charAt(k) == 'G'){
						guessG++;
					}
					if (guess.charAt(k) == 'B'){
						guessB++;
					}
					if (guess.charAt(k) == 'P'){
						guessP++;
					}
				}
				
				/* Compare the frequencies of the guess and the code.
				 * Update correct colors as needed.
				 * If codeColor >= guess, use the guess.
				 * But if codeColor < guess, use the code.
				 */
				if (codeR >= guessR) {
					correctcolors += guessR;
				}
				else {
					correctcolors += codeR;
				}
				if (codeO >= guessO) {
					correctcolors += guessO;
				}
				else {
					correctcolors += codeO;
				}
				if (codeY >= guessY) {
					correctcolors += guessY;
				}
				else {
					correctcolors += codeY;
				}
				if (codeG >= guessG) {
					correctcolors += guessG;
				}
				else {
					correctcolors += codeG;
				}
				if (codeB >= guessB) {
					correctcolors += guessB;
				}
				else {
					correctcolors += codeB;
				}
				if (codeP >= guessP) {
					correctcolors += guessP;
				}
				else {
					correctcolors += codeP;
				}
			
				/*If Player 2 gets correct # of colors and correct # of spots
				 * Say Player 2 got it right and set solved = true to break 
				 * out of the loop.
				 */
				if (correctcolors == 4 && correctspots == 4) {
					System.out.print("You got it right!");
					solved = true;
				}
				/* Else just tell Player 2 the # of colors and # of spots
				 * that Player 2 got correct for that guess.
				 */
				else {
					System.out.printf("Correct color %s, Correct spot %s", correctcolors, correctspots);
				}
			}
		}
		//Close the Scanner.
		input.close();
	}
}