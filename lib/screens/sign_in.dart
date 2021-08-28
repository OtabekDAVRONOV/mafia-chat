import 'package:firebase_auth/firebase_auth.dart';
import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';

class SignIn extends StatefulWidget {
  const SignIn({Key? key}) : super(key: key);

  @override
  _SignInState createState() => _SignInState();
}

class _SignInState extends State<SignIn> with SingleTickerProviderStateMixin {
  final TextEditingController _password = TextEditingController();
  final TextEditingController _email = TextEditingController();
  final _formKey = GlobalKey<FormState>();
  AnimationController? controller;
  final FirebaseAuth _authUser = FirebaseAuth.instance;

  @override
  void initState() {
    super.initState();
    controller = AnimationController(
      vsync: this,
      // value: 1,
      duration: const Duration(seconds: 1),
    );

    controller!.forward();
    // controller!.reverse();

    controller!.addListener(() {
      setState(() {});
      print(controller!.value);
    });
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      backgroundColor: const Color(0xFFff7a3e).withOpacity(
        controller!.value,
      ),
      appBar: AppBar(
        iconTheme: const IconThemeData(
          color: Colors.white,
        ),
        backgroundColor: Colors.transparent,
        elevation: 0,
      ),
      body: SingleChildScrollView(
        child: Padding(
          padding: const EdgeInsets.symmetric(horizontal: 24.0),
          child: Column(
            mainAxisAlignment: MainAxisAlignment.center,
            crossAxisAlignment: CrossAxisAlignment.stretch,
            children: [
              Row(
                children: [
                  Hero(
                    tag: 'logo',
                    // ignore: sized_box_for_whitespace
                    child: Container(
                      child: Image.asset(
                        'assets/logo.png',
                        fit: BoxFit.cover,
                      ),
                      height: controller!.value * 80,
                    ),
                  ),
                  const SizedBox(
                    width: 30.0,
                  ),
                  const Text(
                    "Sign In",
                    style: TextStyle(
                        color: Colors.white,
                        fontSize: 33.0,
                        fontWeight: FontWeight.w800),
                  )
                ],
              ),
              const SizedBox(
                height: 40.0,
              ),
              Form(
                key: _formKey,
                autovalidateMode: AutovalidateMode.onUserInteraction,
                child: Column(
                  children: [
                    // FOR EMAIL
                    TextFormField(
                      controller: _email,
                      decoration: const InputDecoration(
                        border: OutlineInputBorder(),
                        hintText: "Emailni Kiriting",
                      ),
                      validator: (String? text) {
                        if (text!.length < 6) {
                          return "Email 6 ta belgidan kam bolmasin !";
                        }
                      },
                    ),
                    const SizedBox(
                      height: 25.0,
                    ),
                    // FOR PASSWORD
                    TextFormField(
                      obscureText: true,
                      keyboardType: TextInputType.visiblePassword,
                      controller: _password,
                      decoration: const InputDecoration(
                        border: OutlineInputBorder(),
                        hintText: "Passwordni Kiriting",
                      ),
                      validator: (String? text) {
                        if (text!.length < 6) {
                          return "Password 6 ta belgidan kam bolmasin !";
                        }
                      },
                    ),
                    const SizedBox(
                      height: 20.0,
                    ),
                    ElevatedButton.icon(
                      style: ElevatedButton.styleFrom(
                        minimumSize: const Size(
                          double.infinity,
                          60.0,
                        ),
                        primary: const Color(0xFFFFDA3E),
                        shape: RoundedRectangleBorder(
                          borderRadius: BorderRadius.circular(30.0),
                        ),
                      ),
                      icon: const Icon(
                        Icons.handyman,
                        color: Colors.black,
                      ),
                      onPressed: () async {
                        try {
                          if (_formKey.currentState!.validate()) {
                            final user =
                                await _authUser.signInWithEmailAndPassword(
                              email: _email.text,
                              password: _password.text,
                            );
                            // ignore: unnecessary_null_comparison
                            if (user != null) {
                              Navigator.pushReplacementNamed(
                                  context, 'chat_ekran');
                            }
                          }
                        } catch (e) {
                          // SNACKBAR KERAK
                          // ignore: avoid_print
                          print("LOGINDA XATO BOR: " + e.toString());
                        }
                      },
                      label: const Text(
                        "Sign In",
                        style: TextStyle(
                          color: Colors.black,
                        ),
                      ),
                    ),
                  ],
                ),
              ),
            ],
          ),
        ),
      ),
    );
  }
}
