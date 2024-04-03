class TodoDtoSeller {
  final String title;
  final String description;
  final double price;
  final double count;
  final String imageBase64; // تصویر به صورت رشته Base64

  TodoDtoSeller({
    required this.title,
    required this.description,
    required this.price,
    required this.count,
    required this.imageBase64,
  });

  Map<String, dynamic> toJson() {
    return {
      'title': title,
      'description': description,
      'price': price,
      'count': count,
      'imageBase64': imageBase64,
    };
  }
}