void main() {
  var list = [1, 3, 4, 5, 6, -2, 7, -12, 22];
  var [_, ...a,_] = list;
  print(a);
  var sum = 0;
  for (int i in a) {
    sum += i;
  }
  print(sum);
}
// 14, 17, 18 na dom ctr 121