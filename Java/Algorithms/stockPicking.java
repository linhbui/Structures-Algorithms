// Stock picking algorithm with O(n)

int stockPicking(int[] arr) {
	int min = arr[0];
	int bestProfit = 0;
	int size = arr.size();
	for (int i=0; i<size; i++) {
		if (arr[i] < min) {
			min = arr[i];
		}
		if (arr[i] - min > bestProfit) {
			bestProfit = arr[i] - min;
		}
	}
	return bestProfit;
}