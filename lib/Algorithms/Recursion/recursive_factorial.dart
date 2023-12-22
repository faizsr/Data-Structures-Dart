void main() {
  int result = factorial(5);
  print(result);
}

factorial(n) {
  if (n <= 1) {
    return 1;
  }
  return n * factorial(n - 1);
}
