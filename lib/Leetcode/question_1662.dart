void main() {
  bool result = arrayStringsAreEqual(["a", "cb"], ["ab", "c"]);
  print(result);
}

bool arrayStringsAreEqual(List<String> word1, List<String> word2) {
  String wordOne = word1.join('');
  String wordTwo = word2.join('');
  print(wordOne);
  print(wordTwo);

  if (wordOne == wordTwo) {
    return true;
  }
  return false;
}
