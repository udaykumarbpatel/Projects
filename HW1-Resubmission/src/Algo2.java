// Name : Udaykumar Bhupendrakumar 
// SID  : 800803408

import java.io.FileNotFoundException;
import java.io.PrintWriter;
import java.io.UnsupportedEncodingException;
import java.util.Random;

public class Algo2 {
	static int num_comp = 0;

	public static void main(String[] args) throws FileNotFoundException,
			UnsupportedEncodingException {
		PrintWriter writer = new PrintWriter("Algo2.txt", "UTF-8");
		writer.println("The Run time and Comparison for the Algorithm 2 is as follow: \n\n ");
		for (int i = 0; i < 1000; i++) {
			writer.println("Run Time : " + run_program()
					+ "       Comparison  : " + num_comp);
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
		// int k = 500; Commented the statement because it is not useful.
		long startTime = System.nanoTime();
		divide(a);
		long estimatedTime = System.nanoTime() - startTime;
		return estimatedTime;
	}

	// Divide the array into 2 halves recursively until right is greater than
	// left.
	public static void divide(int[] a) {
		if (a.length > 1) {
			int mid = a.length / 2;
			int[] b = new int[mid];
			int[] c = new int[a.length - mid];
			for (int i = 0; i < mid; i++) {
				b[i] = a[i];
			}
			for (int i = 0; i < a.length - mid; i++) {
				c[i] = a[mid + i];
			}
			divide(b);
			divide(c);
			merge(b, c, a);
		}
	}

	// Merges the array to form a sorted array.
	private static void merge(int[] b, int[] c, int[] a) {
		int i, j, k;
		i = j = k = 0;
		while (i < b.length && j < c.length) {
			num_comp++;
			if (b[i] >= c[j]) {
				a[k] = b[i];
				i++;
			} else {
				a[k] = c[j];
				j++;
			}
			k++;
		}
		if (i == b.length) {
			for (int m = j; m < c.length; m++) {
				a[k] = c[m];
				k++;
			}
		} else {
			for (int m = i; m < b.length; m++) {
				a[k] = b[m];
				k++;
			}
		}
	}
}
