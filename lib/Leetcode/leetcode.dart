int arraySign(List<int> nums) {
  int product = 1;
  for (int i = 0; i < nums.length; i++) {
    product = product * nums[i];
  }
  print(product);
  if (product >= 1) {
    return 1;
  } else if (product == 0) {
    return 0;
  }
  return -1;
}

void main() {
  int result =
      arraySign([9, 72, 34, 29, -49, -22, -77, -17, -66, -75, -44, -30, -24]);
  print(result);
}
