class User {
  final String phonenumber;
  final String password;

  User({required this.phonenumber, required this.password});

  Map<String, dynamic> toMap() {
    return {'phonenumber': phonenumber, 'password': password};
  }
}
