import 'dart:io';
import 'package:firebase_storage/firebase_storage.dart';

Future<String> uploadProductImage(File imageFile) async {
  String fileName = 'product_images/${DateTime.now().millisecondsSinceEpoch}.jpg';
  Reference storageReference = FirebaseStorage.instance.ref().child(fileName);
  UploadTask uploadTask = storageReference.putFile(imageFile);
  TaskSnapshot storageTaskSnapshot = await uploadTask;
  String downloadUrl = await storageTaskSnapshot.ref.getDownloadURL();
  return downloadUrl;
}
