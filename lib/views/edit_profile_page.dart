import 'dart:io';

import 'package:firebase_auth/firebase_auth.dart';
import 'package:firebase_storage/firebase_storage.dart';
import 'package:flutter/material.dart';
import 'package:image_picker/image_picker.dart';

class EditProfilePage extends StatefulWidget {
  const EditProfilePage({super.key});

  @override
  State<EditProfilePage> createState() => _EditProfilePageState();
}

class _EditProfilePageState extends State<EditProfilePage> {
  // late User? user;
  final user = FirebaseAuth.instance.currentUser;
  final emailController = TextEditingController();
  final nameController = TextEditingController();

  ImagePicker picker = ImagePicker();
  File? image;

  @override
  void dispose() {
    nameController.dispose();
    super.dispose();
  }

  Future pickImage() async {
    try {
      XFile? pickedImage = await picker.pickImage(source: ImageSource.gallery);
      if (pickedImage != null) {
        setState(() {
          image = File(pickedImage.path);
        });
        bool success = await uploadPhoto(image!);
        print("hasil akhir $success");
      }
    } catch (e) {
      print("error pick image $e");
    }
  }

  Future<bool> uploadPhoto(File file) async {
    try {
      final userId = FirebaseAuth.instance.currentUser?.uid;
      final storageRef = FirebaseStorage.instance.ref();
      final fileName = file.path.split("/").last;
      final uploadRef =
          storageRef.child("$userId/uploads/$fileName");
      await uploadRef.putFile(file);
      print("berhasil");
      return true;
    } catch (e) {
      print("error upload photo $e");
    }
    return false;
  }

  void updateProfile(BuildContext context) async {
    final user = FirebaseAuth.instance.currentUser;
    if (user != null) {
      try {
        await user.updateDisplayName(nameController.text);
        await user.updatePhotoURL(image!.path);
        
        ScaffoldMessenger.of(context).showSnackBar(
          const SnackBar(
            content: Text('Berhasil merubah nama!'),
            backgroundColor: Colors.green,
          ),
        ); // Navigate back to profile page
      } on FirebaseAuthException catch (e) {
        ScaffoldMessenger.of(context).showSnackBar(
          SnackBar(
            content: Text('Error updating name: ${e.message}'),
            backgroundColor: Colors.red,
          ),
        );
      }
    } else {
      // Handle case where user is not signed in
      ScaffoldMessenger.of(context).showSnackBar(
        const SnackBar(
          content: Text('Please sign in to update your name'),
        ),
      );
    }
  }

  @override
  Widget build(BuildContext context) {
    return GestureDetector(
      onTap: () {
        FocusScope.of(context).unfocus();
      },
      child: Scaffold(
        appBar: AppBar(
          backgroundColor: const Color(0xffFBFBFB),
          title: const Text("Edit Profile"),
        ),
        body: ListView(
          padding: const EdgeInsets.symmetric(horizontal: 24),
          children: [
            Column(
              children: [
                Row(
                  children: [
                    GestureDetector(
                      onTap: () async {
                        await pickImage();
                      },
                      // child: CircleAvatar(
                      //   radius: 22,
                      //   backgroundImage: AssetImage("assets/images/alya.png"),
                      // ),
                      child: image != null
                          ? Image.file(
                              image!,
                              height: 30,
                              width: 30,
                            )
                          : const Icon(Icons.person),
                    ),
                    const SizedBox(width: 20),
                    const Text(
                      "Put your best profile pic!",
                      style: TextStyle(
                        fontSize: 15,
                      ),
                    ),
                  ],
                ),
                const SizedBox(height: 20),
                TextFormField(
                  // initialValue: user!.displayName,
                  controller: nameController,
                  decoration: const InputDecoration(
                    border: UnderlineInputBorder(),
                    labelText: 'Enter your name',
                  ),
                ),
                const SizedBox(height: 10),
                TextFormField(
                  // initialValue: user!.email,
                  controller: emailController,
                  decoration: const InputDecoration(
                    border: UnderlineInputBorder(),
                    labelText: 'Enter your email',
                  ),
                ),
                const SizedBox(height: 15),
                GestureDetector(
                  onTap: () => updateProfile(context),
                  child: Container(
                    padding: const EdgeInsets.symmetric(
                        vertical: 10, horizontal: 20),
                    decoration: BoxDecoration(
                      borderRadius: BorderRadius.circular(10),
                      color: const Color(0xff004AAD),
                    ),
                    child: const Text(
                      "Save",
                      style: TextStyle(
                        color: Color.fromARGB(255, 255, 250, 176),
                        fontWeight: FontWeight.w700,
                        fontSize: 14,
                      ),
                    ),
                  ),
                )
              ],
            ),
          ],
        ),
      ),
    );
  }
}
