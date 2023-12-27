void main(List<String> args) {
  List<int> result = selectionSort([1, 41, -14, 1, 5, 1, 5, -6, 2]);
  print(result);
}

selectionSort(List<int> arr) {
  for (int i = 0; i < arr.length - 1; i++) {
    for (int j = i + 1; j < arr.length; j++) {
      if (arr[i] > arr[j]) {
        int temp = arr[i];
        arr[i] = arr[j];
        arr[j] = temp;
      }
    }
  }
  return arr;
}
