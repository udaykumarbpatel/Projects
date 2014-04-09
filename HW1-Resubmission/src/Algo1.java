// Name : Udaykumar Bhupendrakumar 
// SID  : 800803408

import java.io.FileNotFoundException;
import java.io.PrintWriter;
import java.io.UnsupportedEncodingException;
import java.util.Random;

public class Algo1 {
	static int num_comp = 0;

	public static void main(String[] args) throws FileNotFoundException, UnsupportedEncodingException {
		PrintWriter writer = new PrintWriter("Algo1.txt", "UTF-8");
		writer.println("The Run time and Comparison for the Algorithm 1 is as follow: \n\n ");
		for (int i = 0; i < 1000; i++) {
			writer.println("Run Time : " + run_program() + "       Comparison  : " + num_comp);
		}
		writer.close();
	}

	private static long run_program() {
		num_comp = 0;
		// Generate 100 random numbers and store it as an array
		Random rand = new Random();
		int[] a = new int[500000];
		for (int i = 0; i < 500000; i++) {
			int randNum = rand.nextInt(100000) + 1;
			a[i] = randNum;
		}

		int k = 500;

		long startTime = System.nanoTime();
		
		for (int j = 0; j < k; j++) {
			int large = largefun(a);
			rearragearray(a, large);
		}
		long estimatedTime = System.nanoTime() - startTime;
		return estimatedTime;
	}

	// To find the largest number in the array.
	private static int largefun(int[] a) {
		int large = 0;
		for (int i = 1; i < a.length; i++) {
			num_comp++;
			if (a[large] < a[i]) {
				large = i;
			}
		}
		return large;
	}

	// Deletes the largest number from the array and rearranges the array.
	private static void rearragearray(int[] a, int large) {
		for (int i = large; i < a.length - 1; i++) {
			a[i] = a[i + 1];
		}
	}
}
