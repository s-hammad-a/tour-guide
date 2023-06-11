import 'package:flutter/material.dart';
import 'package:flutter/services.dart';
import 'package:provider/provider.dart';
import 'package:togu/controllers/create_account_controller.dart';

class CreateAccountScreen extends StatelessWidget {
  const CreateAccountScreen({Key? key}) : super(key: key);

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
                          "Create Account",
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
                            inputFormatters: [
                              FilteringTextInputFormatter.allow(RegExp("[ a-zA-Z]")),
                            ],
                            controller: context.watch<CreateAccountProvider>().nameController,
                            decoration: const InputDecoration(
                              hintText: "Full Name",
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
                            controller: context.watch<CreateAccountProvider>().emailController,
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
                            keyboardType: TextInputType.phone,
                            inputFormatters: [
                              FilteringTextInputFormatter.digitsOnly
                            ],
                            controller: context.watch<CreateAccountProvider>().phoneController,
                            decoration: const InputDecoration(
                              hintText: "Phone",
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
                            obscureText: true,
                            controller: context.watch<CreateAccountProvider>().passwordController,
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
                          child: TextFormField(
                            style: const TextStyle(
                              color: Colors.white,
                              fontSize: 20,
                            ),
                            obscureText: true,
                            controller: context.watch<CreateAccountProvider>().rePasswordController,
                            decoration: const InputDecoration(
                              hintText: "Re-Password",
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
                        flex: 2,
                        child: Row(
                          children: [
                            const Expanded(child: SizedBox.shrink()),
                            IconButton(
                                style: const ButtonStyle(
                                  backgroundColor: MaterialStatePropertyAll(Color(0x00A5AA94)),
                                  padding: MaterialStatePropertyAll(EdgeInsets.symmetric(vertical: 0, horizontal: 5)),
                                ),
                                onPressed: () async {
                                  String str = Provider.of<CreateAccountProvider>(context, listen: false).checkCredentials();
                                  if(str == "done") {
                                    bool check = await Provider.of<CreateAccountProvider>(context, listen: false).createAccount(context);
                                    if(check) {
                                      Navigator.pushNamed(context, '/wrapper');
                                    }
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
                                          content: SizedBox(
                                            width: 300,
                                            child: Text(
                                              str,
                                              style: const TextStyle(
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
                                    );
                                  }
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
