int arraySign(List<int> nums) {
  int val = 0;
  for (int i = 0; i < nums.length; i++) {
    if (nums[i] == 0) {
      return 0;
    } else if (nums[i] < 0) {
      val = val + 1;
    }
  }
  return val % 2 == 0 ? 1 : -1;
}

void main() {
  int result =
      arraySign([9, 72, 34, 29, -49, -22, -77, -17, -66, -75, -44, -30, -24]);
  print(result);
}
