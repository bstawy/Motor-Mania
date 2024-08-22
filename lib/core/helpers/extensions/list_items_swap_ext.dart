extension SwappableList<E> on List<E> {
  void swapItems(int first, int second) {
    final temp = this[first];
    this[first] = this[second];
    this[second] = temp;
  }
}
