class TripTravelDates {
  List<TravelDates> travelDates;

  TripTravelDates({this.travelDates});

  TripTravelDates.fromJson(Map<String, dynamic> json) {
    if (json['travelDates'] != null) {
      travelDates = new List<TravelDates>();
      json['travelDates'].forEach((v) {
        travelDates.add(new TravelDates.fromJson(v));
      });
    }
  }

  Map<String, dynamic> toJson() {
    final Map<String, dynamic> data = new Map<String, dynamic>();
    if (this.travelDates != null) {
      data['travelDates'] = this.travelDates.map((v) => v.toJson()).toList();
    }
    return data;
  }
}

class TravelDates {
  String sId;
  String startDate;
  String endDate;

  TravelDates({this.sId, this.startDate, this.endDate});

  TravelDates.fromJson(Map<String, dynamic> json) {
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
