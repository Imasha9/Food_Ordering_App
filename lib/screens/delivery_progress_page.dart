import 'package:flutter/material.dart';
import 'package:provider/provider.dart';
import 'package:ticket_app/components/my_receipt.dart';
import 'package:ticket_app/models/restaurant.dart';
import 'package:ticket_app/services/auth/database/firestore.dart';
import 'package:cloud_firestore/cloud_firestore.dart';

class DeliveryProgressPage extends StatefulWidget {
  const DeliveryProgressPage({super.key});

  @override
  State<DeliveryProgressPage> createState() => _DeliveryProgressPageState();
}

class _DeliveryProgressPageState extends State<DeliveryProgressPage> {
  //get access to db
  final FirestoreService _db = FirestoreService();

  @override
  void initState() {
    super.initState();

    //if we get to this page,submit order to firebase db
    String receipt = context.read<Restaurant>().displayCartReceipt();
    _db.saveOrderToDatabase(receipt).then((value) {
      print('Order saved to database');
    }).catchError((error) {
      print('Error saving order to database: $error');
    });
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        backgroundColor: Colors.transparent,
      ),
      bottomNavigationBar: _buildBottomNavBar(context),
      body: const Column(
        children: [
          MyReceipt(),
        ],
      ),
    );
  }

  //custom bottom nav bar-message/call delivery driver
  Widget _buildBottomNavBar(BuildContext context) {
    return Container(
      height: 100,
      decoration: BoxDecoration(
        color: Theme.of(context).colorScheme.secondary,
        borderRadius: const BorderRadius.only(
          topLeft: Radius.circular(40),
          topRight: Radius.circular(40),
        ),
      ),
      padding: const EdgeInsets.all(25),
      child: Row(
        children: [
          //profile pic of driver
          Container(
            decoration: BoxDecoration(
              color: Theme.of(context).colorScheme.background,
              shape: BoxShape.circle,
            ),
            child: IconButton(
              onPressed: () {},
              icon: const Icon(Icons.person),
            ),
          ),
          const SizedBox(width: 10),

          //driver details
          Column(
            children: [
              Text(
                "Mitch Koko",
                style: TextStyle(
                  fontWeight: FontWeight.bold,
                  fontSize: 18,
                  color: Theme.of(context).colorScheme.inversePrimary,
                ),
              ),
              Text(
                "Driver",
                style: TextStyle(
                  color: Theme.of(context).colorScheme.primary,
                ),
              ),
            ],
          ),
          const Spacer(),
          Row(
            children: [
              //message buttton
              Container(
                decoration: BoxDecoration(
                  color: Theme.of(context).colorScheme.background,
                  shape: BoxShape.circle,
                ),
                child: IconButton(
                  onPressed: () {},
                  icon: const Icon(Icons.message),
                  color: Theme.of(context).colorScheme.primary,
                ),
              ),
              const SizedBox(width: 10),
              //call button
              Container(
                decoration: BoxDecoration(
                  color: Theme.of(context).colorScheme.background,
                  shape: BoxShape.circle,
                ),
                child: IconButton(
                  onPressed: () {},
                  icon: const Icon(Icons.call),
                  color: Colors.green,
                ),
              ),
            ],
          )
        ],
      ),
    );
  }
}

class FirestoreService {
  final FirebaseFirestore _firestore = FirebaseFirestore.instance;

  //get collection of orders
  CollectionReference getOrdersCollection() {
    return _firestore.collection('orders');
  }
  //save order to db
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