int mySqrt(int x) {
  int count = 0;
  for (int i = 1; x > 0; i += 2) {
    x -= i;
    count++;
  }
  if (x != 0) {
    return count - 1;
  }
  return count;
}

void main() {
  int result = mySqrt(4);
  print(result);
}
