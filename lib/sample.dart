void main() {
  f(5);
}

f(n) {
  if (n <= 1) {
    return n;
  }

  f(n - 1);
  print(n);
  f(n - 1);
}
