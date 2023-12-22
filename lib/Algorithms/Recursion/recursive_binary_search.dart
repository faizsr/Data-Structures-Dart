void main() {
  List<int> arr = [1, 3, 4, 5, 7, 8];
  int result = binarySearch(arr, 5, 0, arr.length - 1);
  print(result);
}

binarySearch(List<int> arr, int target, int leftIndex, int rightIndex) {
  if (leftIndex > rightIndex) {
    return -1;
  }

  int middleIndex = ((leftIndex + rightIndex) / 2).floor();

  if (target == arr[middleIndex]) {
    return middleIndex;               
  } else if (target < arr[middleIndex]) {
    return binarySearch(arr, target, leftIndex, middleIndex - 1);
  } else {
    return binarySearch(arr, target, middleIndex + 1, rightIndex);
  }
}
