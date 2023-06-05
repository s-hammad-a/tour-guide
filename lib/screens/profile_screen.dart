
// import 'package:file_picker_cross/file_picker_cross.dart';
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
    Provider.of<ProfileScreenProvider>(context, listen: false).fullName.text = AuthService().auth.currentUser!.displayName! ?? "";
    Provider.of<ProfileScreenProvider>(context, listen: false).email.text = AuthService().auth.currentUser!.email! ?? "";
    Provider.of<ProfileScreenProvider>(context, listen: false).phone.text = AuthService().auth.currentUser!.photoURL!.split("||||")[0] ?? "";
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
            backgroundImage: NetworkImage(user.photoURL == null || user.photoURL!.endsWith("||||") ? "https://firebasestorage.googleapis.com/v0/b/togu-b76f2.appspot.com/o/placeholder.png?alt=media&token=33688152-c4ef-4b7e-86f7-51f0b1911980&_gl=1*ekz999*_ga*NTE1MDUyNDU3LjE2ODE2Njg4OTY.*_ga_CW55HF8NVT*MTY4NTgxMjM4Mi4yMC4xLjE2ODU4MTM2NzcuMC4wLjA." : user.photoURL!.split("||||")[1]),
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
            // FilePickerCross myFile = await FilePickerCross.importFromStorage();
            // Uint8List fileBytes = myFile.toUint8List();
            // String fileName = myFile.fileName!;
            // StorageManager sm = StorageManager();
            // String? location = await sm.uploadFile(fileName, fileBytes);
            // if(location != null) {
            //   print(location);
            //   await user.updatePhotoURL(location);
            //   Provider.of<ProfileScreenProvider>(context, listen: false).updateImage(user);
            // }
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

