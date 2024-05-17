import 'dart:typed_data';

import 'package:cloud_firestore/cloud_firestore.dart';
import 'package:firebase_storage/firebase_storage.dart';

final FirebaseStorage _storage = FirebaseStorage.instance;
final FirebaseFirestore _firestore = FirebaseFirestore.instance;

class StoreData {
  Future<String> uploadImageToStorage(String profileImage, Uint8List file) async {
    Reference ref = _storage.ref().child(profileImage).child("id");
    UploadTask uploadTask = ref.putData(file);
    TaskSnapshot snapshot = await uploadTask;
    String downloadUrl = await snapshot.ref.getDownloadURL();
    return downloadUrl;
  }

  Future<String> saveData(String email, Uint8List file) async {
    try {
      String imageUrl = await uploadImageToStorage("profileImages", file);
      // Cari dokumen pengguna berdasarkan email
      QuerySnapshot querySnapshot = await _firestore.collection("users").where("email", isEqualTo: email).get();
      if (querySnapshot.docs.isNotEmpty) {
        // Dokumen pengguna ditemukan, simpan URL foto profil ke dalam dokumen tersebut
        DocumentSnapshot userDoc = querySnapshot.docs.first;
        await userDoc.reference.update({"photoUrl": imageUrl});
        return "Success";
      } else {
        return "User not found";
      }
    } catch (err) {
      return "Error: $err";
    }
  }
}