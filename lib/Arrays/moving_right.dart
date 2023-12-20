void main(List<String> arguments) {
  // List<int> result = 
  moveToRight([5, 5, 1, 8, 5, 3, 5, 7, 1], 5);
  // print(result);
}

void moveToRight(List<int> arr, int target) {
  int temp = 0;
  for (int j = arr.length - 1; j > 0; j--) {
    if (arr[j] != target) {
      for (int i = 0; i < j; i++) {
        if (arr[i] == target) {
          temp = arr[i];
          arr[i] = arr[j];
          arr[j] = temp;
        }
      }
    }
  }
  print(arr) ;
}
