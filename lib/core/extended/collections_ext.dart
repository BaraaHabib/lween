part of 'ext.dart';


extension ListsExtraFunctionalities<T> on List<T> {
  T? safeAccessFirstWhere(bool Function(T element) test) {
    final filteredValues = where(test);
    if (filteredValues.isNotEmpty) {
      return (filteredValues.first);
    }
    return null;
  }

  ///
  void putIfAbsent(T item) {
    try {
      ///Fill the final list
      final finalList = this;

      ///Check if list item is already exist
      final existenceIndex = finalList.indexOf(item);
      if (existenceIndex > -1) {
        ///Update existed item in the linked list
        finalList[existenceIndex] = item;
      } else {
        ///Add this item to the list
        finalList.add(item);
      }

      ///

      return;
    } on Exception {
      rethrow;
    }
  }

  void putIfAbsentAndRemoveIfExist(T item) {
    try {
      ///Remember that list is a reference type not value type
      ///so when assigning it to new list, indeed we assign reference not value
      ///Fill the final list
      final finalList = this;

      ///Check if list item is already exist
      final existenceIndex = finalList.indexOf(item);
      if (existenceIndex > -1) {
        ///Remove existed item in the linked list
        finalList.removeAt(existenceIndex);
      } else {
        ///Add this item to the list
        finalList.add(item);
      }

      ///

      return;
    } on Exception {
      rethrow;
    }
  }

  void putIfAbsentAndRemoveIfExistConditioned(T item,
      {required bool Function(T item) condition}) {
    try {
      ///Fill the final list
      final finalList = this;

      ///Check if list item is already exist
      final existenceIndex = finalList.indexWhere(condition);
      if (existenceIndex > -1) {
        ///Remove existed item in the linked list
        finalList.removeAt(existenceIndex);
      } else {
        ///Add this item to the list
        finalList.add(item);
      }

      ///

      return;
    } on Exception {
      rethrow;
    }
  }
}

extension StringCollectionsExtentions on List<String> {
  String get concatenatingListOfStrings {
    final originList = this;
    final requiredList = <String>[""];
    if (originList.isNotEmpty) {
      requiredList.addAll(originList);
    }

    return requiredList.join(" ");
  }

  String get concatenatingListOfStringsWithoutSpace {
    final originList = this;
    final requiredList = <String>[""];
    if (originList.isNotEmpty) {
      requiredList.addAll(originList);
    }

    return requiredList.join("");
  }
}

