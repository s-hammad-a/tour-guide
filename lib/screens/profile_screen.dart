import 'dart:html';
import 'dart:typed_data';

import 'package:file_picker_cross/file_picker_cross.dart';
import 'package:firebase_auth/firebase_auth.dart';
import 'package:flutter/material.dart';
import 'package:provider/provider.dart';
import 'package:togu/controllers/profile_screen_controller.dart';
import 'package:togu/firebase/firebase_auth.dart';
import 'package:togu/firebase/firebase_storage.dart';

class ProfileScreen extends StatelessWidget {
  const ProfileScreen({Key? key}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    print(AuthService().auth.currentUser!.photoURL);
    User? user = Provider.of<User>(context);
    return Column(
      children: [
        const SizedBox(height: 30,),
        TextButton(
          onPressed: () async {
            // FilePickerCross myFile = await FilePickerCross.importFromStorage();
            // Uint8List fileBytes = myFile.toUint8List();
            // String fileName = myFile.fileName!;
            // StorageManager sm = StorageManager();
            // String? location = await sm.uploadFile(fileName, fileBytes);
            // if(location != null) {
            //   print(location);
            //   await user!.updatePhotoURL(location);
            //   await user.reload();
            //   Provider.of<EditProfileProvider>(context, listen: false).updateImage(user);
            //   Provider.of<HomeScreenProvider>(context, listen: false).jumpToPage(3, user);
            // }
          },
          child: CircleAvatar(
            backgroundImage: NetworkImage(user.photoURL!.endsWith("||||") ? "https://firebasestorage.googleapis.com/v0/b/togu-b76f2.appspot.com/o/placeholder.png?alt=media&token=33688152-c4ef-4b7e-86f7-51f0b1911980&_gl=1*ekz999*_ga*NTE1MDUyNDU3LjE2ODE2Njg4OTY.*_ga_CW55HF8NVT*MTY4NTgxMjM4Mi4yMC4xLjE2ODU4MTM2NzcuMC4wLjA." : user.photoURL!.split("||||")[1]),
            radius: 50,
          ),
        ),
        const SizedBox(height: 10,),
        TextButton(
          style: const ButtonStyle(
            fixedSize: MaterialStatePropertyAll(Size(140, 20)),
            backgroundColor: MaterialStatePropertyAll(Colors.black),
          ),
          onPressed: () async {
            FilePickerCross myFile = await FilePickerCross.importFromStorage();
            Uint8List fileBytes = myFile.toUint8List();
            String fileName = myFile.fileName!;
            StorageManager sm = StorageManager();
            String? location = await sm.uploadFile(fileName, fileBytes);
            if(location != null) {
              print(location);
              await user.updatePhotoURL(location);
              Provider.of<ProfileScreenProvider>(context, listen: false).updateImage(user);
            }
          },
          child: const Text(
            "Update Profile Pic",
            style: TextStyle(
              fontSize: 12,
              color: Colors.white,
            ),
          ),
        ),
        const SizedBox(height: 10,),
        Padding(
          padding: const EdgeInsets.fromLTRB(30, 30, 30, 5),
          child: Row(
            children: [
              const SizedBox(
                width: 110,
                child: Text(
                  "Full name: ",
                  style: TextStyle(
                    color: Colors.black,
                    fontSize: 20,
                  ),
                ),
              ),
              Expanded(
                child: Text(
                  user.displayName != null ? user.displayName! : " ",
                  style: const TextStyle(
                    color: Colors.black,
                    fontSize: 20,
                  ),
                  overflow: TextOverflow.visible,
                ),
              ),
            ],
          ),
        ),
        Padding(
          padding: const EdgeInsets.fromLTRB(30, 30, 30, 5),
          child: Row(
            children: [
              const SizedBox(
                width: 110,
                child: Text(
                  "Email: ",
                  style: TextStyle(
                    color: Colors.black,
                    fontSize: 20,
                  ),
                ),
              ),
              Expanded(
                child: Text(
                  user.email ??  " ",
                  style: const TextStyle(
                    color: Colors.black,
                    fontSize: 20,
                  ),
                  overflow: TextOverflow.visible,
                ),
              ),
            ],
          ),
        ),
        Padding(
          padding: const EdgeInsets.fromLTRB(30, 30, 30, 5),
          child: Row(
            children: [
              const SizedBox(
                width: 110,
                child: Text(
                  "Role: ",
                  style: TextStyle(
                    color: Colors.black,
                    fontSize: 20,
                  ),
                ),
              ),
              Expanded(
                child: Text(
                  user.email!.contains("@helper.com") ? "Admin" : user.email!.contains("@uhb.edu.sa") ? "User": "Visitor",
                  style: const TextStyle(
                    color: Colors.black,
                    fontSize: 20,
                    overflow: TextOverflow.visible,
                  ),
                ),
              ),
            ],
          ),
        ),
        const Expanded(child: SizedBox.shrink()),
        Padding(
          padding: const EdgeInsets.fromLTRB(30, 10, 30, 10),
          child: SizedBox(
            width: 250,
            child: TextButton(
              onPressed: () async {
                AuthService().signOut();
              },
              style: const ButtonStyle(
                  backgroundColor: MaterialStatePropertyAll(Color(0xFF151A4F),)
              ),
              child: const Text(
                "Sign Out",
                textAlign: TextAlign.center,
                style: TextStyle(
                  color: Colors.white,
                  fontSize: 15,
                ),
              ),
            ),
          ),
        ),
        const SizedBox(height: 10,),
      ],
    );
  }
}
