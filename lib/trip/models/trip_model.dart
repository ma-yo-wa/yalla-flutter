
import 'dart:io';

import 'package:image_picker/image_picker.dart';

class TripModel {
  String bookingFor;
  String dealType;
  String dealPackageId;
  bool breakFastIncluded;
  bool lunchIncluded;
  String package;
  bool dinnerIncluded;
  int totalPackageAmount;
  String tripStartDate;
  String tripEndDate;
  PickedFile passportDataPage;
  String hotelName;
  String roomSize;
  String surname;
  String givenName;
  String passportNumber;
  String gender;
  String nationality;
  String stateOfOrigin;
  String maritalStatus;
  String placeOfWork;
  String occupation;
  String phoneNumber;
  String email;
  String whatsappNumber;
  String nextOfKinName;
  String relationshipWithNextOfKin;
  String nextOfKinAddress;
  String nextOfKinEmail;
  String nextOfKinPhoneNumber;
  String paymentReference;
  String paymentStatus;
  String gatewayResponse;

  TripModel(
      {this.bookingFor,
        this.dealType,
        this.dealPackageId,
        this.breakFastIncluded,
        this.lunchIncluded,
        this.dinnerIncluded,
        this.package,
        this.totalPackageAmount,
        this.tripStartDate,
        this.tripEndDate,
        this.passportDataPage,
        this.surname,
        this.givenName,
        this.passportNumber,
        this.gender,
        this.nationality,
        this.stateOfOrigin,
        this.maritalStatus,
        this.placeOfWork,
        this.occupation,
        this.phoneNumber,
        this.email,
        this.whatsappNumber,
        this.nextOfKinName,
        this.relationshipWithNextOfKin,
        this.nextOfKinAddress,
        this.nextOfKinEmail,
        this.nextOfKinPhoneNumber,
        this.paymentReference,
        this.paymentStatus,
        this.gatewayResponse});

  TripModel.fromJson(Map<String, dynamic> json) {
    bookingFor = json['bookingFor'];
    dealType = json['dealType'];
    dealPackageId = json['dealPackageId'];
    breakFastIncluded = json['breakFastIncluded'];
    lunchIncluded = json['lunchIncluded'];
    dinnerIncluded = json['dinnerIncluded'];
    totalPackageAmount = json['totalPackageAmount'];
    tripStartDate = json['tripStartDate'];
    tripEndDate = json['tripEndDate'];
    passportDataPage = json['passportDataPage'];
    surname = json['surname'];
    givenName = json['givenName'];
    passportNumber = json['passportNumber'];
    gender = json['gender'];
    nationality = json['nationality'];
    stateOfOrigin = json['stateOfOrigin'];
    maritalStatus = json['maritalStatus'];
    placeOfWork = json['placeOfWork'];
    occupation = json['occupation'];
    phoneNumber = json['phoneNumber'];
    email = json['email'];
    whatsappNumber = json['whatsappNumber'];
    nextOfKinName = json['nextOfKinName'];
    relationshipWithNextOfKin = json['relationshipWithNextOfKin'];
    nextOfKinAddress = json['nextOfKinAddress'];
    nextOfKinEmail = json['nextOfKinEmail'];
    nextOfKinPhoneNumber = json['nextOfKinPhoneNumber'];
    paymentReference = json['paymentReference'];
    paymentStatus = json['paymentStatus'];
    gatewayResponse = json['gatewayResponse'];
  }

  Map<String, dynamic> toJson() {
    final Map<String, dynamic> data = new Map<String, dynamic>();
    data['bookingFor'] = this.bookingFor;
    data['dealType'] = this.dealType;
    data['dealPackageId'] = this.dealPackageId;
    data['breakFastIncluded'] = this.breakFastIncluded;
    data['lunchIncluded'] = this.lunchIncluded;
    data['dinnerIncluded'] = this.dinnerIncluded;
    data['totalPackageAmount'] = this.totalPackageAmount;
    data['tripStartDate'] = this.tripStartDate;
    data['tripEndDate'] = this.tripEndDate;
    data['passportDataPage'] = this.passportDataPage;
    data['surname'] = this.surname;
    data['givenName'] = this.givenName;
    data['passportNumber'] = this.passportNumber;
    data['gender'] = this.gender;
    data['nationality'] = this.nationality;
    data['stateOfOrigin'] = this.stateOfOrigin;
    data['maritalStatus'] = this.maritalStatus;
    data['placeOfWork'] = this.placeOfWork;
    data['occupation'] = this.occupation;
    data['phoneNumber'] = this.phoneNumber;
    data['email'] = this.email;
    data['whatsappNumber'] = this.whatsappNumber;
    data['nextOfKinName'] = this.nextOfKinName;
    data['relationshipWithNextOfKin'] = this.relationshipWithNextOfKin;
    data['nextOfKinAddress'] = this.nextOfKinAddress;
    data['nextOfKinEmail'] = this.nextOfKinEmail;
    data['nextOfKinPhoneNumber'] = this.nextOfKinPhoneNumber;
    data['paymentReference'] = this.paymentReference;
    data['paymentStatus'] = this.paymentStatus;
    data['gatewayResponse'] = this.gatewayResponse;
    return data;
  }
}