void main() {
  bool result = halvesAreAlike('AbCdEfGh');
  print(result);
}

bool halvesAreAlike(String s) {
  int mid = s.length ~/ 2;
  List<String> firstHalf = s.substring(0, mid).toLowerCase().split('');
  List<String> secondHalf = s.substring(mid).toLowerCase().split('');

  String vowels = 'aeiou';
  int n1 = firstHalf.where((element) => vowels.contains(element)).length;
  int n2 = secondHalf.where((element) => vowels.contains(element)).length;
  return n1 == n2;
}
