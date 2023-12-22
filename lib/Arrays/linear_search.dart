void main() {
  int result = linearSearch([1, 5, 3, 4, 7, 8], 5);
  print(result);
}

linearSearch(List<int> arr, int target) {
  for (int i = 0; i < arr.length; i++) {
    if (arr[i] == target) {
      return i + 1;
    }
  }
  return -1;
}
