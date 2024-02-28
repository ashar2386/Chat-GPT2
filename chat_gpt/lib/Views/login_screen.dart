import 'package:chat_gpt/Views/homescreen.dart';
import 'package:chat_gpt/Views/signup_screen.dart';
import 'package:chat_gpt/constant/color.dart';
import 'package:firebase_auth/firebase_auth.dart';
import 'package:flutter/material.dart';

class LoginScreen extends StatefulWidget {
  const LoginScreen({super.key});

  @override
  State<LoginScreen> createState() => _LoginScreenState();
}

class _LoginScreenState extends State<LoginScreen> {
  final emailController = TextEditingController();
  final passwordController = TextEditingController();
  bool _ispasswordvisible = false;
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      body: Center(
        child: SizedBox(
          child: Column(
            mainAxisAlignment: MainAxisAlignment.center,
            crossAxisAlignment: CrossAxisAlignment.center,
            children: [
              const Text(
                "Welcome Back",
                style: TextStyle(
                  fontSize: 30,
                  fontWeight: FontWeight.bold,
                  color: Colors.black87,
                ),
              ),
              const SizedBox(
                height: 25,
              ),
              // textform field email
              SizedBox(
                width: MediaQuery.of(context).size.width * 0.23,
                child: TextFormField(
                  controller: emailController,
                  decoration: InputDecoration(
                    border: OutlineInputBorder(
                      borderRadius: BorderRadius.circular(5),
                    ),
                    labelText: "Enter Email",
                  ),
                ),
              ),
              const SizedBox(
                height: 25,
              ),
              SizedBox(
                width: MediaQuery.of(context).size.width * 0.23,
                child: TextFormField(
                  controller: passwordController,
                  obscureText: !_ispasswordvisible,
                  decoration: InputDecoration(
                    border: OutlineInputBorder(
                      borderRadius: BorderRadius.circular(5),
                    ),
                    labelText: "Enter Password",
                    suffix: IconButton(
                      onPressed: () {
                        setState(() {
                          _ispasswordvisible = !_ispasswordvisible;
                        });
                      },
                      icon: Icon(
                        _ispasswordvisible
                            ? Icons.visibility
                            : Icons.visibility_off,
                        size: 20,
                      ),
                    ),
                  ),
                ),
              ),
              const SizedBox(height: 20,),
              // Elevated Button
              SizedBox(
                height: MediaQuery.of(context).size.height * 0.08,
                width: MediaQuery.of(context).size.width * 0.23,
                child: ElevatedButton(
                  style: ElevatedButton.styleFrom(
                    backgroundColor: btn,
                    shape: RoundedRectangleBorder(
                      borderRadius: BorderRadius.circular(3),
                    ),
                  ),
                  onPressed: () {
                    FirebaseAuth.instance.signInWithEmailAndPassword(
                        email: emailController.text,
                        password: passwordController.text);
                    Navigator.push(context,
                        MaterialPageRoute(builder: (context) => const Home(),));
                  },
                  child: const Text(
                    "Continue",
                    style: TextStyle(
                      fontSize: 18,
                      color: Colors.white,
                    ),
                  ),
                ),
              ),
              const SizedBox(
                height: 15,
              ),
              //alreadyaccount
              SizedBox(
                width: MediaQuery.of(context).size.width * 0.18,
                child: Row(
                  children: [
                    const Text("Don't have an account? "),
                    TextButton(
                      onPressed: () {
                        Navigator.push(
                            context,
                            MaterialPageRoute(
                                builder: (context) => const SignupScreen()));
                      },
                      child: const Text(
                        "Sign Up",
                        style: TextStyle(color: btn),
                      ),
                    ),
                  ],
                ),
              ),
              const SizedBox(
                height: 20,
              ),
              SizedBox(
                width: MediaQuery.of(context).size.width * 0.05,
                child: const Row(
                  children: [
                    Divider(
                      thickness: 5,
                      color: Colors.black,
                      height: 5,
                    ),
                    Text("OR"),
                    Divider(
                      thickness: 1,
                      color: Colors.black,
                      height: 5,
                    ),
                  ],
                ),
              ),
              SizedBox(
                height: 20,
              ),
              // Google Button
              Container(
                height: MediaQuery.of(context).size.height * 0.09,
                width: MediaQuery.of(context).size.width * 0.23,
                decoration: BoxDecoration(
                  border: Border.all(
                    color: Colors.black45,
                    width: 1.0,
                  ),
                  borderRadius: BorderRadius.circular(5),
                ),
                child: Row(
                  children: [
                    SizedBox(
                      width: 20,
                    ),
                    Image.asset(
                      "assets/images/googleimage.png",
                      width: 28,
                      height: 35,
                    ),
                    SizedBox(
                      width: 20,
                    ),
                    const Text(
                      "Continue with Google",
                      style: TextStyle(fontSize: 18),
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
