class UserModel {
  final String firstName;
  final String lastName;
  final String phone;
  final String password;

  UserModel({
    required this.firstName,
    required this.lastName,
    required this.phone,
    required this.password,
  });

  Map<String, dynamic> toJson() {
    return {
      'first_name': firstName,
      'last_name': lastName,
      'phone': phone,
      'password': password,
    };
  }
}
