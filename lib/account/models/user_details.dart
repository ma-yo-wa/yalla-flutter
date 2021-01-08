class UserDetails {
  int balance;
  List<String> roles;
  bool isVerified;
  bool isAdmin;
  bool isPinSet;
  bool isAccountSet;
  bool isCardDetailsSet;
  int visaApplicationCount;
  int bookingCount;
  int savingPlanCount;
  String sId;
  String name;
  String email;
  String signupDate;
  String userRef;

  UserDetails(
      {this.balance,
        this.roles,
        this.isVerified,
        this.isAdmin,
        this.isPinSet,
        this.isAccountSet,
        this.isCardDetailsSet,
        this.visaApplicationCount,
        this.bookingCount,
        this.savingPlanCount,
        this.sId,
        this.name,
        this.email,
        this.signupDate,
        this.userRef});

  UserDetails.fromJson(Map<String, dynamic> json) {
    balance = json['balance'];
    if (json['roles'] != null) {
      roles = new List<Null>();
      json['roles'].forEach((v) {
        roles.add((v));
      });
    }
    isVerified = json['isVerified'];
    isAdmin = json['isAdmin'];
    isPinSet = json['isPinSet'];
    isAccountSet = json['isAccountSet'];
    isCardDetailsSet = json['isCardDetailsSet'];
    visaApplicationCount = json['visaApplicationCount'];
    bookingCount = json['bookingCount'];
    savingPlanCount = json['savingPlanCount'];
    sId = json['_id'];
    name = json['name'];
    email = json['email'];
    signupDate = json['signupDate'];
    userRef = json['userRef'];
  }

  Map<String, dynamic> toJson() {
    final Map<String, dynamic> data = new Map<String, dynamic>();
    data['balance'] = this.balance;
    data['isVerified'] = this.isVerified;
    data['isAdmin'] = this.isAdmin;
    data['isPinSet'] = this.isPinSet;
    data['isAccountSet'] = this.isAccountSet;
    data['isCardDetailsSet'] = this.isCardDetailsSet;
    data['visaApplicationCount'] = this.visaApplicationCount;
    data['bookingCount'] = this.bookingCount;
    data['savingPlanCount'] = this.savingPlanCount;
    data['_id'] = this.sId;
    data['name'] = this.name;
    data['email'] = this.email;
    data['signupDate'] = this.signupDate;
    data['userRef'] = this.userRef;
    return data;
  }
}
