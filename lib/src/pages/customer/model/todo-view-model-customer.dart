class TodoViewModelCustomer {
  final String id;
  final String title;
  final String description;
  final double price;
  final double count;

  TodoViewModelCustomer({
    required this.id,
    required this.title,
    required this.description,
    required this.price,
    required this.count,
  });

  factory TodoViewModelCustomer.fromJson(final Map<String, dynamic> json) =>
      TodoViewModelCustomer(
          id: json['id'],
          title: json['title'],
          description: json['description'],
          price: json['price'],
          count: json['count']);
}
