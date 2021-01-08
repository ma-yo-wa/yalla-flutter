class LoginResponse {
  String idToken;
  String sId;
  String name;
  String email;
  int balance;
  bool isAccountSet;

  LoginResponse(
      {this.idToken,
        this.sId,
        this.name,
        this.email,
        this.balance,
        this.isAccountSet});

  LoginResponse.fromJson(Map<String, dynamic> json) {
    idToken = json['idToken'];
    sId = json['_id'];
    name = json['name'];
    email = json['email'];
    balance = json['balance'];
    isAccountSet = json['isAccountSet'];
  }

  Map<String, dynamic> toJson() {
    final Map<String, dynamic> data = new Map<String, dynamic>();
    data['idToken'] = this.idToken;
    data['_id'] = this.sId;
    data['name'] = this.name;
    data['email'] = this.email;
    data['balance'] = this.balance;
    data['isAccountSet'] = this.isAccountSet;
    return data;
  }
}