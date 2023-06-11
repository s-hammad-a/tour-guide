import 'dart:math';
import 'dart:typed_data';
import 'package:firebase_auth/firebase_auth.dart';
import 'package:firebase_storage/firebase_storage.dart';
import 'package:permission_handler/permission_handler.dart';
import 'package:provider/provider.dart';

class StorageManager
{
  Future<String?> uploadFile(Uint8List fileBytes) async {
    String? location;

    // Upload file
    TaskSnapshot snapshot =  await FirebaseStorage.instance.ref('uploads/${Random().nextInt(99999).toString()}').putData(fileBytes);
    location = await snapshot.ref.getDownloadURL();
    //returns the download url
    return location;
  }
}