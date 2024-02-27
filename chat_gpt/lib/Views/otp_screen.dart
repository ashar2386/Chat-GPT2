// import 'package:firebase_auth/firebase_auth.dart';
// import 'package:flutter/material.dart';

// class otpscreen extends StatefulWidget {
//   final String phoneNumber;
//   otpscreen({required this.phoneNumber});
//   @override
//   State<otpscreen> createState() => _otpscreenState();
// }

// class _otpscreenState extends State<otpscreen> {
//   final TextEditingController _pinPutController = TextEditingController();
//   late String _verificationId;

//   // VerifiedDialog dialog = VerifiedDialog(
//   //   image: 'assets/images/check.png',
//   //   title: 'Verified',
//   //   key: null,
//   // );
//   @override
//   void initState() {
//     super.initState();
//     _sendOtp();
//   }

//   Future<void> _sendOtp() async {
//     await FirebaseAuth.instance.verifyPhoneNumber(
//       phoneNumber: '${widget.phoneNumber}', // Add your country code
//       verificationCompleted: (PhoneAuthCredential credential) async {
//         await FirebaseAuth.instance.signInWithCredential(credential);
//         _markAccountVerified();
//       },
//       verificationFailed: (FirebaseAuthException e) {
//         // Handle verification failure
//         print('Failed to send OTP: ${e.message}');
//       },
//       codeSent: (String verificationId, int? resendToken) {
//         setState(() {
//           _verificationId = verificationId;
//         });
//       },
//       codeAutoRetrievalTimeout: (String verificationId) {
//         setState(() {
//           _verificationId = verificationId;
//         });
//       },
//     );
//   }

//   Future<void> _verifyOtp() async {
//     try {
//       PhoneAuthCredential credential = PhoneAuthProvider.credential(
//         verificationId: _verificationId,
//         smsCode: _pinPutController.text.trim(),
//       );
//       await FirebaseAuth.instance.signInWithCredential(credential);
//       _markAccountVerified();
//     } catch (e) {
//       print('Failed to verify OTP: $e');
//     }
//   }

//   Future<void> _markAccountVerified() async {
//     // Update user's profile to mark account as verified
//     // Example: await FirebaseAuth.instance.currentUser!.updateProfile(...);
//     print('Account verified successfully');
//   }

//   @override
//   Widget build(BuildContext context) {
//     return Scaffold(
//       body: SingleChildScrollView(
//         child: Padding(
//           padding: const EdgeInsets.all(18.0),
//           child: Column(
//             crossAxisAlignment: CrossAxisAlignment.start,
//             children: [
//               SizedBox(
//                 height: mq.height * 0.1,
//               ),
//               HeadingText2(title: 'Appal'),
//               SizedBox(
//                 height: mq.height * 0.03,
//               ),
//               smalltxt(title: 'Create Account'),
//               SizedBox(
//                 height: mq.height * 0.02,
//               ),
//               Text(
//                 'We have sent you an SMS with the code to number ${widget.phoneNumber}',
//                 style: Theme.of(context)
//                     .textTheme
//                     .titleSmall!
//                     .copyWith(color: grey),
//               ),
//               SizedBox(
//                 height: mq.height * 0.03,
//               ),
//               Text('Enter your Otp code',
//                   style: Theme.of(context).textTheme.titleSmall!),
//               SizedBox(
//                 height: mq.height * 0.03,
//               ),
//               PinCodeTextField(
//                 appContext: context,
//                 controller: _pinPutController,
//                 length: 6,
//                 obscureText: false,
//                 animationType: AnimationType.fade,
//                 pinTheme: PinTheme(
//                   shape: PinCodeFieldShape.circle,
//                   borderRadius: BorderRadius.circular(5),
//                   fieldHeight: 50,
//                   fieldWidth: 50,
//                   inactiveFillColor: bgcolor.withOpacity(0.5),
//                   inactiveColor: bgcolor.withOpacity(0.5),
//                   activeColor: bgcolor.withOpacity(0.2),
//                   activeFillColor: bgcolor.withOpacity(0.2),
//                 ),
//                 keyboardType: TextInputType.number,
//                 animationDuration: Duration(milliseconds: 300),
//                 enableActiveFill: true,
//                 // onCompleted: (v) {
//                 //   // _verifyOtp();
//                 // },
//                 onChanged: (value) {
//                   print(value);
//                   _pinPutController.text = value;
//                 },
//               ),
//               // Row(
//               //   children: [
//               //     Text(
//               //       'Didnt receive the OTP?',
//               //       style: Theme.of(context)
//               //           .textTheme
//               //           .titleSmall!
//               //           .copyWith(color: grey),
//               //     ),
//               //     TextButton(
//               //         onPressed: () {},
//               //         child: Text(
//               //           'Resend',
//               //           style: bluestyle,
//               //         ))
//               //   ],
//               // ),
//               SizedBox(
//                 height: mq.height * 0.07,
//               ),
//               custom_btn(
//                   title: 'Verify',
//                   ontap: () {
//                     if (_pinPutController.text.isEmpty) {
//                       ScaffoldMessenger.of(context).showSnackBar(SnackBar(
//                           duration: Duration(seconds: 3),
//                           backgroundColor: Colors.green,
//                           content: Text('Account Verified SuccessFully')));
//                     }
//                     Provider.of<AuthState>(context, listen: false)
//                         .verifyUser(widget.phoneNumber);
//                     ScaffoldMessenger.of(context).showSnackBar(SnackBar(
//                         duration: Duration(seconds: 3),
//                         backgroundColor: Colors.green,
//                         content: Text('Account Verified SuccessFully')));
//                     Navigator.of(context).pop();
//                   }),
//               SizedBox(
//                 height: mq.height * 0.14,
//               ),
//             ],
//           ),
//         ),
//       ),
//     );
//   }
// }



