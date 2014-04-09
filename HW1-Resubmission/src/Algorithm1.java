// Name : Udaykumar Bhupendrakumar 
// SID  : 800803408

import java.io.BufferedReader;
import java.io.FileReader;
import java.io.IOException;

public class Algorithm1 {

	public static void main(String[] args) throws IOException {
		int[] a = new int[100];
		BufferedReader br = new BufferedReader(new FileReader("test_data.txt"));
		try {
			String line;
			int i = 0;
			while ((line = br.readLine()) != null && i < 100) {
				a[i] = Integer.parseInt(line);
				i++;
			}
		} finally {
			br.close();
		}

		int k = 10;
		System.out
				.println("1. Use linear search k times to and the largest element, one at a time.");
		System.out.println("\nThe sorted List of elements are : \n");
		for (int j = 0; j < k; j++) {
			int large = largefun(a);
			System.out.print(a[large] + ", ");
			rearragearray(a, large);
		}
	}

	// To find the largest number in the array.
	private static int largefun(int[] a) {
		int large = 0;
		for (int i = 1; i < a.length; i++) {
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
