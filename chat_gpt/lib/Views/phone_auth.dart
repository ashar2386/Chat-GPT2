import 'package:chat_gpt/Views/homescreen.dart';
import 'package:chat_gpt/constant/color.dart';
import 'package:firebase_auth/firebase_auth.dart';
import 'package:flutter/material.dart';
import 'package:intl_phone_field/intl_phone_field.dart';
import 'package:pin_code_fields/pin_code_fields.dart';

class PhoneAuthScreen extends StatefulWidget {
  const PhoneAuthScreen({super.key});

  @override
  _PhoneAuthScreenState createState() => _PhoneAuthScreenState();
}

class _PhoneAuthScreenState extends State<PhoneAuthScreen> {
  final TextEditingController _pinPutController = TextEditingController();
  final TextEditingController _phoneController = TextEditingController();
  bool showPinCodeFields = false;
  bool otpbutton = true;
  late String _verificationId = ''; // Initialize _verificationId

  Future<void> _sendOtp() async {
    try {
      await FirebaseAuth.instance.verifyPhoneNumber(
        phoneNumber: '+92${_phoneController.text}',
        verificationCompleted: (PhoneAuthCredential credential) async {
          // await FirebaseAuth.instance.signInWithCredential(credential);
          _markAccountVerified();
        },
        verificationFailed: (FirebaseAuthException e) {
          // Handle verification failure
          print('Failed to send OTP: ${e.message}');
        },
        codeSent: (String verificationId, int? resendToken) {
          setState(() {
            _verificationId = verificationId;
          });
        },
        codeAutoRetrievalTimeout: (String verificationId) {
          setState(() {
            _verificationId = verificationId;
          });
        },
      );
    } catch (e) {
      print('Errorsending OTP $e');
    }
  }

  Future<void> _verifyOtp() async {
    try {
      PhoneAuthCredential credential = PhoneAuthProvider.credential(
        verificationId: _verificationId,
        smsCode: _pinPutController.text.trim(),
      );
      // await FirebaseAuth.instance.signInWithCredential(credential);
      _markAccountVerified();
    } catch (e) {
      print('Failed to verify OTP: $e');
    }
  }

  Future<void> _markAccountVerified() async {
    // Update user's profile to mark account as verified
    // Example: await FirebaseAuth.instance.currentUser!.updateProfile(...);
    print('Account verified successfully');
    // Show a message on successful verification
    showDialog(
      context: context,
      builder: (BuildContext context) {
        return AlertDialog(
          // ignore: prefer_const_constructors
          title: Text('Success'),
          content:
              const Text('Your phone number has been verified successfully!'),
          actions: [
            TextButton(
              onPressed: () {
                // Navigator.of(context).pop();
                Navigator.push(
                  context,
                  MaterialPageRoute(
                    builder: (context) => const Home(),
                  ),
                );
              },
              child: const Text('OK'),
            ),
          ],
        );
      },
    );
  }

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
                "Verify your Account!",
                style: TextStyle(
                  fontSize: 30,
                  fontWeight: FontWeight.bold,
                  color: Colors.black87,
                ),
              ),
              const SizedBox(
                height: 25,
              ),
              // phonefield
              SizedBox(
                width: MediaQuery.of(context).size.width * 0.23,
                child: IntlPhoneField(
                  controller: _phoneController,
                  flagsButtonPadding: const EdgeInsets.all(12),
                  dropdownIconPosition: IconPosition.trailing,
                  decoration: InputDecoration(
                    labelText: 'Phone Number',
                    border: OutlineInputBorder(
                      borderRadius: BorderRadius.circular(10),
                    ),
                  ),
                  initialCountryCode: 'PK',
                  onChanged: (phone) {},
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
                    _sendOtp();
                    setState(() {
                      showPinCodeFields = true;
                    });
                  },
                  child: const Text(
                    "Send OTP",
                    style: TextStyle(
                      fontSize: 18,
                      color: Colors.white,
                    ),
                  ),
                ),
              ),
              // enter pincode
              SizedBox(
                height: 20,
              ),
              Visibility(
                visible: showPinCodeFields,
                child: SizedBox(
                  width: MediaQuery.of(context).size.width * 0.23,
                  child: PinCodeTextField(
                    appContext: context,
                    length: 6,
                    obscureText: false,
                    animationType: AnimationType.fade,
                    pinTheme: PinTheme(
                      shape: PinCodeFieldShape.circle,
                      borderRadius: BorderRadius.circular(5),
                      fieldHeight: 50,
                      fieldWidth: 50,
                      inactiveFillColor: Colors.blue[400],
                      inactiveColor: Colors.black,
                      activeColor: Colors.black,
                      activeFillColor: btn,
                    ),
                    keyboardType: TextInputType.number,
                    animationDuration: const Duration(milliseconds: 300),
                    enableActiveFill: true,
                    onCompleted: (v) {
                      // _verifyOtp();
                    },
                    onChanged: (value) {
                      print(value);
                      _pinPutController.text = value;
                    },
                  ),
                ),
              ),
              const SizedBox(
                height: 25,
              ),
              // 2nd Elevated Button
              Visibility(
                visible: showPinCodeFields,
                child: SizedBox(
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
                      // Navigator.push(
                      //   context,
                      //   MaterialPageRoute(
                      //     builder: (context) => const HomeScreen(),
                      //   ),
                      // );
                      _verifyOtp();
                      // Add verification logic here
                    },
                    child: const Text(
                      "Verify",
                      style: TextStyle(
                        fontSize: 18,
                        color: Colors.white,
                      ),
                    ),
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
