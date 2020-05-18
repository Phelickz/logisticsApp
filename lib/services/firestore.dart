import 'package:logistics/services/models.dart';
import 'package:cloud_firestore/cloud_firestore.dart';

Firestore _firestore = Firestore.instance;
String _orders = 'orders';
String _users = 'userData';
String _riders = 'riderData';

Stream<List<RequestedOrders>> getOrdersListWithId(String uid) {
  return _firestore
      .collection(_orders)
      .where('userID', isEqualTo: uid)
      .where('status', isEqualTo: 'requested')
      .snapshots()
      .map((QuerySnapshot snapshot) {
    List<RequestedOrders> _postDocs =
        snapshot.documents.map((doc) => RequestedOrders.fromMap(doc)).toList();
    _postDocs.sort((comp1, comp2) =>
        comp2.timestamp.toDate().compareTo(comp1.timestamp.toDate()));
    return _postDocs;
  });
}

Stream<List<ProgressOrders>> getAllOrdersInProgress(String uid) {
  return _firestore
      .collection(_users)
      .where('userID', isEqualTo: uid)
      .where('status', isEqualTo: 'inProgress')
      .snapshots()
      .map((QuerySnapshot snapshot) {
    List<ProgressOrders> _postDocs =
        snapshot.documents.map((doc) => ProgressOrders.fromMap(doc)).toList();
    _postDocs.sort((comp1, comp2) =>
        comp2.timestamp.toDate().compareTo(comp1.timestamp.toDate()));
    return _postDocs;
  });
}

Stream<List<CompletedOrders>> getAllOrdersCompleted(String uid) {
  return _firestore
      .collection(_users)
      .where('userID', isEqualTo: uid)
      .where('status', isEqualTo: 'completed')
      .snapshots()
      .map((QuerySnapshot snapshot) {
    List<CompletedOrders> _postDocs =
        snapshot.documents.map((doc) => CompletedOrders.fromMap(doc)).toList();
    _postDocs.sort((comp1, comp2) =>
        comp2.timestamp.toDate().compareTo(comp1.timestamp.toDate()));
    return _postDocs;
  });
}

Stream<List<RequestedOrders>> getAllOrders() {
  return _firestore
      .collection(_orders)
      .where('status', isEqualTo: 'requested')
      .snapshots()
      .map((QuerySnapshot snapshot) {
    List<RequestedOrders> _postDocs =
        snapshot.documents.map((doc) => RequestedOrders.fromMap(doc)).toList();
    _postDocs.sort((comp1, comp2) =>
        comp2.timestamp.toDate().compareTo(comp1.timestamp.toDate()));
    return _postDocs;
  });
}

Future<void> createOrder(
    String _userId, String _photoUrl, RequestedOrders _order) async {
  var _ref = _firestore.collection(_orders).document();

  return _ref.setData({
    'pickupAddress': _order.pickupAddress,
    'pickupFirstname': _order.pickupFirstname,
    'pickupLastname': _order.pickupLastname,
    'pickupPhone': _order.pickupPhone,
    'deliveryAddress': _order.deliveryAddress,
    'deliveryFirstname': _order.deliveryFirstname,
    'deliveryLastname': _order.deliveryLastname,
    'deliveryPhone': _order.deliveryPhone,
    'documentID': _ref.documentID,
    'status': 'requested',
    'userId': _userId,
    'photoUrl': _photoUrl,
    'timestamp': _order.timestamp,
    'riderLocation': []
  });
}

Future<void> updateOrderToInProgress(
    String documentID,
    String riderName,
    String riderPhone,
    String currentLocation,
    String uid,
    ProgressOrders _order) async {
  await _firestore.collection(_orders).document(documentID).updateData({
    'status': 'inProgress',
    'riderName': riderName,
    'riderPhone': riderPhone,
    'riderLocation': FieldValue.arrayUnion([currentLocation])
  });

  var ref = _firestore
      .collection(_riders)
      .document(uid)
      .collection(_orders)
      .document();
  await ref.setData({
    'status': 'inProgress',
    'pickupAddress': _order.pickupAddress,
    'pickupFirstname': _order.pickupFirstname,
    'pickupLastname': _order.pickupLastname,
    'pickupPhone': _order.pickupPhone,
    'deliveryAddress': _order.deliveryAddress,
    'deliveryFirstname': _order.deliveryFirstname,
    'deliveryLastname': _order.deliveryLastname,
    'deliveryPhone': _order.deliveryPhone,
    'documentID': ref.documentID,
    'userDocumentID': documentID
  });
}

Future<void> updateOrderToCompleted(
    String documentID,
    String riderName,
    String riderPhone,
    String currentLocation,
    String userDocumentID,
    String uid,
    CompletedOrders _order) async {
  await _firestore.collection(_orders).document(documentID).updateData({
    'status': 'completed',
    'riderLocation': FieldValue.arrayUnion([currentLocation])
  });

  var ref = _firestore
      .collection(_riders)
      .document(uid)
      .collection(_orders)
      .where('userDocumentID', isEqualTo: userDocumentID);
  await ref.getDocuments().then((QuerySnapshot querySnapshot) {
    querySnapshot.documents.forEach((DocumentSnapshot documentSnapshot) {
      documentSnapshot.reference
          .updateData({'status': 'completed'}).catchError((e) {
        print(e);
      });
    });
  }).catchError((e) {
    print(e);
  });
}


Stream<List<ProgressOrders>> getOrdersListWithIdRider(String uid) {
  return _firestore
      .collection(_riders)
      .document(uid)
      .collection(_orders)
      .where('status', isEqualTo: 'inProgress')
      .snapshots()
      .map((QuerySnapshot snapshot) {
    List<ProgressOrders> _postDocs =
        snapshot.documents.map((doc) => ProgressOrders.fromMap(doc)).toList();
    _postDocs.sort((comp1, comp2) =>
        comp2.timestamp.toDate().compareTo(comp1.timestamp.toDate()));
    return _postDocs;
  });
}

Stream<List<ProgressOrders>> getCompletedOrdersListWithIdRider(String uid) {
  return _firestore
      .collection(_riders)
      .document(uid)
      .collection(_orders)
      .where('status', isEqualTo: 'completed')
      .snapshots()
      .map((QuerySnapshot snapshot) {
    List<ProgressOrders> _postDocs =
        snapshot.documents.map((doc) => ProgressOrders.fromMap(doc)).toList();
    _postDocs.sort((comp1, comp2) =>
        comp2.timestamp.toDate().compareTo(comp1.timestamp.toDate()));
    return _postDocs;
  });
}
