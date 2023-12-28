void main() {
  bool result = containsDuplicate([1, 2, 3, 4]);
  print(result);
}


// containsDuplicate(List<int> arr) {
//   Set<int> num = {};
//   for (var value in arr) {
//     if (num.contains(value)) {
//       return true;
//     }
//     num.add(value);
//   }
//   return false;
// }

containsDuplicate(List<int> arr) {
  for (int i = 0; i < arr.length; i++) {
    for (int j = i + 1; j < arr.length; j++) {
      if (arr[i] == arr[j]) {
        return true;
      }
    }
  }
  return false;
}