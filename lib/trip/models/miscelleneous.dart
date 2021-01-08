class MiscellaneousModel {
  String dateId;
  String hotelId;

  MiscellaneousModel({this.dateId, this.hotelId});

  MiscellaneousModel.fromJson(Map<String, dynamic> json) {
    dateId = json['dateId'];
    hotelId = json['hotelId'];
  }

  Map<String, dynamic> toJson() {
    final Map<String, dynamic> data = new Map<String, dynamic>();
    data['dateId'] = this.dateId;
    data['hotelId'] = this.hotelId;
    return data;
  }
}
