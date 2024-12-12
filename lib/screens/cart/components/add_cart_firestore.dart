import 'package:cloud_firestore/cloud_firestore.dart';
import 'package:firebase_auth/firebase_auth.dart';

Future<void> addToCart(String productId, int numOfItem) async {
  try {
    String userId = FirebaseAuth.instance.currentUser!.uid;
    CollectionReference cartItemsRef = FirebaseFirestore.instance
        .collection('carts')
        .doc(userId)
        .collection('cartItems');

    QuerySnapshot querySnapshot =
        await cartItemsRef.where('productId', isEqualTo: productId).get();

    if (querySnapshot.docs.isNotEmpty) {
      DocumentSnapshot existingCartItem = querySnapshot.docs.first;
      int currentNumOfItem = existingCartItem['numOfItem'];
      await cartItemsRef
          .doc(existingCartItem.id)
          .update({'numOfItem': currentNumOfItem + numOfItem});
    } else {
      await cartItemsRef.add({
        'productId': productId,
        'numOfItem': numOfItem,
      });
    }
  } catch (e) {
    print("Error adding to cart: $e");
  }
}