// import 'package:chat_gpt/Views/home_screen.dart';
// import 'package:chat_gpt/widget/cistom_button.dart';
// import 'package:firebase_auth/firebase_auth.dart';
// import 'package:flutter/material.dart';
// import 'package:pinput/pinput.dart';
// import 'package:provider/provider.dart';

// class OtpScreen extends StatefulWidget {
//   final String verificationId;
//   const OtpScreen({super.key, required this.verificationId});

//   @override
//   State<OtpScreen> createState() => _OtpScreenState();
// }

// class _OtpScreenState extends State<OtpScreen> {
//   String? otpCode;

//   @override
//   Widget build(BuildContext context) {
//     final isLoading =
//         Provider.of<AuthProvider>(context, listen: true);
//     return Stack(
//       children: [
//         Scaffold(
//           resizeToAvoidBottomInset: false,
//           backgroundColor: Colors.transparent,
//           body: SafeArea(
//             child: isLoading == true
//                 ? const Center(
//                     child: CircularProgressIndicator(
//                       color: Colors.blue,
//                     ),
//                   )
//                 : Center(
//                     child: Padding(
//                       padding: const EdgeInsets.symmetric(
//                           vertical: 25, horizontal: 30),
//                       child: Column(
//                         children: [
//                           Align(
//                             alignment: Alignment.topLeft,
//                             child: GestureDetector(
//                               onTap: () => Navigator.of(context).pop(),
//                               child: const Icon(
//                                 Icons.arrow_back,
//                                 color: Colors.white,
//                               ),
//                             ),
//                           ),
//                           Container(
//                             width: 150,
//                             height: 150,
//                             padding: const EdgeInsets.all(20.0),
//                             child: Image.asset(
//                               "assets/logo.png",
//                             ),
//                           ),
//                           const SizedBox(height: 30),
//                           const Text(
//                             "Verification",
//                             style: TextStyle(
//                               fontSize: 22,
//                               fontWeight: FontWeight.bold,
//                               color: Colors.white,
//                             ),
//                           ),
//                           const SizedBox(height: 10),
//                           const Text(
//                             "Enter the OTP send to your phone number",
//                             style: TextStyle(
//                               fontSize: 14,
//                               color: Colors.white,
//                               fontWeight: FontWeight.bold,
//                             ),
//                             textAlign: TextAlign.center,
//                           ),
//                           const SizedBox(height: 20),
//                           Pinput(
//                             length: 6,
//                             showCursor: true,
//                             defaultPinTheme: PinTheme(
//                               width: 60,
//                               height: 60,
//                               decoration: BoxDecoration(
//                                 borderRadius: BorderRadius.circular(10),
//                                 border: Border.all(
//                                   color: Colors.grey.shade100,
//                                 ),
//                               ),
//                               textStyle: const TextStyle(
//                                 fontSize: 20,
//                                 fontWeight: FontWeight.w600,
//                                 color: Colors.white,
//                               ),
//                             ),
//                             onCompleted: (value) {
//                               setState(() {
//                                 otpCode = value;
//                               });
//                             },
//                           ),
//                           const SizedBox(height: 25),
//                           SizedBox(
//                             width: MediaQuery.of(context).size.width,
//                             height: 50,
//                             // child: CustomButton(
//                             //   text: "Verify", onPressed: () {  },
//                             //   // onPressed: () {
//                             //   //   if (otpCode != null) {
//                             //   //     verifyOtp(context, otpCode!);
//                             //   //   } else {
                                  
//                             //   //     // showSnackBar(context, "Enter 6-digit code");
//                             //   //   }
//                             //   // },
//                             // ),
//                           ),
//                           const SizedBox(height: 30),
//                           const Text(
//                             "Didn't receive any code?",
//                             style: TextStyle(
//                               fontSize: 14,
//                               fontWeight: FontWeight.bold,
//                               color: Colors.white70,
//                             ),
//                           ),
//                           const SizedBox(height: 15),
//                           const Text(
//                             "Resend New Code",
//                             style: TextStyle(
//                               fontSize: 14,
//                               fontWeight: FontWeight.bold,
//                               color: Colors.blue,
//                             ),
//                           ),
//                         ],
//                       ),
//                     ),
//                   ),
//           ),
//         ),
//       ],
//     );
//   }

//   verify OTP
//   void verifyOtp(BuildContext context, String userOtp) {
//     final ap = Provider.of<AuthProvider>(context, listen: false);
//     ap.verifyOtp(
//       context: context,
//       verificationId: widget.verificationId,
//       userOtp: userOtp,
//       onSuccess: () {
//         ap.checkExistingUser().then((value) async {
//           if (value == true) {
//             // user exists in our app
//             ap.getDataFromFireStore().then(
//                   (value) => ap.saveUserDataToSP().then(
//                         (value) => ap.setSignIn().then(
//                               (value) => Navigator.pushAndRemoveUntil(
//                                   context,
//                                   MaterialPageRoute(
//                                     builder: (context) => const HomeScreen(),
//                                   ),
//                                   (route) => false),
//                             ),
//                       ),
//                 );
//           } else {
//             // new user
//             // Navigator.pushAndRemoveUntil(
//             //     context,
//             //     MaterialPageRoute(builder: (context) => const UserScreen()),
//             //     (route) => false);
//           }
//         });
//       },
//     );
//   }
// }