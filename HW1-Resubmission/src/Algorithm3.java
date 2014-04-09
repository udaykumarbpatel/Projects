// Name : Udaykumar Bhupendrakumar 
// SID  : 800803408

import java.io.BufferedReader;
import java.io.FileReader;
import java.io.IOException;
import java.util.Random;

public class Algorithm3 {

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
				if (result[j - 1] < result[j]) {
					int temp = result[j];
					result[j] = result[j - 1];
					result[j - 1] = temp;
				}
			}
		}

		System.out
				.println("3. Use the selection algorithm (section 9.2 in CLRS) to find the (n-k)th smallest element,\n"
						+ "   partioning arounf the position, and then sort the largest k elements using\n"
						+ "   Insertion Sort");
		System.out.println("\nThe sorted List of elements are : \n");
		for (int i = 0; i < result.length; i++)
			System.out.print(result[i] + ", ");
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
