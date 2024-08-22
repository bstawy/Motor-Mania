extension MoveToStartExtension<T> on List<T> {
  List<T> moveToStart(int index) {
    if (index < 0 || index >= length) {
      throw RangeError.range(index, 0, length - 1, 'index');
    }

    var item = this[index];
    removeAt(index);
    insert(0, item);

    return this;
  }
}
