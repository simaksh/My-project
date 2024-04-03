class TodoViewModel {
  late String userName;
  late String password;

  TodoViewModel({required this.userName, required this.password});

  factory TodoViewModel.fromJson(final Map<String, dynamic> json) =>
      TodoViewModel(userName: json['userName'], password: json['password']);
}
