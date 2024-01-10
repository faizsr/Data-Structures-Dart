// List<List<int>> findDifference(List<int> nums1, List<int> nums2) {
//   Set<int> set1 = {};
//   Set<int> set2 = {};
//   final result = List.generate(2, (_) => <int>[]);

//   for (int n in nums1) {
//     set1.add(n);
//   }
//   for (int n in nums2) {
//     set2.add(n);
//   }
//   for (int n in set1) {
//     if (!set2.contains(n)) {
//       result[0].add(n);
//     }
//   }
//   for (int n in set2) {
//     if (!set1.contains(n)) {
//       result[1].add(n);
//     }
//   }
//   return result;
// }

List<List<int>> findDifference(List<int> nums1, List<int> nums2) {
  final intersection = nums1.toSet().intersection(nums2.toSet());
  return [
    List.from(nums1.toSet().difference(intersection)),
    List.from(nums2.toSet().difference(intersection))
  ];
}

void main() {
  List<List<int>> result = findDifference([1, 2, 3], [2, 4, 5]);
  print(result);
}
