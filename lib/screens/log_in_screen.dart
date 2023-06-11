import 'package:flutter/material.dart';
import 'package:provider/provider.dart';
import 'package:togu/controllers/log_in_controller.dart';
import 'package:togu/firebase/firebase_auth.dart';

class LoginScreen extends StatelessWidget {
  const LoginScreen({Key? key}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    Size size = MediaQuery.of(context).size;
    return Scaffold(
      backgroundColor: const Color(0xFFEFF2EB),
      body: Column(
        children: [
          Expanded(
              child: Image.asset("assets/map.png", fit: BoxFit.fitHeight,)
          ),
          SizedBox(
            height: size.height/1.5,
            child: Stack(
              children: [
                Container(
                  decoration: BoxDecoration(
                    borderRadius: BorderRadius.only(topLeft: const Radius.elliptical(150,40), topRight: Radius.elliptical(size.height/3, size.height/3)),
                    color: const Color(0x88A5AA94),
                  ),
                  height: size.height/1.5,
                ),
                Padding(
                  padding: const EdgeInsets.symmetric(horizontal: 20, vertical: 20),
                  child: Column(
                    crossAxisAlignment: CrossAxisAlignment.start,
                    children: [
                      const SizedBox(height: 20,),
                      const Expanded(
                        flex: 2,
                        child: Text(
                          "Log In",
                          style: TextStyle(
                            color: Color(0xFF6F7C42),
                            fontSize: 20,
                            fontWeight: FontWeight.bold
                          ),
                        ),
                      ),
                      Expanded(
                        child: SizedBox(
                          height: 40,
                          child: TextFormField(
                            style: const TextStyle(
                              color: Colors.white,
                              fontSize: 20,
                            ),
                            controller: context.watch<LoginProvider>().emailController,
                            decoration: const InputDecoration(
                              hintText: "Email",
                              hintStyle: TextStyle(
                                color: Colors.white,
                                fontSize: 20,
                              ),
                              border: UnderlineInputBorder(
                                borderSide: BorderSide(color: Colors.white),
                              ),
                              focusedBorder: UnderlineInputBorder(
                                borderSide: BorderSide(color: Colors.white),
                              ),
                              enabledBorder: UnderlineInputBorder(
                                borderSide: BorderSide(color: Colors.white),
                              ),
                            ),
                          ),
                        ),
                      ),
                      Expanded(
                        child: SizedBox(
                          height: 40,
                          child: TextFormField(
                            style: const TextStyle(
                              color: Colors.white,
                              fontSize: 20,
                            ),
                            controller: context.watch<LoginProvider>().passwordController,
                            obscureText: true,
                            decoration: const InputDecoration(
                              hintText: "Password",
                              hintStyle: TextStyle(
                                color: Colors.white,
                                fontSize: 20,
                              ),
                              border: UnderlineInputBorder(
                                borderSide: BorderSide(color: Colors.white),
                              ),
                              focusedBorder: UnderlineInputBorder(
                                borderSide: BorderSide(color: Colors.white),
                              ),
                              enabledBorder: UnderlineInputBorder(
                                borderSide: BorderSide(color: Colors.white),
                              ),
                            ),
                          ),
                        ),
                      ),
                      Expanded(
                        child: SizedBox(
                          height: 40,
                          child: TextButton(
                            style: const ButtonStyle(
                              backgroundColor: MaterialStatePropertyAll(Color(0x00A5AA94)),
                              padding: MaterialStatePropertyAll(EdgeInsets.symmetric(vertical: 0, horizontal: 5)),
                            ),
                            onPressed: () async {
                              showDialog(
                                context: context,
                                builder: (BuildContext context) {
                                  return AlertDialog(
                                    backgroundColor: const Color(0xFFBFB6AA),
                                    shape: const OutlineInputBorder(
                                      borderSide: BorderSide(color: Color(0xFF545454), width: 1.0),
                                      borderRadius: BorderRadius.all(Radius.circular(10.0)),
                                    ),
                                    titlePadding: EdgeInsets.zero,
                                    title: Container(
                                      decoration: const BoxDecoration(
                                        color: Color(0xFF8F967A),
                                        borderRadius: BorderRadius.vertical(top: Radius.circular(10.0)),
                                      ),
                                      padding: const EdgeInsets.only(left: 20),
                                      height: 40,
                                      child: const Row(
                                        children: [
                                          Icon(
                                            Icons.info_outline,
                                            size: 20,
                                            color: Colors.white,
                                          ),
                                          SizedBox(width: 10,),
                                          Text(
                                            'Password Reset',
                                            style: TextStyle(
                                              fontSize: 18,
                                              color: Colors.white,
                                            ),
                                          ),
                                        ],
                                      ),
                                    ),
                                    content: SizedBox(
                                      height: 120,
                                      width: 400,
                                      child: Column(
                                        children: [
                                          const SizedBox(
                                            height: 30,
                                            width: 570,
                                            child: Text(
                                              " Enter Email Address",
                                              style: TextStyle(
                                                color: Colors.white,
                                                fontSize: 20,
                                              ),
                                            ),
                                          ),
                                          const SizedBox(height: 10,),
                                          SizedBox(
                                            width: 580,
                                            height: 80,
                                            child: TextFormField(
                                              style: const TextStyle(
                                                color: Colors.white,
                                                fontSize: 15,
                                              ),
                                              controller: context.watch<LoginProvider>().resetEmailController,
                                              decoration: InputDecoration(
                                                hintText: "Email Address",
                                                hintStyle: const TextStyle(
                                                  color: Colors.white,
                                                  fontSize: 15,
                                                ),
                                                helperText: context.watch<LoginProvider>().helperText,
                                                helperStyle: const TextStyle(
                                                    color: Colors.red
                                                ),
                                                border: const UnderlineInputBorder(
                                                  borderSide: BorderSide(color: Colors.white),
                                                ),
                                                focusedBorder: const UnderlineInputBorder(
                                                  borderSide: BorderSide(color: Colors.white),
                                                ),
                                                enabledBorder: const UnderlineInputBorder(
                                                  borderSide: BorderSide(color: Colors.white),
                                                ),
                                              ),
                                            ),
                                          ),
                                        ],
                                      ),
                                    ),
                                    actions: [
                                      ElevatedButton(
                                        style: const ButtonStyle(
                                            backgroundColor: MaterialStatePropertyAll(Color(0xFF8F967A))
                                        ),
                                        onPressed: () async {
                                          if(Provider.of<LoginProvider>(context, listen: false).checkInfo()) {
                                            await AuthService().auth.sendPasswordResetEmail(email: Provider.of<LoginProvider>(context, listen: false).resetEmailController.text).whenComplete(() => Navigator.pop(context));
                                          }
                                        },
                                        child: const Text(
                                          'Confirm',
                                          style: TextStyle(
                                            color: Colors.white,
                                          ),
                                        ),
                                      ),
                                      ElevatedButton(
                                        style: const ButtonStyle(
                                            backgroundColor: MaterialStatePropertyAll(Color(0xFF8F967A))
                                        ),
                                        onPressed: () {
                                          Navigator.pop(context);
                                        },
                                        child: const Text(
                                          'Cancel',
                                          style: TextStyle(
                                            color: Colors.white,
                                          ),
                                        ),
                                      ),
                                    ],
                                  );
                                },
                              );
                            },
                            child: const Text(
                              "Forgot Password?",
                              style: TextStyle(
                                color: Colors.white,
                                fontSize: 15,
                              ),
                              textAlign: TextAlign.center,
                            ),
                          ),
                        ),
                      ),
                      Expanded(
                        flex: 2,
                        child: Row(
                          children: [
                            const Expanded(child: SizedBox.shrink()),
                            IconButton(
                              style: const ButtonStyle(
                                backgroundColor: MaterialStatePropertyAll(Color(0x00A5AA94)),
                                padding: MaterialStatePropertyAll(EdgeInsets.symmetric(vertical: 0, horizontal: 5)),
                              ),
                              onPressed: () {
                                if(Provider.of<LoginProvider>(context, listen: false).emailController.text.isNotEmpty && Provider.of<LoginProvider>(context, listen: false).passwordController.text.isNotEmpty) {
                                  AuthService().signInWithEmailAndPassword(Provider.of<LoginProvider>(context, listen: false).emailController.text, Provider.of<LoginProvider>(context, listen: false).passwordController.text, context);
                                }
                                else {
                                  showDialog(
                                    context: context,
                                    builder: (BuildContext context) {
                                      return AlertDialog(
                                        backgroundColor: const Color(0xFFBFB6AA),
                                        shape: const OutlineInputBorder(
                                          borderSide: BorderSide(color: Color(0xFF545454), width: 1.0),
                                          borderRadius: BorderRadius.all(Radius.circular(10.0)),
                                        ),
                                        titlePadding: EdgeInsets.zero,
                                        title: Container(
                                          decoration: const BoxDecoration(
                                            color: Color(0xFF8F967A),
                                            borderRadius: BorderRadius.vertical(top: Radius.circular(10.0)),
                                          ),
                                          padding: const EdgeInsets.only(left: 20),
                                          height: 40,
                                          child: const Row(
                                            children: [
                                              Icon(
                                                Icons.warning_amber,
                                                size: 20,
                                                color: Colors.red,
                                              ),
                                              SizedBox(width: 10,),
                                              Text(
                                                'Warning',
                                                style: TextStyle(
                                                  fontSize: 18,
                                                  color: Colors.white,
                                                ),
                                              ),
                                            ],
                                          ),
                                        ),
                                        content: const SizedBox(
                                          width: 300,
                                          child: Text(
                                            "Please fill all the fields",
                                            style: TextStyle(
                                              fontSize: 18,
                                              color: Colors.white,
                                            ),
                                          ),
                                        ),
                                        actions: [
                                          ElevatedButton(
                                            style: const ButtonStyle(
                                                backgroundColor: MaterialStatePropertyAll(Color(0xFF8F967A))
                                            ),
                                            onPressed: () async {
                                              Navigator.pop(context);
                                            },
                                            child: const Text(
                                              'Okay',
                                              style: TextStyle(
                                                color: Colors.white,
                                              ),
                                            ),
                                          ),
                                        ],
                                      );
                                    },
                                  );                                }
                                // Navigator.pushNamed(context, '/homeScreen');
                              },
                              icon: const Icon(
                                Icons.arrow_forward_rounded,
                                color: Colors.white,
                                size: 30,
                              )
                            ),
                          ],
                        ),
                      ),
                      // const Expanded(flex: 2,child: SizedBox.shrink(),),
                    ],
                  ),
                )
              ],
            ),
          ),
        ],
      ),
    );
  }
}
