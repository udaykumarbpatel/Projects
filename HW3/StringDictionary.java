// StringDictionary.java
// A hash table mapping Strings to instances of the Record class that holds
// the associated data.  You need to fill in the methods for this part.
//
public class StringDictionary {

	int num_of_items = 0;
	int max_size;
	int probe, min_probe, max_probe = 0, num_of_probe = 0;
	float avg_probe = 0;

	// Fill in your instance variables and any constants you'd like to
	// introduce. Also add any private methods that you'd like. Some are
	// already included at the end of this file.

	// This assumes that you've created an inner class (i.e. defined within
	// this class) called DictionaryRecord that takes a constructor that takes
	// two inputs the first is a String (the key) and the second is a
	// Record (the data). You are welcome to delete the below two lines
	// but I think you'll find them useful

	private static class DictionaryRecord {
		String key;
		Record data;

		public void setData(Record data) {
			this.data = data;
		}

		public String getKey() {
			return key;
		}

		public Record getData() {
			return data;
		}

		public DictionaryRecord(String key, Record data) {
			this.key = key;
			this.data = data;
		}

	}

	static final DictionaryRecord DELETED = new DictionaryRecord("", null); // sentinel
																			// for
																			// deleted
	//
	// Create an empty table big enough to hold maxSize records with
	// the desired load ratio maintained
	DictionaryRecord[] table = null;

	//

	public StringDictionary(int maxSize) {
		// you fill this in
		max_size = 1;
		while (max_size < maxSize) {
			max_size = 2 * max_size;
		}
		// max_size = 128; // For dataset 1
		min_probe = max_size;
		System.out.println("Max size const : " + max_size);
		table = new DictionaryRecord[max_size];
	}

	public void resize() {
		DictionaryRecord temp_table[] = table;
		max_size = 2 * max_size;
		System.out.println("MAX SIZE     :     " + max_size);
		num_of_items = 0;
		table = new DictionaryRecord[max_size];
		for (int i = 0; i < max_size / 2; i++) {
			if (temp_table[i] != null) {
				put(temp_table[i].getKey(), temp_table[i].getData());
			}
		}
	}

	//
	// Associates the specified record r with the given key in the
	// dictionary. If the dictionary already contains a record for
	// this key, the old record is replaced by r. The function returns
	// a reference to the Record previously associated with the specified
	// key, or null if there was no mapping for the key. A null return
	// can also indicate that the map previously associated null with
	// the specified key

	public Record put(String key, Record r) {
		// you fill this in
		int hashkey = toHashKey(key);
		int b_hash = baseHash(hashkey);
		int s_hash = stepHash(hashkey);

		int initial_hash = b_hash;
		int i = 1;

		while (table[initial_hash] != null && i < max_size) {
			if (table[initial_hash].key.equals(key)) {
				table[initial_hash].setData(r);
				return r;
			}
			initial_hash = (initial_hash + (i * s_hash)) % (max_size);
			i++;
		}

		if (table[initial_hash] == null) {
			num_of_items++;
			table[initial_hash] = new DictionaryRecord(key, r);
		} else {
			System.out.println("Table Full");
		}

		if (((float) (num_of_items + 1) / (float) max_size) >= 0.5) {
			resize();
		}
		return r;
	}

	// Returns a boolean that is true if the given key is contained in
	// the dictionary. If the key is not in use, false is returned.

	public boolean containsKey(String key, boolean function) {
		// you fill this in
		int hashkey = toHashKey(key);
		int b_hash = baseHash(hashkey);
		int s_hash = stepHash(hashkey);

		// initial hash function value
		int initial_hash = b_hash;
		int i = 1;
		probe = 1; // Probe is assigned to 1 since while loop checks the table
					// first.
		if (function) {
			num_of_probe++;
		}
		while (table[initial_hash] != null && i < max_size) {
			if (table[initial_hash].getKey().equals(key)) {
				if (function) {
					probe_stat();
				}
				return true; // if record is found, return it.
			}
			initial_hash = (initial_hash + (i * s_hash)) % (max_size);
			i++;
			probe++;
		}

		if (function) {
			probe_stat();
		}
		return false; // key not found
	}

