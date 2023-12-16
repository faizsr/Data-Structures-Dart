List<int> intersection(List<int> nums1, List<int> nums2) {
  Set<int> newNums1 = nums1.toSet();
  Set<int> newNum2 = nums2.toSet();
  return newNums1.intersection(newNum2).toList();
}

void main() {
  List<int> result = intersection([1, 2, 2, 1], [2, 2]);
  print(result);
}
