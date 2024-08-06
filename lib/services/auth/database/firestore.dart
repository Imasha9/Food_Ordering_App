import 'package:cloud_firestore/cloud_firestore.dart';

class FirestoreService {
  final FirebaseFirestore _firestore = FirebaseFirestore.instance;

  CollectionReference getOrdersCollection() {
    return _firestore.collection('orders');
  }

  Future<void> saveOrderToDatabase(String receipt) async {
    try {
      CollectionReference orders = getOrdersCollection();
      await orders.add({
        'date': DateTime.now(),
        'order': receipt,
        //add more fields as necessary
      });
    } catch (e) {
      print('Error saving order to database: $e');
    }
  }
}