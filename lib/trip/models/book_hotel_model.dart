class BookHotelModel {
  List<Hotels> hotels;

  BookHotelModel({this.hotels});

  BookHotelModel.fromJson(Map<String, dynamic> json) {
    if (json['hotels'] != null) {
      hotels = new List<Hotels>();
      json['hotels'].forEach((v) {
        hotels.add(new Hotels.fromJson(v));
      });
    }
  }

  Map<String, dynamic> toJson() {
    final Map<String, dynamic> data = new Map<String, dynamic>();
    if (this.hotels != null) {
      data['hotels'] = this.hotels.map((v) => v.toJson()).toList();
    }
    return data;
  }
}

class Hotels {
  List<String> imageUrl;
  String sId;
  String hotelName;
  int startingPrice;
  String distanceFromHaram;
  String roomSize;
  String roomType;
  int packagePrice;
  int numberOfBeds;

  Hotels(
      {this.imageUrl,
        this.sId,
        this.hotelName,
        this.startingPrice,
        this.distanceFromHaram,
        this.roomSize,
        this.roomType,
        this.packagePrice,
        this.numberOfBeds});

  Hotels.fromJson(Map<String, dynamic> json) {
    imageUrl = json['imageUrl'].cast<String>();
    sId = json['_id'];
    hotelName = json['hotelName'];
    startingPrice = json['startingPrice'];
    distanceFromHaram = json['distanceFromHaram'];
    roomSize = json['roomSize'];
    roomType = json['roomType'];
    packagePrice = json['packagePrice'];
    numberOfBeds = json['numberOfBeds'];
  }

  Map<String, dynamic> toJson() {
    final Map<String, dynamic> data = new Map<String, dynamic>();
    data['imageUrl'] = this.imageUrl;
    data['_id'] = this.sId;
    data['hotelName'] = this.hotelName;
    data['startingPrice'] = this.startingPrice;
    data['distanceFromHaram'] = this.distanceFromHaram;
    data['roomSize'] = this.roomSize;
    data['roomType'] = this.roomType;
    data['packagePrice'] = this.packagePrice;
    data['numberOfBeds'] = this.numberOfBeds;
    return data;
  }
}
