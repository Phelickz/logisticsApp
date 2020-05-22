import 'package:cloud_firestore/cloud_firestore.dart';

class Users {
  String username;
  String phone;
  String email;
  String photoUrl;
  String completedOrders;
  String status;

  Users(
      {this.username,
      this.phone,
      this.email,
      this.photoUrl,
      this.completedOrders,
      this.status});

  factory Users.fromMap(dynamic doc) => Users(
      username: doc['username'],
      phone: doc['phone'],
      email: doc['email'],
      photoUrl: doc['photoUrl'],
      completedOrders: doc['completedOrders'],
      status: doc['status']);
}

class Riders {
  String username;
  String phone;
  String email;
  String photoUrl;
  String completedOrders;
  String status;
  String riderID;

  Riders(
      {this.username,
      this.phone,
      this.email,
      this.photoUrl,
      this.completedOrders,
      this.riderID,
      this.status});

  factory Riders.fromMap(dynamic doc) => Riders(
      username: doc['username'],
      phone: doc['phone'],
      email: doc['email'],
      photoUrl: doc['photoUrl'],
      completedOrders: doc['completedOrders'],
      riderID: doc['riderID'],
      status: doc['status']);
}

class RequestedOrders {
  String pickupAddress;
  String pickupFirstname;
  String pickupLastname;
  String pickupPhone;
  String deliveryAddress;
  String deliveryFirstname;
  String deliveryLastname;
  String deliveryPhone;
  String userID;
  String documentID;
  String status;
  Timestamp timestamp;

  RequestedOrders(
      {this.pickupAddress,
      this.pickupFirstname,
      this.pickupLastname,
      this.pickupPhone,
      this.deliveryFirstname,
      this.deliveryLastname,
      this.deliveryPhone,
      this.deliveryAddress,
      this.documentID,
      this.userID,
      this.timestamp,
      this.status});

  factory RequestedOrders.fromMap(dynamic doc) => RequestedOrders(
      pickupAddress: doc['pickupAddress'],
      pickupFirstname: doc['pickupFirstname'],
      pickupLastname: doc['pickupLastname'],
      pickupPhone: doc['pickupPhone'],
      deliveryAddress: doc['deliveryAddress'],
      deliveryFirstname: doc['deliveryFirstname'],
      deliveryLastname: doc['deliveryLastname'],
      deliveryPhone: doc['deliveryPhone'],
      documentID: doc['documentID'],
      userID: doc['userID'],
      timestamp: doc['timestamp'],
      status: doc['status']);
}

class ProgressOrders {
  String pickupAddress;
  String pickupFirstname;
  String pickupLastname;
  String pickupPhone;
  String deliveryAddress;
  String deliveryFirstname;
  String deliveryLastname;
  String deliveryPhone;
  String userID;
  String documentID;
  String status;
  String riderName;
  String riderPhone;
  List riderLocation;
  Timestamp timestamp;

  ProgressOrders(
      {this.pickupAddress,
      this.pickupFirstname,
      this.pickupLastname,
      this.pickupPhone,
      this.deliveryFirstname,
      this.deliveryLastname,
      this.deliveryPhone,
      this.deliveryAddress,
      this.documentID,
      this.userID,
      this.timestamp,
      this.status,
      this.riderName,
      this.riderPhone,
      this.riderLocation});

  factory ProgressOrders.fromMap(dynamic doc) => ProgressOrders(
      pickupAddress: doc['pickupAddress'],
      pickupFirstname: doc['pickupFirstname'],
      pickupLastname: doc['pickupLastname'],
      pickupPhone: doc['pickupPhone'],
      deliveryAddress: doc['deliveryAddress'],
      deliveryFirstname: doc['deliveryFirstname'],
      deliveryLastname: doc['deliveryLastname'],
      deliveryPhone: doc['deliveryPhone'],
      documentID: doc['documentID'],
      userID: doc['userID'],
      status: doc['status'],
      riderName: doc['riderName'],
      riderPhone: doc['riderPhone'],
      timestamp: doc['timestamp'],
      riderLocation: doc['riderLocation']);
}

class CompletedOrders {
  String pickupAddress;
  String pickupFirstname;
  String pickupLastname;
  String pickupPhone;
  String deliveryAddress;
  String deliveryFirstname;
  String deliveryLastname;
  String deliveryPhone;
  String userID;
  String documentID;
  String status;
  String riderName;
  String riderPhone;
  List riderLocation;
  Timestamp timestamp;

  CompletedOrders(
      {this.pickupAddress,
      this.pickupFirstname,
      this.pickupLastname,
      this.pickupPhone,
      this.deliveryFirstname,
      this.deliveryLastname,
      this.deliveryPhone,
      this.deliveryAddress,
      this.documentID,
      this.userID,
      this.status,
      this.riderName,
      this.riderPhone,
      this.timestamp,
      this.riderLocation});

  factory CompletedOrders.fromMap(dynamic doc) => CompletedOrders(
      pickupAddress: doc['pickupAddress'],
      pickupFirstname: doc['pickupFirstname'],
      pickupLastname: doc['pickupLastname'],
      pickupPhone: doc['pickupPhone'],
      deliveryAddress: doc['deliveryAddress'],
      deliveryFirstname: doc['deliveryFirstname'],
      deliveryLastname: doc['deliveryLastname'],
      deliveryPhone: doc['deliveryPhone'],
      documentID: doc['documentID'],
      userID: doc['userID'],
      status: doc['status'],
      riderName: doc['riderName'],
      riderPhone: doc['riderPhone'],
      timestamp: doc['timestamp'],
      riderLocation: doc['riderLocation']);
}
