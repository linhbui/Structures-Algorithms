public class ASCII {
  public static boolean isUnique (String str) {
      boolean[] charSet = new boolean[256];
      for (int i = 0; i < str.length(); i++) {
          int val = str.charAt(i);
          if (charSet[val]) {
              return false;
          }
          charSet[val] = true;
      }
      return true;
  }
  public static void main(String[] args) {
      String[] words = {"abcde", "hello"};
      for (String word : words) {
          System.out.println(word + ":" + isUnique(word));
      }
  }
}