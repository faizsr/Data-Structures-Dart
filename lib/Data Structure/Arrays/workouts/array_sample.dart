void main(List<String> arguments) {
  List<int> result = findElementOfSum([1, 3, 4, 2, 6, 2], 10);
  print(result);
}

// Time - O(n) Space - O(n)
List<int> findElementOfSum(List<int> num, int target) {
  Set<int> nums = {};
  for (int i = 0; i < num.length; i++) {
    int number = num[i];
    int match = target - number;
    if (num.contains(match)) {
      return [number, match];
    } else {
      nums.add(match);
    }
  }
  return [];
}

// Time - O(n2) Space - O(1)
// List<int> twoSumUsingLoop(List<int> num, int target) {
//   for (int i = 0; i < num.length - 1; i++) {
//     for (int j = i + 1; j < num.length; j++) {
//       if (num[i] + num[j] == target) {
//         return [num[i], num[j]];
//       }
//     }
//   }
//   return [];
// }
