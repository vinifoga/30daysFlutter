import 'dart:math';

enum TileState { EMPTY, CROSS, CIRCLE, TIE }

// [ 1, 2, 3, 4, 5, 6, 7, 8, 9]
// [ [1, 2, 3,]  [4, 5, 6,]  [7, 8, 9] ]
List<List<TileState>> chunk(List<TileState> list, int size) {
  return List.generate(
      (list.length / size).ceil(),
      (index) =>
          list.sublist(index * size, min(index * size + size, list.length)));
}
