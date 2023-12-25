bool isAnagram(String s, String t) {
  if (s.length != t.length) {
    return false;
  }
  Map<String, int> str = {};
  for (int i = 0; i < s.length; i++) {
    str[s[i]] = str[s[i]] == null ? 1 : str[s[i]]! + 1;
    str[t[i]] = str[t[i]] == null ? -1 : str[t[i]]! - 1;
  }

  bool result = true;
  str.forEach(
    (key, value) {
      if (value > 0) result = false;
    },
  );
  return result;
}

void main() {
  bool result = isAnagram('anagram', 'nagaram');
  print(result);
}
