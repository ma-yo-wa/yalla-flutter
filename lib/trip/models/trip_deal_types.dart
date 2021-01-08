class TripDealTypeModel {
  String dealType;
  String name;
  String id;
  int amount;
  String color;

  TripDealTypeModel({
    this.dealType,
    this.name,
    this.id,
    this.color,
    this.amount,
  });

  TripDealTypeModel.fromJson(Map<String, dynamic> json) {
    dealType = json['dealType'];
    amount = json['amount'];
    name = json['name'];
    id = json['_id'];
    color = json['color'];
  }

  Map<String, dynamic> toJson() {
    final Map<String, dynamic> data = new Map<String, dynamic>();
    data['dealType'] = this.dealType;
    data['amount'] = this.amount;
    data['name'] = this.name;
    data['_id'] = this.id;
    data['color'] = this.color;
    return data;
  }
}
