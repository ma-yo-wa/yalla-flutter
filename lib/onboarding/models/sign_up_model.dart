class SignUpModel {
  String name;
  String email;
  String phoneNumber;
  String password;

  SignUpModel({this.name, this.email, this.phoneNumber, this.password});

  Map<String, dynamic>toJson() {
    return {
      "name": name,
      "email": email,
      "phoneNumber": phoneNumber,
      "password": password
    };
  }
}