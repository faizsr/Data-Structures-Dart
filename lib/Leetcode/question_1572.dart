void main() {
  int result = diagonalSum([
    [7, 3, 1, 9],
    [3, 4, 6, 9],
    [6, 9, 6, 6],
    [6, 9, 6, 6],
  ]);

  print(result);
}

int diagonalSum(List<List<int>> mat) {
  int sum = 0;
  for (int i = 0; i < mat.length; i++) {
    for (int j = 0; j < mat.length; j++) {
      if (j == i) {
        sum = sum + (mat[i][j]);
      } else if (i + j == mat[i].length - 1) {
        sum = sum + (mat[i][j]);
      }
    }
  }
  return sum;
}

class Solution {
  int diagonalSum(List<List<int>> mat) {
    int sum = 0;
    for (int i = 0; i < mat.length; i++) {
      for (int j = 0; j < mat.length; j++) {
        if (j == i) {
          sum = sum + (mat[i][j]);
        } else if (i + j == mat[i].length - 1) {
          sum = sum + (mat[i][j]);
        }
      }
    }
    return sum;
  }
}
