// Name : Udaykumar Bhupendrakumar 
// SID  : 800803408

import java.io.BufferedReader;
import java.io.FileReader;
import java.io.IOException;

public class Algorithm2 {
	public static void main(String[] args) throws NumberFormatException,
			IOException {
		int[] a = new int[100];
		BufferedReader br = new BufferedReader(new FileReader("test_data.txt"));
		try {
			String line;
			int i = 0;
			while ((line = br.readLine()) != null) {
				a[i] = Integer.parseInt(line);
				i++;
			}
		} finally {
			br.close();
		}

		int k = 10;
		divide(a);
		System.out
				.println("2. Use Merge Sort to sort the array and list the largest k elements.");
		System.out.println("\nThe sorted List of elements are : \n");
		for (int i = 0; i < k; i++)
			System.out.print(a[i] + ", ");
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

	private static void merge(int[] b, int[] c, int[] a) {
		int i, j, k;
		i = j = k = 0;
		while (i < b.length && j < c.length) {
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
