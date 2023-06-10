import 'package:firebase_auth/firebase_auth.dart';
import 'package:flutter/material.dart';
import 'package:provider/provider.dart';
import 'package:togu/controllers/edit_screen_controller.dart';

class EditScreen extends StatelessWidget {
  const EditScreen({Key? key}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    dynamic args = ModalRoute.of(context)!.settings.arguments;
    if (args == null) {
      Navigator.pop(context);
    }
    Provider.of<EditScreenProvider>(context, listen: false).name = args['name'].toString();
    return Scaffold(
      backgroundColor: const Color(0xFFDCE3D3),
      appBar: AppBar(
        centerTitle: true,
        title: const Text(
          "Smart Tour Guide",
          style: TextStyle(
              color: Colors.white,
              fontSize: 20
          ),
        ),
        backgroundColor: const Color(0xFF8F967A),
      ),
      body: Padding(
        padding: const EdgeInsets.symmetric(horizontal: 40.0),
        child: Column(
          children: [
            const SizedBox(height: 30,),
            const Text(
              "Edit Data",
              style: TextStyle(
                color: Colors.black,
                fontSize: 20,
                fontWeight: FontWeight.bold,
              ),
            ),
            const SizedBox(height: 20,),
            SizedBox(
              height: 40,
              child: TextFormField(
                style: const TextStyle(
                  color: Colors.black,
                  fontSize: 20,
                ),
                onChanged: (value) {
                  Provider.of<EditScreenProvider>(context, listen: false).setUpdateButton(true);
                },
                controller: context.watch<EditScreenProvider>().contactController,
                decoration: const InputDecoration(
                  hintText: "Contact",
                  hintStyle: TextStyle(
                    color: Colors.grey,
                    fontSize: 20,
                  ),
                  border: UnderlineInputBorder(
                    borderSide: BorderSide(color: Colors.black),
                  ),
                  focusedBorder: UnderlineInputBorder(
                    borderSide: BorderSide(color: Colors.black),
                  ),
                  enabledBorder: UnderlineInputBorder(
                    borderSide: BorderSide(color: Colors.black),
                  ),
                ),
              ),
            ),
            const SizedBox(height: 20,),
            SizedBox(
              height: 40,
              child: TextFormField(
                style: const TextStyle(
                  color: Colors.black,
                  fontSize: 20,
                ),
                onChanged: (value) {
                  Provider.of<EditScreenProvider>(context, listen: false).setUpdateButton(true);
                },
                controller: context.watch<EditScreenProvider>().socialController,
                decoration: const InputDecoration(
                  hintText: "Social Media",
                  hintStyle: TextStyle(
                    color: Colors.grey,
                    fontSize: 20,
                  ),
                  border: UnderlineInputBorder(
                    borderSide: BorderSide(color: Colors.black),
                  ),
                  focusedBorder: UnderlineInputBorder(
                    borderSide: BorderSide(color: Colors.black),
                  ),
                  enabledBorder: UnderlineInputBorder(
                    borderSide: BorderSide(color: Colors.black),
                  ),
                ),
              ),
            ),
            const SizedBox(height: 20,),
            SizedBox(
              height: 40,
              child: TextFormField(
                style: const TextStyle(
                  color: Colors.black,
                  fontSize: 20,
                ),
                onChanged: (value) {
                  Provider.of<EditScreenProvider>(context, listen: false).setUpdateButton(true);
                },
                controller: context.watch<EditScreenProvider>().emailController,
                decoration: const InputDecoration(
                  hintText: "Email",
                  hintStyle: TextStyle(
                    color: Colors.grey,
                    fontSize: 20,
                  ),
                  border: UnderlineInputBorder(
                    borderSide: BorderSide(color: Colors.black),
                  ),
                  focusedBorder: UnderlineInputBorder(
                    borderSide: BorderSide(color: Colors.black),
                  ),
                  enabledBorder: UnderlineInputBorder(
                    borderSide: BorderSide(color: Colors.black),
                  ),
                ),
              ),
            ),
            const SizedBox(height: 20,),
            SizedBox(
              height: 40,
              child: TextFormField(
                style: const TextStyle(
                  color: Colors.black,
                  fontSize: 20,
                ),
                onChanged: (value) {
                  Provider.of<EditScreenProvider>(context, listen: false).setUpdateButton(true);
                },
                controller: context.watch<EditScreenProvider>().websiteController,
                decoration: const InputDecoration(
                  hintText: "Website",
                  hintStyle: TextStyle(
                    color: Colors.grey,
                    fontSize: 20,
                  ),
                  border: UnderlineInputBorder(
                    borderSide: BorderSide(color: Colors.black),
                  ),
                  focusedBorder: UnderlineInputBorder(
                    borderSide: BorderSide(color: Colors.black),
                  ),
                  enabledBorder: UnderlineInputBorder(
                    borderSide: BorderSide(color: Colors.black),
                  ),
                ),
              ),
            ),
            const SizedBox(height: 20,),
            SizedBox(
              height: 40,
              child: TextFormField(
                style: const TextStyle(
                  color: Colors.black,
                  fontSize: 20,
                ),
                onChanged: (value) {
                  Provider.of<EditScreenProvider>(context, listen: false).setUpdateButton(true);
                },
                controller: context.watch<EditScreenProvider>().locationController,
                decoration: const InputDecoration(
                  hintText: "Location",
                  hintStyle: TextStyle(
                    color: Colors.grey,
                    fontSize: 20,
                  ),
                  border: UnderlineInputBorder(
                    borderSide: BorderSide(color: Colors.black),
                  ),
                  focusedBorder: UnderlineInputBorder(
                    borderSide: BorderSide(color: Colors.black),
                  ),
                  enabledBorder: UnderlineInputBorder(
                    borderSide: BorderSide(color: Colors.black),
                  ),
                ),
              ),
            ),
            const SizedBox(height: 20,),
            SizedBox(
              height: 240,
              child: TextFormField(
                minLines: 1,
                maxLines: 6,
                style: const TextStyle(
                  color: Colors.black,
                  fontSize: 20,
                ),
                onChanged: (value) {
                  Provider.of<EditScreenProvider>(context, listen: false).setUpdateButton(true);
                },
                controller: context.watch<EditScreenProvider>().descController,
                decoration: const InputDecoration(
                  hintText: "Description",
                  hintStyle: TextStyle(
                    color: Colors.grey,
                    fontSize: 20,
                  ),
                  border: UnderlineInputBorder(
                    borderSide: BorderSide(color: Colors.black),
                  ),
                  focusedBorder: UnderlineInputBorder(
                    borderSide: BorderSide(color: Colors.black),
                  ),
                  enabledBorder: UnderlineInputBorder(
                    borderSide: BorderSide(color: Colors.black),
                  ),
                ),
              ),
            ),
            const Expanded(child: SizedBox.shrink()),
            const UpdateButton(),
            const SizedBox(height: 40,),
          ],
        ),
      ),
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
            Provider.of<EditScreenProvider>(context, listen: false).updateInformation();
          },
          style: ButtonStyle(
              backgroundColor: context.watch<EditScreenProvider>().updateButton ? const MaterialStatePropertyAll(Color(0xFF151A4F)) : const MaterialStatePropertyAll(Color(0x77151A4F))
          ),
          child: const Text(
            "Update Information",
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