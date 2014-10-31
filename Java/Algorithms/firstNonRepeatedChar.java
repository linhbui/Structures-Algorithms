import java.io.IOException;
import java.util.LinkedHashMap;
import java.util.Map.Entry;
import java.util.HashMap;
import java.util.ArrayList;
import java.util.HashSet;
import java.util.List;
import java.util.Map;
import java.util.Set;


public class NonRepeatedChar {
    

	//   Using LinkedHashMap: Iterate through the char array to build a hash table
	//   with char and their count. The iterate through the LinkedHashMap to find
	//   first entry with value 1.
	//   This algo will take at most 2 passes.


    public static char getFirstNonRepeatedChar(String str) {
        Map<Character,Integer> charCounts = new LinkedHashMap<>(str.length());
        
        for (char c : str.toCharArray()) {
            charCounts.put(c, charCounts.containsKey(c) ? charCounts.get(c) + 1 : 1);
        }
        
        for (Entry<Character,Integer> entry : charCounts.entrySet()) {
            if (entry.getValue() == 1) {
                return entry.getKey();
            }
        }
				
        throw new RuntimeException("there is no non-repeated character");
    }

    
//  Plot twist on first algo. This one use HashMap, which also means we cannot
//  guarantee the order of the keys in the hash table. Hence, in this algo,
//  we loop through the string again to find the count. Break when the count
//  is 1.
     
			
    public static char firstNonRepeatedCharacter(String word) {
        HashMap<Character,Integer> charCounts = new HashMap<>();

        for (int i = 0; i < word.length(); i++) {
            char c = word.charAt(i);
            if (charCounts.containsKey(c)) {
                charCounts.put(c, charCounts.get(c) + 1);
            } else {
                charCounts.put(c, 1);
            }
        }

        for (int i = 0; i < word.length(); i++) {
            char c = word.charAt(i);
            if (charCounts.get(c) == 1) {
                return c;
            }
        }
				
        throw new RuntimeException("there is no non-repeated character");
    }


     // This algo will take only one pass, but it requires more space.
     // Here, the repeated and non-repeated characters are stored seperatedly.
     // The first char in the non-repeated list is what we are looking for.

			
    public static char firstNonRepeatingChar(String word) {
        Set<Character> repeating = new HashSet<>();
        List<Character> nonRepeating = new ArrayList<>();
        for (int i = 0; i < word.length(); i++) {
            char letter = word.charAt(i);
            if (repeating.contains(letter)) {
                continue;
            }
						
            if (nonRepeating.contains(letter)) {
                nonRepeating.remove((Character) letter);
                repeating.add(letter);
            } else {
                nonRepeating.add(letter);
            }
        }
				
        return nonRepeating.get(0);
    }
}




