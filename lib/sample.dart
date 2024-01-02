void main() {
  // bubbleSort([5,])
}

bubbleSort(List<int> arr) {
  bool swapped;
  do {
    swapped = false;
    for (int i = 0; i < arr.length - 1; i++) {
      if (arr[i] > arr[i + 1]) {
        int temp = arr[i];
        arr[i] = arr[i + 1];
        arr[i + 1] = temp;
        swapped = true;
      }
    }
  } while (swapped);
}

quickSort(List<int> arr) {
  if (arr.length < 2) {
    return arr;
  }

  int pivot = arr[arr.length - 1];
  List<int> left = [];
  List<int> right = [];

  for (int i = 0; i < arr.length; i++) {
    if (arr[i] < pivot) {
      left.add(arr[i]);
    } else {
      right.add(arr[i]);
    }
  }
  return [...quickSort(left), pivot, ...quickSort(right)];
}
