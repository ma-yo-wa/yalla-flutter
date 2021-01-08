class TravelDateModel {
  String sId;
  String startDate;
  String endDate;

  TravelDateModel({this.sId, this.startDate, this.endDate});

  TravelDateModel.fromJson(Map<String, dynamic> json) {
    sId = json['_id'];
    startDate = json['startDate'];
    endDate = json['endDate'];
  }

  Map<String, dynamic> toJson() {
    final Map<String, dynamic> data = new Map<String, dynamic>();
    data['_id'] = this.sId;
    data['startDate'] = this.startDate;
    data['endDate'] = this.endDate;
    return data;
  }
}