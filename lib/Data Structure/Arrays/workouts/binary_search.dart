void main() {
  int result = binarySearch([1, 3, 4, 5, 7, 8], 5);
  print(result);
}

binarySearch(List<int> arr, target) {
  int leftIndex = 0;
  int rightIndex = arr.length - 1;

  while (leftIndex <= rightIndex) {
    int middleIndex = ((leftIndex + rightIndex) / 2).floor();
    if (target == arr[middleIndex]) {
      return middleIndex;
    } else if (target < arr[middleIndex]) {
      rightIndex = middleIndex - 1;
    } else {
      leftIndex = middleIndex + 1;
    }
  }
  return -1;
}
