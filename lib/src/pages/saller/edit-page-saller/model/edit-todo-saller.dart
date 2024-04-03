class EditTodoSellerDto {
 late String description;
 late String title;
 late double price;
late double count;
late String id;

  EditTodoSellerDto({
    required this.description,required this.count,required this.price,required this.title,required this.id
  });

  Map<String, dynamic> toJson() => {
    'description':description,
    'title':title,
    'price':price,
    'count':count,
    'id':id,
  };
}
