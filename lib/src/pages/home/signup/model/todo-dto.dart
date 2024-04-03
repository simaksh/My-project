class TodoDto {
  late String firstName;
  late String lastName;
  late String userName;
  late String password;
  late String repeatPassword;

  TodoDto(
      {required this.firstName,
        required this.lastName,
        required this.userName,
        required this.password,
        required this.repeatPassword});

  Map<String, dynamic> toJson() {
    return {
      'firstName': firstName,
      'lastName': lastName,
      'username': userName,
      'password': password,
      'repeatPassword': repeatPassword,
    };
  }
}