	void probe_stat() {
		if (min_probe > probe) {
			min_probe = probe;
		}
		if (max_probe < probe) {
			max_probe = probe;
		}
		avg_probe = ((avg_probe * ((float) num_of_probe - 1)) + (float) probe)
				/ (float) num_of_probe;
	}

	//
	// Returns a reference to the Record associated with the specified key
	// Returns null if the dictionary does not contain any item with the
	// given key. A return value of null does not necessarily indicate
	// that the dictionary does not contain the key; it's also possible that
	// the map explicitly maps the key to null. The containsKey method may
	// be used to distinguish between these two cases.

	public Record get(String key) {
		// you fill this in
		int hashkey = toHashKey(key);
		int b_hash = baseHash(hashkey);
		int s_hash = stepHash(hashkey);

		// initial hash function value
		int initial_hash = b_hash;
		int i = 1;
		while (table[initial_hash] != null && i < max_size) {

			if (table[initial_hash].getKey().equals(key)) {
				return table[initial_hash].getData(); // if record is found,
														// return it.
			}
			// update i and the hash function
			initial_hash = (initial_hash + (i * s_hash)) % (max_size);
			i++;
		}
		return null; // key not found
	}

	//
	// Removes the given key from the dictionary, if it is present.
	// Returns the Record associated with the key if it was in use. or
	// null if the key was not in the dictionary. (A null return can also
	// indicate that the Record previously associated with the specified
	// key was null.)

	public Record remove(String key) {
		// you fill this in
		int hashkey = toHashKey(key);
		int b_hash = baseHash(hashkey);
		int s_hash = stepHash(hashkey);

		int initial_hash = b_hash;
		int i = 1;

		while (table[initial_hash] != null && i < max_size) {
			if (table[initial_hash].getKey().equals(key)) {
				Record deleted = table[initial_hash].getData();
				table[initial_hash] = DELETED;
				num_of_items--;
				return deleted;
			}
			// update the hash function
			initial_hash = (initial_hash + (i * s_hash)) % (max_size);
			i++;
		}
		return null;

	}

	// Returns the number of keys stored in the Dictionary

	public int size() {
		// you fill this in
		return num_of_items;
	}

	//
	// Convert a String key into an integer that serves as input to hash
	// functions. This mapping is based on the idea of a linear-congruential
	// pesudorandom number generator, in which successive values r_i are
	// generated by computing
	// r_i = ( A * r_(i-1) + B ) mod M
	// A is a large prime number, while B is a small increment thrown in
	// so that we don't just compute successive powers of A mod M.
	//
	// We modify the above generator by perturbing each r_i, adding in
	// the ith character of the string and its offset, to alter the
	// pseudorandom sequence.

	int toHashKey(String s) {
		int A = 1952786893;
		int B = 367253;
		int v = B;

		for (int j = 0; j < s.length(); j++) {
			char c = s.charAt(j);
			v = A * (v + (int) c + j) + B;
		}
		if (v < 0)
			v = -v;
		return v;
	}

	//
	// Primary hash function using the multiplication method
	// Computes hashKey*a - floor(k*a) and keeps most two significant digits
	// of the resulting fraction to return
	//
	// The below assumes that the hash table is called table

	int baseHash(int hashKey) {
		double a = .618;
		double frac = (hashKey * a) - (int) (hashKey * a);
		int hashValue = (int) (table.length * frac);
		return hashValue;
	}

	//
	// Secondary hash function. To be sure that all table entries are visited,
	// this requires that the tableSize is a power of 2. Since the value
	// returned is guaranteed to be odd, this ensures that the step size and the
	// table size are relatively prime.

	int stepHash(int hashKey) {
		int step = (hashKey % (table.length - 1));
		if (step % 2 == 0)
			return step + 1;
		else
			return step;
	}

}
