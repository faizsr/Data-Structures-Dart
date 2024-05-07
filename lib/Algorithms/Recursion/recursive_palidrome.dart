bool isPalindrome(String str) {
  if (str.isEmpty || str.length == 1) {
    return true;
  }
  if (str[0] != str[str.length - 1]) {
    return false;
  }
  return isPalindrome(str.substring(1, str.length - 1));
}

void main() {
  String palindrome = "malayalam";
  String nonPalindrome = "hello";

  print('$palindrome is a palindrome: ${isPalindrome(palindrome)}');
  print('$nonPalindrome is a palindrome: ${isPalindrome(nonPalindrome)}');
}
