import 'package:flutter/material.dart';

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
                            decoration: const InputDecoration(
                              hintText: "First Name",
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
                            decoration: const InputDecoration(
                              hintText: "Last Name",
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
                            obscureText: true,
                            keyboardType: TextInputType.phone,
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
                                onPressed: () {
                                  Navigator.pushNamed(context, '/homeScreen');
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
