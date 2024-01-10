void duplicateZeros(List<int> arr) {
  for (int i = 0; i < arr.length; i++) {
    if (arr[i] == 0 && i + 1 < arr.length) {
      for (int j = arr.length - 1; j > i + 1; j--) {
        arr[j] = arr[j - 1];
      }
      arr[i + 1] = 0;
      i++;
    }
  }
  print(arr);
}

void main() {
  duplicateZeros([1, 0, 2, 3, 0, 4, 5, 0]);
}
