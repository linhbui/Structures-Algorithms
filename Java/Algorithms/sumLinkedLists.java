public static linkListed<int> sum(LinkedList<int> arg1, LinkedList<int> arg2) {
	int v1, v2, result, carriage = 0;
	LinkedList<int> sumList = new LinkedList;
	while (arg1.hasNext() || arg2.hasNext()) {
		if (arg1.hasNext()){
			v1 = arg1.next();
		} else {
			v1 = 0;
		}
		if (arg2.hasNext()){
			v2 = arg2.next();
		} else {
			v2 = 0;
		}
		result = v1 + v2 + carriage;
		carriage = result / 10;
		sumList.push(result % 10);		
	}
	return sumList;
}