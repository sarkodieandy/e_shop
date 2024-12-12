import 'dart:io';
import 'package:cloud_firestore/cloud_firestore.dart';
import 'package:firebase_storage/firebase_storage.dart';
import 'package:flutter/material.dart';
import 'package:image_picker/image_picker.dart';
import 'package:flutter_svg/flutter_svg.dart';

class ProfilePic extends StatefulWidget {
  final String userId;

  const ProfilePic({
    required this.userId,
    super.key,
  });

  @override
  _ProfilePicState createState() => _ProfilePicState();
}

class _ProfilePicState extends State<ProfilePic> {
  File? _image;

  Future<String> uploadImage(File image, String userId) async {
    final storageRef = FirebaseStorage.instance.ref().child('profile_images').child('$userId.jpg');
    final uploadTask = storageRef.putFile(image);

    await uploadTask.whenComplete(() => null);
    final downloadUrl = await storageRef.getDownloadURL();
    return downloadUrl;
  }

  Future<void> saveUserProfileImage(String userId, String downloadUrl) async {
    final userRef = FirebaseFirestore.instance.collection('users').doc(userId);
    await userRef.set({'profileImageUrl': downloadUrl}, SetOptions(merge: true));
  }

  Future<void> _pickImage() async {
    final picker = ImagePicker();
    final pickedFile = await picker.pickImage(source: ImageSource.gallery);

    if (pickedFile != null) {
      final imageUrl = await uploadImage(File(pickedFile.path), widget.userId);
      await saveUserProfileImage(widget.userId, imageUrl);
      setState(() {
        _image = File(pickedFile.path);
      });
    }
  }

  @override
  Widget build(BuildContext context) {
    return FutureBuilder<DocumentSnapshot>(
      future: FirebaseFirestore.instance.collection('users').doc(widget.userId).get(),
      builder: (context, snapshot) {
        if (snapshot.connectionState == ConnectionState.waiting) {
          return CircularProgressIndicator();
        }
        if (!snapshot.hasData || !snapshot.data!.exists) {
          return CircleAvatar(
            backgroundImage: AssetImage("assets/images/Profile Image.png"),
          );
        }
        String profileImageUrl = snapshot.data!['profileImageUrl'];
        return SizedBox(
          height: 115,
          width: 115,
          child: Stack(
            fit: StackFit.expand,
            clipBehavior: Clip.none,
            children: [
              CircleAvatar(
                backgroundImage: _image != null ? FileImage(_image!) : NetworkImage(profileImageUrl) as ImageProvider,
              ),
              Positioned(
                right: -16,
                bottom: 0,
                child: SizedBox(
                  height: 46,
                  width: 46,
                  child: TextButton(
                    style: TextButton.styleFrom(
                      foregroundColor: Colors.white,
                      shape: RoundedRectangleBorder(
                        borderRadius: BorderRadius.circular(50),
                        side: BorderSide(color: Colors.white),
                      ),
                      backgroundColor: Color(0xFFF5F6F9),
                    ),
                    onPressed: _pickImage,
                    child: SvgPicture.asset("assets/icons/Camera Icon.svg"),
                  ),
                ),
              )
            ],
          ),
        );
      },
    );
  }
}
