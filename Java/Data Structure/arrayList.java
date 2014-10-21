class MyArrayList {
 
    private Object[] myArray;
    private int counter = 0;
     
    public MyArrayList() {
        myArray = new Object[10];
    }
     
    public Object fetch(int index) {
        if (index < counter) {
            return myArray[index];
        } else {
            throw new ArrayIndexOutOfBoundsException();
        }
    }
     
    public void push(Object obj) {
        if (myArray.length-counter <= 5) {
            increaseListSize();
        }
        myArray[counter++] = obj;
    }
     
    public Object remove(int index) {
        if (index < counter) {
            Object obj = myArray[index];
            myArray[index] = null;
            int tmp = index;
            while(tmp < counter) {
                myArray[tmp] = myArray[tmp+1];
                myArray[tmp+1] = null;
                tmp++;
            }
            counter--;
            return obj;
        } else {
            throw new ArrayIndexOutOfBoundsException();
        }
         
    }
     
    public int size() {
        return counter;
    }
     
    private void increaseListSize() {
        myArray = Arrays.copyOf (myArray, myArray.length*2);
        System.out.println("\nNew length: "+myArray.length);
    }
}