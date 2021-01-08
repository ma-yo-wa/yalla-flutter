class TripHotelModel {
  List<String> imageUrl;
  String sId;
  String hotelName;
  int startingPrice;
  String distanceFromHaram;
  String roomSize;

  TripHotelModel(
      {this.imageUrl,
        this.sId,
        this.hotelName,
        this.startingPrice,
        this.distanceFromHaram,
        this.roomSize});

  TripHotelModel.fromJson(Map<String, dynamic> json) {
    imageUrl = json['imageUrl'].cast<String>();
    sId = json['_id'];
    hotelName = json['hotelName'];
    startingPrice = json['startingPrice'];
    distanceFromHaram = json['distanceFromHaram'];
    roomSize = json['roomSize'];
  }

  Map<String, dynamic> toJson() {
    final Map<String, dynamic> data = new Map<String, dynamic>();
    data['imageUrl'] = this.imageUrl;
    data['_id'] = this.sId;
    data['hotelName'] = this.hotelName;
    data['startingPrice'] = this.startingPrice;
    data['distanceFromHaram'] = this.distanceFromHaram;
    data['roomSize'] = this.roomSize;
    return data;
  }
}