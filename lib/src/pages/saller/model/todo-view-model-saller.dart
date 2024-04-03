class TodoViewModelSaller {
  final String description;
  final String id;
  final String title;
  final double price;
  final double count;
  bool isActive;

  TodoViewModelSaller(
      {required this.id,
        required this.isActive,
      required this.title,
      required this.description,
      required this.price,
      required this.count});

  factory TodoViewModelSaller.fromJson(final Map<String, dynamic> json) =>
      TodoViewModelSaller(
        isActive: json['isActive']??false,
        id: json['id'],
        title: json['title'],
        description: json['description'],
        price: json['price'],
        count: json['count'],
      );
}
