import 'package:cloud_firestore/cloud_firestore.dart';
import 'package:e_shop/models/Cart.dart';
import 'package:firebase_auth/firebase_auth.dart';

Future<void> removeCartItem(String productId) async {
  String userId = FirebaseAuth.instance.currentUser!.uid;
  CollectionReference cartItemsRef = FirebaseFirestore.instance
      .collection('carts')
      .doc(userId)
      .collection('cartItems');

  QuerySnapshot querySnapshot =
      await cartItemsRef.where('productId', isEqualTo: productId).get();

  if (querySnapshot.docs.isNotEmpty) {
    await querySnapshot.docs.first.reference.delete();
  }
}
