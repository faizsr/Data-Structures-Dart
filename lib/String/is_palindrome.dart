void main() {
  bool result = isPalindrome("A man, a plan, a canal: Panama");
  print(result);
}

bool isPalindrome(String s) {
  s = s.replaceAll(RegExp("[^a-zA-Z0-9]"), '').toLowerCase();
  int i = 0;
  int j = s.length - 1;
  while (i <= j) {
    if (s[i] != s[j]) {
      return false;
    }
    j--;
    i++;
  }
  return true;
}
