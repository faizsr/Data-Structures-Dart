import 'dart:io';

void heapifyUp(List<int> arr, int n, int i) {
  int parent = (i - 1) ~/ 2;
  if (parent >= 0 && arr[parent] > 0) {
    if (arr[i] > arr[parent]) {
      int temp = arr[i];
      arr[i] = arr[parent];
      arr[parent] = temp;
      heapifyUp(arr, n, parent);
    }
  }
}

void heapifyDown(List<int> arr, int n, int i) {
  int largest = i;
  int l = 2 * i + 1;
  int r = 2 * i + 2;

  if (l < n && arr[l] > arr[largest]) {
    largest = l;
    if (r < n && arr[r] > arr[largest]) {
      largest = r;
      if (largest != l) {
        if (arr[i] > arr[largest]) {
          int temp = arr[i];
          arr[i] = arr[largest];
          arr[largest] = temp;
          heapifyUp(arr, n, largest);
        }
      }
    }
  }
}

void insertNode(List<int> arr, int n, int value) {
  n = n + 1;
  arr.add(value);
  heapifyUp(arr, n, n - 1);
}

void deleteRoot(List<int> arr, int n) {
  int lastElement = arr[n - 1];
  arr[0] = lastElement;
  n = n - 1;
  heapifyDown(arr, n, 0);
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
  print('');

  int size = arr.length ~/ arr[0].bitLength;
  deleteRoot(arr, size);
  printArray(arr, size);
}
