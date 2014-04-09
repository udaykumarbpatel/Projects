// Name : Udaykumar Bhupendrakumar 
// SID  : 800803408

import java.io.FileNotFoundException;
import java.io.PrintWriter;
import java.io.UnsupportedEncodingException;
import java.util.Random;

public class Algo3 {
	static int num_comp = 0;

	public static void main(String[] args) throws FileNotFoundException,
			UnsupportedEncodingException {
		PrintWriter writer = new PrintWriter("Algo3.txt", "UTF-8");
		writer.println("The Run time and Comparison for the Algorithm 3 is as follow: \n\n ");
		for (int i = 0; i < 1000; i++) {
			writer.println("Run Time : " + run_program()
					+ "       Comparison  : " + num_comp);
		}
		writer.close();
	}

	public static long run_program() {
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
		// Calculates the (n-k)th smallest element using Random-Selection
		// Algorithm
		int ran_sel = RandomSelect(a, 0, a.length - 1, a.length - k);
		// Creating an temp array which stores all the values greater than the
		// (n-k)th smallest element
		int[] result = new int[k];
		int j = 0;
		for (int i = 0; i < a.length; i++) {
			if (a[i] > ran_sel) {
				result[j] = a[i];
				j++;
			}
		}

		// Implementing Insertion Sort for the temp array
		for (int i = 0; i < result.length; i++) {
			for (j = i; j > 0; j--) {
				num_comp++;
				if (result[j - 1] < result[j]) {
					int temp = result[j];
					result[j] = result[j - 1];
					result[j - 1] = temp;
				}
			}
		}
		long estimatedTime = System.nanoTime() - startTime;
		return estimatedTime;
	}

	// Random-Selection Algorithm
	public static int RandomSelect(int[] a, int start, int end, int l) {
		if (start == end) {
			return a[start];
		}
		if (l == 0) {
			return -1;
		}
		int mid = RandomPartition(a, start, end);
		int i = mid - start + 1;
		if (i == l) {
			return a[mid];
		} else if (l < i) {
			return RandomSelect(a, start, mid - 1, l);
		} else {
			return RandomSelect(a, mid + 1, end, l - i);
		}
	}

	// Random Algorithm which helps to select the pivot randomly.
	public static int RandomPartition(int[] a, int start, int end) {
		Random rand = new Random();
		int randomNum = rand.nextInt((end - start) + 1) + start;
		int temp = a[end];
		a[end] = a[randomNum];
		a[randomNum] = temp;
		return Partition(a, start, end);
	}

	// Partition function using the pivot element selected.
	public static int Partition(int[] a, int start, int end) {
		int x = a[end];
		int i = start - 1;
		for (int j = start; j <= end - 1; j++) {
			num_comp++;
			if (a[j] <= x) {
				i = i + 1;
				int temp = a[i];
				a[i] = a[j];
				a[j] = temp;
			}
		}
		int temp = a[i + 1];
		a[i + 1] = a[end];
		a[end] = temp;
		return i + 1;
	}
}
