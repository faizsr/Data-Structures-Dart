void main() {
  int result = fibonacci(6);
  print(result);
}

fibonacci(n) {
  if (n <= 1) {
    return n;
  }
  return fibonacci(n - 1) + fibonacci(n - 2);
}
