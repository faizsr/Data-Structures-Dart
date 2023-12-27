// ============= Program to sort a list of String =============

void main() {
  List<String> result = insertionSort(["banana", "apple", "orange", "grape"]);
  print(result);
}

List<String> selectionSort(List<String> strings) {
  for (int i = 0; i < strings.length - 1; i++) {
    for (int j = i + 1; j < strings.length; j++) {
      if (strings[i].compareTo(strings[j]) > 0) {
        String temp = strings[i];
        strings[i] = strings[j];
        strings[j] = temp;
      }
    }
  }
  return strings;
}

List<String> bubbleSort(List<String> strings) {
  bool swapped;
  do {
    swapped = false;
    for (int i = 0; i < strings.length - 1; i++) {
      if (strings[i].compareTo(strings[i + 1]) > 0) {
        String temp = strings[i];
        strings[i] = strings[i + 1];
        strings[i + 1] = temp;
        swapped = true;
      }
    }
  } while (swapped);
  return strings;
}

List<String> insertionSort(List<String> strings) {
  for (int i = 1; i < strings.length; i++) {
    String wordToInsert = strings[i];
    int j = i - 1;
    while (j >= 0 && strings[j].compareTo(wordToInsert) > 0) {
      strings[j + 1] = strings[j];
      j--;
    }
    strings[j + 1] = wordToInsert;
  }
  return strings;
}

List<String> quickSort(List<String> strings) {
  if (strings.length < 2) {
    return strings;
  }

  String pivot = strings[strings.length - 1];
  List<String> left = [];
  List<String> right = [];

  for (int i = 0; i < strings.length - 1; i++) {
    if (strings[i].compareTo(pivot) < 0) {
      left.add(strings[i]);
    } else {
      right.add(strings[i]);
    }
  }
  return [...quickSort(left), pivot, ...quickSort(right)];
}

List<String> mergeSort(List<String> strings) {
  if (strings.length < 2) {
    return strings;
  }
  int mid = (strings.length / 2).floor();
  List<String> leftArr = strings.sublist(0, mid);
  List<String> rightArr = strings.sublist(mid);
  return merge(mergeSort(leftArr), mergeSort(rightArr));
}

merge(List<String> leftArr, List<String> rightArr) {
  List<String> sortedList = [];
  while (leftArr.isNotEmpty && rightArr.isNotEmpty) {
    if (leftArr[0].compareTo(rightArr[0]) <= 0) {
      sortedList.add(leftArr.removeAt(0));
    } else {
      sortedList.add(rightArr.removeAt(0));
    }
  }
  return [...sortedList, ...leftArr, ...rightArr];
}
