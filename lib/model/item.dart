class Item {
  final int index;
  final String name;
  final String description;

  Item({
    required this.index,
    required this.name,
    required this.description,
  });

  @override
  String toString() => name;
}
