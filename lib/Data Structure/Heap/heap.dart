import 'dart:io';

void heapify(List<int> arr, int n, int i) {
  int parent = (i - 1) ~/ 2;
  if (parent >= 0 && arr[parent] > 0) {
    if (arr[i] > arr[parent]) {
      int temp = arr[i];
      arr[i] = arr[parent];
      arr[parent] = temp;
      heapify(arr, n, parent);
    }
  }
}

void insertNode(List<int> arr, int n, int value) {
  n = n + 1;
  arr.add(value);
  heapify(arr, n, n - 1);
}

void printArray(List<int> arr, int n) {
  for (int i = 0; i < n; ++i) {
    stdout.write('${arr[i]} ');
  }
}

void main() {
  List<int> arr = [10, 5, 3, 2, 4];
  int n = 5;
  int value = 15;
  insertNode(arr, n, value);
  printArray(arr, n + 1);
}
