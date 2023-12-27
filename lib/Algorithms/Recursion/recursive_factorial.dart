void main() {
  int result = factorial(3);
  print(result);
}

factorial(n) {
  if (n <= 1) {
    return n;
  }
  return n * factorial(n - 1);
}
