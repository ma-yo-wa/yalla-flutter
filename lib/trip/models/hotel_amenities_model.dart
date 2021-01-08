class HotelDetails {
  int amount;
  String transportationMode;
  HotelAmenities hotelAmenities;

  HotelDetails({this.amount, this.transportationMode, this.hotelAmenities});

  HotelDetails.fromJson(Map<String, dynamic> json) {
    amount = json['amount'];
    transportationMode = json['transportationMode'];
    hotelAmenities = json['hotelAmenities'] != null
        ? new HotelAmenities.fromJson(json['hotelAmenities'])
        : null;
  }

  Map<String, dynamic> toJson() {
    final Map<String, dynamic> data = new Map<String, dynamic>();
    data['amount'] = this.amount;
    data['transportationMode'] = this.transportationMode;
    if (this.hotelAmenities != null) {
      data['hotelAmenities'] = this.hotelAmenities.toJson();
    }
    return data;
  }
}

class HotelAmenities {
  String hotelStarRating;
  bool isBreakFastIncluded;
  bool isFreeParkingIncluded;
  bool isFreeWiFiIncluded;
  bool isAirconditionIncluded;
  bool isPetAllowed;
  bool isPoolIncluded;
  bool isFreeShuttleIncluded;

  HotelAmenities(
      {this.hotelStarRating,
        this.isBreakFastIncluded,
        this.isFreeParkingIncluded,
        this.isFreeWiFiIncluded,
        this.isAirconditionIncluded,
        this.isPetAllowed,
        this.isPoolIncluded,
        this.isFreeShuttleIncluded});

  HotelAmenities.fromJson(Map<String, dynamic> json) {
    hotelStarRating = json['hotelStarRating'];
    isBreakFastIncluded = json['isBreakFastIncluded'];
    isFreeParkingIncluded = json['isFreeParkingIncluded'];
    isFreeWiFiIncluded = json['isFreeWiFiIncluded'];
    isAirconditionIncluded = json['isAirconditionIncluded'];
    isPetAllowed = json['isPetAllowed'];
    isPoolIncluded = json['isPoolIncluded'];
    isFreeShuttleIncluded = json['isFreeShuttleIncluded'];
  }

  Map<String, dynamic> toJson() {
    final Map<String, dynamic> data = new Map<String, dynamic>();
    data['hotelStarRating'] = this.hotelStarRating;
    data['isBreakFastIncluded'] = this.isBreakFastIncluded;
    data['isFreeParkingIncluded'] = this.isFreeParkingIncluded;
    data['isFreeWiFiIncluded'] = this.isFreeWiFiIncluded;
    data['isAirconditionIncluded'] = this.isAirconditionIncluded;
    data['isPetAllowed'] = this.isPetAllowed;
    data['isPoolIncluded'] = this.isPoolIncluded;
    data['isFreeShuttleIncluded'] = this.isFreeShuttleIncluded;
    return data;
  }
}
