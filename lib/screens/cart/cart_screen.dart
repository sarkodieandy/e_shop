import 'package:cloud_firestore/cloud_firestore.dart';
import 'package:e_shop/screens/cart/components/check_out_card.dart';
import 'package:firebase_auth/firebase_auth.dart';
import 'package:flutter/material.dart';

class CartScreen extends StatefulWidget {
  static String routeName = "/cart";

  const CartScreen({super.key});

  @override
  State<CartScreen> createState() => _CartScreenState();
}

class _CartScreenState extends State<CartScreen> {
  late Stream<QuerySnapshot> cartStream;

  @override
  void initState() {
    super.initState();
    String userId = FirebaseAuth.instance.currentUser!.uid;
    cartStream = FirebaseFirestore.instance
        .collection('carts')
        .doc(userId)
        .collection('cartItems')
        .snapshots();
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: const Text("Your Cart"),
      ),
      body: StreamBuilder<QuerySnapshot>(
        stream: cartStream,
        builder: (context, snapshot) {
          if (snapshot.connectionState == ConnectionState.waiting) {
            return const Center(child: CircularProgressIndicator());
          }
          if (snapshot.hasError) {
            return const Center(child: Text("Error loading cart items."));
          }
          final cartDocs = snapshot.data?.docs ?? [];
          if (cartDocs.isEmpty) {
            return const Center(child: Text("Your cart is empty."));
          }

          return ListView.builder(
            itemCount: cartDocs.length,
            itemBuilder: (context, index) {
              final cartData = cartDocs[index];
              return Dismissible(
                key: Key(cartData.id),
                onDismissed: (_) async {
                  await cartData.reference.delete();
                },
                background: Container(color: Colors.red),
                child: ListTile(
                  title: Text(cartData['productId']),
                  subtitle: Text("Quantity: ${cartData['numOfItem']}"),
                ),
              );
            },
          );
        },
      ),
      bottomNavigationBar: const CheckoutCard(),
    );
  }
}
