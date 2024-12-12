import 'package:cloud_firestore/cloud_firestore.dart';

Future<void> saveUserProfileData({
  required String userId,
  required String firstName,
  required String lastName,
  required String phoneNumber,
  required String address,
}) async {
  try {
    // Get reference to Firestore
    final firestore = FirebaseFirestore.instance;

    // Save the user profile data under the 'users' collection in Firestore
    await firestore.collection('users').doc(userId).set({
      'firstName': firstName,
      'lastName': lastName,
      'phoneNumber': phoneNumber,
      'address': address,
      'createdAt': FieldValue.serverTimestamp(), // Timestamp when the profile is created
    });

    print("User profile data saved successfully!");
  } catch (e) {
    print("Error saving user profile data: $e");
  }
}
