extension PutAll on Map {
  Map putAllIfAbsent(Map<String, String> items) {
    if (items.isEmpty) return this;
    items.forEach((key, String value) {
      this.putIfAbsent(key, () => value);
    });
    return this;
  }
}

extension MapEntryExt on MapEntry<DateTime, DateTime> {
  bool isInRange(DateTime date) =>
      (key == date || value == date) ||
      date.isAfter(key) && date.isBefore(value);
}
