void main() {
  findDisappearedNumbers([4, 3, 2, 7, 8, 2, 3, 1]);
}

void findDisappearedNumbers(List<int> nums) {
  int i = 0;
  if (nums.contains(i++)) {
    print(i);
    print(nums[i]);
  }
}
