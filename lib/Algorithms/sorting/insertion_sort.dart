void main(List<String> args) {
  List<int> result = insertionSort([3, 2, 1, 6, 2, 6, 4, 9, 6]);
  print(result);
}

insertionSort(List<int> arr) {
  for (int i = 1; i < arr.length; i++) {
    int numberToInsert = arr[i];
    int j = i - 1;
    while (j >= 0 && arr[j] > numberToInsert) {
      arr[j + 1] = arr[j];
      j--;
    }
    arr[j + 1] = numberToInsert;
  }
  return arr;
}
