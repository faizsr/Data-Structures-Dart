void main() {
  List<int> appendElmnt = appendElement([3, 4, 2, 4, 1], 2);
  List<int> prependElmnt = prependElement([3, 4, 2, 4, 1], 1);
  List<int> removeFirst = removeFromLast([3, 4, 2, 4, 1]);
  List<int> removeLast = removeFromFirst([3, 4, 2, 4, 1]);
  List<int> insertIndexResult = inserAtIndex([3, 4, 2, 4, 1], 2, 10);
  List<int> removeIndexResult = removeAtIndex([3, 4, 2, 4, 1], 2);
  List<int> removeElementResult = removeByElement([3, 4, 2, 4, 1], 3);
  List<int> reversedArray = reverseArray([3, 4, 2, 4, 1]);
  List<int> sortedArray = sortArray([3, 4, 2, 4, 1]);
  int findIndexResult = findIndex([3, 4, 2, 4, 1], 3);

  print('Array after inserting at last: $appendElmnt');
  print('Array after inserting in first: $prependElmnt');
  print('Remove From First: $removeFirst');
  print('Remove From Last: $removeLast');
  print('Array after insertion at index: $insertIndexResult');
  print('Array after removing at index: $removeIndexResult');
  print('Array after removing by element: $removeElementResult');
  print('Array after reversing: $reversedArray');
  print('Array after sorting: $sortedArray');
  print('Index of value 3: $findIndexResult');
}

List<int> appendElement(List<int> arr, int element) {
  arr.add(element);
  return arr;
}

List<int> prependElement(List<int> arr, int element) {
  arr.insert(0, element);
  return arr;
}

List<int> removeFromFirst(List<int> arr) {
  for (int i = 0; i < arr.length - 1; i++) {
    arr[i] = arr[i + 1];
  }
  arr.length = arr.length - 1;
  return arr;
}

List<int> removeFromLast(List<int> arr) {
  arr.length = arr.length - 1;
  return arr;
}

int findIndex(List<int> arr, int value) {
  for (int i = 0; i < arr.length; i++) {
    if (arr[i] == value) {
      return i;
    }
  }
  return -1;
}

List<int> inserAtIndex(List<int> arr, int index, int element) {
  for (int i = arr.length - 1; i > index; i--) {
    arr[i] = arr[i - 1];
  }
  arr[index] = element;
  return arr;
}

List<int> removeAtIndex(List<int> arr, int index) {
  for (int i = index; i < arr.length - 1; i++) {
    arr[i] = arr[i + 1];
  }
  arr.length = arr.length - 1;
  return arr;
}

List<int> removeByElement(List<int> arr, int element) {
  int index = findIndex(arr, element);
  List<int> newArray = removeAtIndex(arr, index);
  return newArray;
}

List<int> reverseArray(List<int> arr) {
  int first = 0;
  int last = arr.length - 1;

  while (first <= last) {
    int temp = arr[first];
    arr[first] = arr[last];
    arr[last] = temp;
    first++;
    last--;
  }
  return arr;
}

List<int> sortArray(List<int> arr) {
  for (int i = 0; i < arr.length - 1; i++) {
    for (int j = 0; j < arr.length - i - 1; j++) {
      if (arr[j] > arr[j + 1]) {
        int temp = arr[j];
        arr[j] = arr[j + 1];
        arr[j + 1] = temp;
      }
    }
  }
  return arr;
}
