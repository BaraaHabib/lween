part of 'ext.dart';

extension ValueNotifiersListExtention<T> on ValueNotifier<List<T>> {
  ///When you use this extention with ValueNotifier<List<T>>
  ///and by declaring ValueNotifiersListExtention<T> with dynamic type T
  ///the type T auto declared by the extention type ValueNotifiersListExtention<T>
  ///and ValueNotifier<List<T>> (review the usage of this method)
  void updateValueNotifierList(T newItem, int i) {
    /// We can't directly deal with this, so we must
    ///  use remove shadowing by doing this
    final prevStateList = this;

    ///Declare new list catch its value from the prev list without catching the ref
    ///of the prev, so the newList is a new object not instance of prev
    final newList = List<T>.from(prevStateList.value);

    newList[i] = newItem;

    ///Update the value of notifier
    ///in this way we can update the value of Objects value notifiers
    prevStateList.value = newList;
  }
}
