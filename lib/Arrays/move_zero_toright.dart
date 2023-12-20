void main() {
  List<int> result = moveZeroToRight([3, 4, 2, 0, 2, 0, 0, 4, 3]);
  print(result);
}

List<int> moveZeroToRight(List<int> arr) {
  int index = 0;
  for (int i = 0; i < arr.length; i++) {
    if (arr[i] != 0) {
      int temp = arr[i];
      arr[i] = arr[index];
      arr[index] = temp;
      index++;
    }
  }
  return arr;
}
