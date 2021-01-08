
class SignUpResponse {
  String idToken;
  String sId;
  String name;
  String email;
  int balance;

  SignUpResponse({this.idToken, this.sId, this.name, this.email, this.balance});

  SignUpResponse.fromJson(Map<String, dynamic> json) {
    idToken = json['idToken'];
    sId = json['_id'];
    name = json['name'];
    email = json['email'];
    balance = json['balance'];
  }

  Map<String, dynamic> toJson() {
    final Map<String, dynamic> data = new Map<String, dynamic>();
    data['idToken'] = this.idToken;
    data['_id'] = this.sId;
    data['name'] = this.name;
    data['email'] = this.email;
    data['balance'] = this.balance;
    return data;
  }
}