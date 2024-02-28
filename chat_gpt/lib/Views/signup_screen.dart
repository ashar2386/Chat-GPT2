import 'package:chat_gpt/Services/auth_services.dart';
import 'package:chat_gpt/Views/login_screen.dart';
import 'package:chat_gpt/Views/phone_auth.dart';
import 'package:chat_gpt/constant/color.dart';
import 'package:firebase_auth/firebase_auth.dart';
import 'package:flutter/material.dart';
import 'package:google_sign_in/google_sign_in.dart';

class SignupScreen extends StatefulWidget {
  const SignupScreen({super.key});

  @override
  State<SignupScreen> createState() => _SignupScreenState();
}

class _SignupScreenState extends State<SignupScreen> {
  final TextEditingController _email = TextEditingController();
  final TextEditingController _password = TextEditingController();

  void handlesignUp() async {
    String email = _email.text;
    String password = _password.text;

    if (email.isEmpty || password.isEmpty) {
      _showSnackBar('Please provide all details');
      return;
    }
    FirebaseAuth.instance
        .createUserWithEmailAndPassword(
            email: _email.text, password: _password.text)
        .then((userCredential) {
      String uid = userCredential.user!.uid;
      DatabaseService collection = DatabaseService(uid: uid);
      collection.createValue(
        email,
        password,
      );
      // Navigator.push(
      //   context,
      //   MaterialPageRoute(
      //     builder: (context) => const HomeScreen(),
      //   ),
      // );
    }).onError((error, stackTrace) {
      _showSnackBar('SignUp Failed');
    });
  }

  void _showSnackBar(String message) {
    ScaffoldMessenger.of(context).showSnackBar(
      SnackBar(
        content: Text(message),
        duration: const Duration(seconds: 2),
      ),
    );
  }

  bool _ispasswordvisible = false;

  //google Sign_in methood
  // Future<void> handleGoogleSignIn() async {
  //   try {
  //     final GoogleSignInAccount? googleUser = await GoogleSignIn().signIn();
  //     if (googleUser == null) {
  //       // User canceled the Google Sign-In
  //       return;
  //     }

  //     final GoogleSignInAuthentication googleAuth =
  //         await googleUser.authentication;
  //     final AuthCredential credential = GoogleAuthProvider.credential(
  //       accessToken: googleAuth.accessToken,
  //       idToken: googleAuth.idToken,
  //     );

  //     UserCredential userCredential =
  //         await FirebaseAuth.instance.signInWithCredential(credential);

  //     String uid = userCredential.user!.uid;
  //     String email = userCredential.user!.email ?? "";
  //     String password =
  //         "google_sign_in"; // You can set a default password for Google Sign-In users

  //     DatabaseService collection = DatabaseService(uid: uid);
  //     collection.createValue(email, password);

  //     Navigator.push(
  //       context,
  //       MaterialPageRoute(
  //         builder: (context) => const HomeScreen(),
  //       ),
  //     );
  //   } catch (error) {
  //     _showSnackBar('Google Sign-In Failed');
  //   }
  // }



  Future<void> handleGoogleSignIn() async {
    GoogleSignIn _googleSignIn=GoogleSignIn();
      final GoogleSignInAccount? googleSignInAccount =
          await _googleSignIn.signIn();
      if (googleSignInAccount != null) {
        final GoogleSignInAuthentication googleSignInAuthentication =
            await googleSignInAccount.authentication;

        AuthCredential credential = GoogleAuthProvider.credential(
          accessToken: googleSignInAuthentication.accessToken,
          idToken: googleSignInAuthentication.idToken,
        );

        // 113174202304-aq27r0pqtvn4g90nbpffnuud7ds446gt.apps.googleusercontent.com

        UserCredential user = await FirebaseAuth.instance.signInWithCredential(credential);
      }      
  }


  @override
  Widget build(BuildContext context) {
    // AuthState authState = Provider.of<AuthState>(context);
    return Scaffold(
      body: Center(
        child: SizedBox(
          child: Column(
            mainAxisAlignment: MainAxisAlignment.center,
            crossAxisAlignment: CrossAxisAlignment.center,
            children: [
              const Text(
                "Create an account",
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
                  controller: _email,
                  decoration: InputDecoration(
                    border: OutlineInputBorder(
                      borderRadius: BorderRadius.circular(5),
                    ),
                    labelText: "Enter Email",
                  ),
                ),
              ),
              // pasaword
              const SizedBox(
                height: 20,
              ),
              SizedBox(
                width: MediaQuery.of(context).size.width * 0.23,
                child: TextFormField(
                  controller: _password,
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
              const SizedBox(
                height: 25,
              ),
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
                    handlesignUp();
                    Navigator.push(
                      context,
                      MaterialPageRoute(
                        builder: (context) => const PhoneAuthScreen(),
                      ),
                    );
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
                    const Text("Already have an account?"),
                    TextButton(
                      onPressed: () {
                        Navigator.push(
                            context,
                            MaterialPageRoute(
                                builder: (context) => const LoginScreen()));
                      },
                      child: const Text(
                        "Login",
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
              const SizedBox(
                height: 20,
              ),
              // Google Button
              GestureDetector(
                onTap: () {
                  handleGoogleSignIn();
                },
                child: Container(
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
                      const SizedBox(
                        width: 20,
                      ),
                      Image.asset(
                        "assets/images/googleimage.png",
                        width: 28,
                        height: 35,
                      ),
                      const SizedBox(
                        width: 20,
                      ),
                      const Text(
                        "Continue with Google",
                        style: TextStyle(fontSize: 18),
                      ),
                    ],
                  ),
                ),
              ),
            ],
          ),
        ),
      ),
    );
  }
}
