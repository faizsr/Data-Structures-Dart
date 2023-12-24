List<int> separateDigits(List<int> nums) {
  return nums.join('').split('').map((value) => int.parse(value)).toList();
}

void main() {
  List<int> result = separateDigits([13, 25, 83, 77]);
  print(result);
}
