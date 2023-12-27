// ============= Program to sort a list of integers =============

void main() {
  List<int> result = selectionSort([6, 2, 1, -1, 8, -19]);
  print(result);
}

List<int> selectionSort(List<int> nums) {
  for (int i = 0; i < nums.length - 1; i++) {
    for (int j = i + 1; j < nums.length; j++) {
      if (nums[i] > nums[j]) {
        int temp = nums[i];
        nums[i] = nums[j];
        nums[j] = temp;
      }
    }
  }
  return nums;
}

List<int> bubbleSort(List<int> nums) {
  bool swapped;
  do {
    swapped = false;
    for (int i = 0; i < nums.length - 1; i++) {
      if (nums[i] > nums[i + 1]) {
        int temp = nums[i];
        nums[i] = nums[i + 1];
        nums[i + 1] = temp;
        swapped = true;
      }
    }
  } while (swapped);
  return nums;
}

List<int> insertionSort(List<int> nums) {
  for (int i = 1; i < nums.length; i++) {
    int numberToInsert = nums[i];
    int j = i - 1;
    while (j >= 0 && nums[j] > numberToInsert) {
      nums[j + 1] = nums[j];
      j--;
    }
    nums[j + 1] = numberToInsert;
  }
  return nums;
}

List<int> quickSort(List<int> nums) {
  if (nums.length < 2) {
    return nums;
  }
  int pivot = nums[nums.length - 1];
  List<int> leftArr = [];
  List<int> rightArr = [];

  for (int i = 0; i < nums.length - 1; i++) {
    if (nums[i] < pivot) {
      leftArr.add(nums[i]);
    } else {
      rightArr.add(nums[i]);
    }
  }
  return [...quickSort(leftArr), pivot, ...quickSort(rightArr)];
}

List<int> mergeSort(List<int> nums) {
  if (nums.length < 2) {
    return nums;
  }
  int mid = (nums.length / 2).floor();
  List<int> leftArr = nums.sublist(0, mid);
  List<int> rightArr = nums.sublist(mid);
  return merge(mergeSort(leftArr), mergeSort(rightArr));
}

merge(List<int> leftArr, List<int> rightArr) {
  List<int> sortedArr = [];
  while (leftArr.isNotEmpty && rightArr.isNotEmpty) {
    if (leftArr[0] <= rightArr[0]) {
      sortedArr.add(leftArr.removeAt(0));
    } else {
      sortedArr.add(rightArr.removeAt(0));
    }
  }
  return [...sortedArr, ...leftArr, ...rightArr];
}
