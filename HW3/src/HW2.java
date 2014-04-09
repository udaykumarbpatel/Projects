// HW2.java
// Sequence matching driver for CSE 502 HW 2
//
// SYNTAX: java HW2 <transcript file> <corpus file> <pattern file> 
//                   [ <mask file> ]
//
// This sequence matching program reads two sequences, a CORPUS and a PATTERN,
// from files on disk and finds all strings of a given length M (given
// interactively by the user) that occur in both corpus and pattern.  
// Matching substrings are printed in the form
//      <index 1> <index 2> <substring>
// where the two indices are the offsets of the match within the corpus and
// pattern, respectively, and <substring> is the actual matching string.
// All output is copied into the file <transcript file> for later review.
//
// As an optional fourth argument, the program can take a file containing a
// MASK sequence.  Substrings of the mask sequence are considered
// "uninteresting" and so must not be reported by the matching code.
// To implement this requirement, we delete any occurrences of substrings
// in the mask sequence from our pattern table before performing the search.
//
// ALTERNATE SYNTAX: java HW2
//
// This alternate is provided for those who find it difficult to give
// command line arguments.  With this option it will ask if you want
// to use data set 1,2,3 or 4.  All but data set 3 assume there is a
// mask file.  For data set 3, no mask file is used.  The transcript
// will put put into a file with the name test#-output where # is the data
// set (1,2,3 or 4).

public class HW2 {

	public static void main(String args[]) {
		String corpusSeq = null;
		String patternSeq = null;
		String maskSeq = null;
		if (args.length == 0) {
			Terminal.print("Which test data set (1,2,3 or 4)? ");
			int testNum = Terminal.readInt();
			if ((testNum < 1) || (testNum > 4)) {
				System.out.println("You must enter 1,2,3 or 4");
				return;
			}
			Terminal.startTranscript("test" + testNum + "-output");
			corpusSeq = SeqReader.readSeq("case" + testNum + "-corpus");
			patternSeq = SeqReader.readSeq("case" + testNum + "-pattern");
			Terminal.println("CORPUS: " + corpusSeq.length() + " bases");
			Terminal.println("PATTERN: " + patternSeq.length() + " bases");

			if ((testNum == 1) || (testNum == 2) || (testNum == 4)) {
				maskSeq = SeqReader.readSeq("case" + testNum + "-mask");
				Terminal.println("MASK: " + maskSeq.length() + " bases");
			}
		} else if (args.length < 3) {
			System.out.println("Syntax: java HW2 <transcript file> "
					+ "<corpus file> <pattern file> " + "[<mask file>]");
			return;
		} else {
			Terminal.startTranscript(args[0]);
			corpusSeq = SeqReader.readSeq(args[1]);
			patternSeq = SeqReader.readSeq(args[2]);
			Terminal.println("CORPUS: " + corpusSeq.length() + " bases");
			Terminal.println("PATTERN: " + patternSeq.length() + " bases");

			if (args.length > 3) {
				maskSeq = SeqReader.readSeq(args[3]);
				Terminal.println("MASK: " + maskSeq.length() + " bases");
			}
		}

		// Interactively get the desired match length
		//
		Terminal.print("Match length? ");
		int matchLength = Terminal.readInt();

		StringDictionary table = createTable(patternSeq, matchLength);

		Terminal.println("\nAfter creating the table, it holds " + table.size()
				+ " sequences of length " + matchLength);

		if (maskSeq != null)
			maskTable(table, maskSeq, matchLength);

		Terminal.println("After removing the mask sequences, the table holds "
				+ table.size() + " sequences of length " + matchLength + "\n");
		findMatches(table, corpusSeq, matchLength);
		Terminal.stopTranscript();
	}

	// Create a new StringDictionary containing all substrings of the pattern
	// sequence.
	//
	public static StringDictionary createTable(String patternSeq,
			int matchLength) {
		StringDictionary table = new StringDictionary(patternSeq.length());
		Record rec;

		for (int j = 0; j < patternSeq.length() - matchLength + 1; j++) {
			String key = patternSeq.substring(j, j + matchLength);
			if (table.containsKey(key, false)) {
				rec = table.get(key);
				rec.positions.add(new Integer(j));
			} else {
				rec = new Record();
				rec.positions.add(new Integer(j));
				table.put(key, rec);
			}
		}
		return table;
	}

	// Remove all substrings in the mask sequence from a StringDictionary.
	//
	public static void maskTable(StringDictionary table, String maskSeq,
			int matchLength) {
		for (int j = 0; j < maskSeq.length() - matchLength + 1; j++) {
			String key = maskSeq.substring(j, j + matchLength);
			Record data = table.remove(key);
		}
	}

	// Find and print all matches between the corpus sequence and any
	// string in a StringDictionary.
	//
	public static void findMatches(StringDictionary table, String corpusSeq,
			int matchLength) {
		int numMatches = 0;
		for (int j = 0; j < corpusSeq.length() - matchLength + 1; j++) {
			String key = corpusSeq.substring(j, j + matchLength);
			if (table.containsKey(key, true)) {
				Record rec = table.get(key);
				for (int k = 0; k < rec.positions.size(); k++) {
					Terminal.println(j + " " + rec.positions.get(k) + " " + key);
					numMatches++;
				}
			}
		}
		System.out.println("Probe count: MIN : " + table.min_probe
				+ "   MAX   :  " + table.max_probe + "    AVG   : "
				+ table.avg_probe);
		Terminal.println("\nThere were " + numMatches + " matches found.");
	}
}
