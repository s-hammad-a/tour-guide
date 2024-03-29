
// import 'package:file_picker_cross/file_picker_cross.dart';
import 'dart:io';
import 'dart:typed_data';

import 'package:file_picker/file_picker.dart';
import 'package:firebase_auth/firebase_auth.dart';
import 'package:flutter/material.dart';
import 'package:permission_handler/permission_handler.dart';
import 'package:provider/provider.dart';
import 'package:togu/controllers/home_screen_controller.dart';
import 'package:togu/controllers/profile_screen_controller.dart';
import 'package:togu/firebase/firebase_auth.dart';
import 'package:togu/firebase/firebase_storage.dart';

class ProfileScreen extends StatelessWidget {
  const ProfileScreen({Key? key}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return Column(
      children: [
        const SizedBox(height: 30,),
        TextButton(
          onPressed: () async {
            print(await Permission.storage.request());
            print(await Permission.photos.request());
            print(await Permission.accessMediaLocation.request());
            print(await Permission.manageExternalStorage.request());
            FilePickerResult? result = await FilePicker.platform.pickFiles();
            if (result != null) {
              File file = File(result.files.single.path!);
              Uint8List fileBytes = await file.readAsBytes();
              StorageManager sm = StorageManager();
              String? location = await sm.uploadFile(fileBytes);
              if(location != null) {
                await AuthService().auth.currentUser!.updatePhotoURL("${AuthService().auth.currentUser!.photoURL!.split("||||")[0]}||||$location");
                await AuthService().auth.currentUser!.reload();
                Provider.of<ProfileScreenProvider>(context, listen: false).updateImage();
                Provider.of<HomeScreenProvider>(context, listen: false).setCurrentIndex(3);
              }
            }
          },
          child: CircleAvatar(
            backgroundImage: NetworkImage(AuthService().auth.currentUser!.photoURL == null || AuthService().auth.currentUser!.photoURL!.endsWith("||||") ? "https://firebasestorage.googleapis.com/v0/b/togu-b76f2.appspot.com/o/placeholder.png?alt=media&token=33688152-c4ef-4b7e-86f7-51f0b1911980&_gl=1*ekz999*_ga*NTE1MDUyNDU3LjE2ODE2Njg4OTY.*_ga_CW55HF8NVT*MTY4NTgxMjM4Mi4yMC4xLjE2ODU4MTM2NzcuMC4wLjA." : AuthService().auth.currentUser!.photoURL!.split("||||")[1],),
            radius: 50,
          ),
        ),
        const SizedBox(height: 10,),
        TextButton(
          style: const ButtonStyle(
            fixedSize: MaterialStatePropertyAll(Size(140, 20)),
              backgroundColor: MaterialStatePropertyAll(Color(0xFF151A4F),)
          ),
          onPressed: () async {
            print(await Permission.storage.request());
            print(await Permission.photos.request());
            print(await Permission.accessMediaLocation.request());
            print(await Permission.manageExternalStorage.request());
            FilePickerResult? result = await FilePicker.platform.pickFiles();
            if (result != null) {
              File file = File(result.files.single.path!);
              Uint8List fileBytes = await file.readAsBytes();
              StorageManager sm = StorageManager();
              String? location = await sm.uploadFile(fileBytes);
              if(location != null) {
                await AuthService().auth.currentUser!.updatePhotoURL("${AuthService().auth.currentUser!.photoURL!.split("||||")[0]}||||$location");
                await AuthService().auth.currentUser!.reload();
                Provider.of<ProfileScreenProvider>(context, listen: false).updateImage();
                Provider.of<HomeScreenProvider>(context, listen: false).setCurrentIndex(3);
              }
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
                child: SizedBox(
                  height: 40,
                  child: TextFormField(
                    maxLines: 1,
                    style: const TextStyle(
                      color: Colors.black,
                      fontSize: 18.0,
                    ),
                    cursorColor: Colors.black,
                    textAlignVertical: TextAlignVertical.center,
                    controller: Provider.of<ProfileScreenProvider>(context, listen: false).fullName,
                    onChanged: (value) {
                      Provider.of<ProfileScreenProvider>(context, listen: false).setUpdateButton(true);
                    },
                    decoration: const InputDecoration(
                      filled: true,
                      fillColor: Color(0xFFFEF7E7),
                      enabledBorder: OutlineInputBorder(
                        borderSide: BorderSide(color: Color(0xFFABA0A0), width: 1.0),
                        borderRadius: BorderRadius.all(Radius.circular(10)),
                      ),
                      hintText: "Full Name",
                      hintStyle: TextStyle(
                          fontSize: 18,
                          color: Colors.black,
                          letterSpacing: 0.5
                      ),
                    ),
                  ),
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
                child: SizedBox(
                  height: 40,
                  child: TextFormField(
                    maxLines: 1,
                    style: const TextStyle(
                      color: Colors.black,
                      fontSize: 18.0,
                    ),
                    cursorColor: Colors.black,
                    textAlignVertical: TextAlignVertical.center,
                    controller: Provider.of<ProfileScreenProvider>(context, listen: false).email,
                    onChanged: (value) {
                      Provider.of<ProfileScreenProvider>(context, listen: false).setUpdateButton(true);
                    },
                    decoration: const InputDecoration(
                      filled: true,
                      fillColor: Color(0xFFFEF7E7),
                      enabledBorder: OutlineInputBorder(
                        borderSide: BorderSide(color: Color(0xFFABA0A0), width: 1.0),
                        borderRadius: BorderRadius.all(Radius.circular(10)),
                      ),
                      hintText: "Email",
                      hintStyle: TextStyle(
                          fontSize: 18,
                          color: Colors.black,
                          letterSpacing: 0.5
                      ),
                    ),
                  ),
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
                  "Phone Number: ",
                  style: TextStyle(
                    color: Colors.black,
                    fontSize: 20,
                  ),
                ),
              ),
              Expanded(
                child: SizedBox(
                  height: 40,
                  child: TextFormField(
                    maxLines: 1,
                    style: const TextStyle(
                      color: Colors.black,
                      fontSize: 18.0,
                    ),
                    cursorColor: Colors.black,
                    textAlignVertical: TextAlignVertical.center,
                    controller: Provider.of<ProfileScreenProvider>(context, listen: false).phone,
                    onChanged: (value) {
                      Provider.of<ProfileScreenProvider>(context, listen: false).setUpdateButton(true);
                    },
                    decoration: const InputDecoration(
                      filled: true,
                      fillColor: Color(0xFFFEF7E7),
                      enabledBorder: OutlineInputBorder(
                        borderSide: BorderSide(color: Color(0xFFABA0A0), width: 1.0),
                        borderRadius: BorderRadius.all(Radius.circular(10)),
                      ),
                      hintText: "Phone Number:",
                      hintStyle: TextStyle(
                          fontSize: 18,
                          color: Colors.black,
                          letterSpacing: 0.5
                      ),
                    ),
                  ),
                ),
              ),
            ],
          ),
        ),
        const UpdateButton(),
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

class UpdateButton extends StatelessWidget {
  const UpdateButton({Key? key}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    User? user = Provider.of<User>(context);
    return Padding(
        padding: const EdgeInsets.fromLTRB(30, 30, 30, 10),
        child: SizedBox(
          width: 250,
          child: TextButton(
            onPressed: () async {
              if(Provider.of<ProfileScreenProvider>(context, listen: false).updateButton) {
                await Provider.of<ProfileScreenProvider>(context, listen: false).updateInfo(context, user);
              }
            },
            style: ButtonStyle(
                backgroundColor: context.watch<ProfileScreenProvider>().updateButton ? const MaterialStatePropertyAll(Color(0xFF151A4F)) : const MaterialStatePropertyAll(Color(0x77151A4F))
            ),
            child: const Text(
              "Update Info",
              textAlign: TextAlign.center,
              style: TextStyle(
                color: Colors.white,
                fontSize: 15,
              ),
            ),
          ),
        ),
      );
  }
}

