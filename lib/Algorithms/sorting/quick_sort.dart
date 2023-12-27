void main() {
  List<int> result = quickSort([8, 20, -2, 4, -6]);
  print(result);
}

List<int> quickSort(List<int> arr) {
  if (arr.length < 2) {
    return arr;
  }
  int pivot = arr[arr.length - 1];
  List<int> left = [];
  List<int> right = [];
  for (int i = 0; i < arr.length - 1; i++) {
    if (arr[i] < pivot) {
      left.add(arr[i]);
    } else {
      right.add(arr[i]);
    }
  }
  return [...quickSort(left), pivot, ...quickSort(right)];
}
