// RECORD.JAVA
// Record type for string hash table
//
// A record associates a certain string (the key value) with 
// a list of sequence positions at which that string occurs.
//

import java.util.*;

public class Record {
	public ArrayList positions;

	public Record() {
		positions = new ArrayList(1);
	}
}
