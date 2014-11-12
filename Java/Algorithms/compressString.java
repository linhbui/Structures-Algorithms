public static void compress(String originalString){
    int idx = 0;
    int count = 0;
    char nextChar = ' ';
    while (idx < originalString.length()){
        count = 0;
        char c = originalString.charAt(idx);
        if (!Character.isDigit(c)){
            nextChar = c;
            idx++;
        }
        else{
            while (Character.isDigit(c)){
                int temp = Integer.parseInt(""+c);
                count = temp;
                idx++;
                if (idx >= originalString.length()){
                    break;
                }
                c = originalString.charAt(idx);
            }
            for (int i =0; i<count; i++){
                System.out.println(nextChar+i);
            }
        }
    }
}