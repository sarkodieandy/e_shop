import 'package:cloud_firestore/cloud_firestore.dart';
import 'package:firebase_auth/firebase_auth.dart';

Future<double> calculateTotal() async {
  String userId = FirebaseAuth.instance.currentUser!.uid;
  QuerySnapshot querySnapshot = await FirebaseFirestore.instance
      .collection('carts')
      .doc(userId)
      .collection('cartItems')
      .get();

  double total = 0.0;
  for (var doc in querySnapshot.docs) {
    int quantity = doc['numOfItem'];
    double price = await getProductPrice(doc['productId']);
    total += quantity * price;
  }
  return total;
}

Future<double> getProductPrice(String productId) async {
  DocumentSnapshot productDoc = await FirebaseFirestore.instance
      .collection('products')
      .doc(productId)
      .get();
  return productDoc['price'] ?? 0.0;
}
