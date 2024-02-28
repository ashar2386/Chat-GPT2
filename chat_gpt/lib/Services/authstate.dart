import 'dart:convert';

import 'package:chat_gpt/Views/otp_screen.dart';
import 'package:chat_gpt/model/usermodel.dart';
import 'package:cloud_firestore/cloud_firestore.dart';
import 'package:firebase_auth/firebase_auth.dart';
import 'package:flutter/material.dart';
import 'package:google_sign_in/google_sign_in.dart';
import 'package:http/http.dart' as http;

class AuthState extends ChangeNotifier {
  CurrentUser? _currentUser;
  // bool _isLoggedIn = false;
  bool _isLoading = false;
   String? _uid;

  FirebaseAuth firebaseAuth = FirebaseAuth.instance;
  final GoogleSignIn _googleSignIn = GoogleSignIn(scopes: ['email']);
  final FirebaseAuth _firebaseAuth = FirebaseAuth.instance;
  final FirebaseFirestore _firebaseFirestore = FirebaseFirestore.instance;

  Future<void> login() async {
    try {
      final GoogleSignInAccount? googleSignInAccount =
          await _googleSignIn.signIn();
      if (googleSignInAccount != null) {
        final GoogleSignInAuthentication googleSignInAuthentication =
            await googleSignInAccount.authentication;

        AuthCredential credential = GoogleAuthProvider.credential(
          accessToken: googleSignInAuthentication.accessToken,
          idToken: googleSignInAuthentication.idToken,
        );

        UserCredential user =
            await firebaseAuth.signInWithCredential(credential);
        if (user.user != null) {
          final String id = user.user!.uid;
          final String name = user.user!.displayName ?? 'Unknown';
          final String email = user.user!.email ?? 'Unknown';
          final String photoUrl = googleSignInAccount.photoUrl ?? 'Unknown';

          final Uri apiUrl =
              Uri.parse('http://192.168.100.5:8000/api/v1/users/new');
          print(id);
          print(name);
          print(email);
          print(photoUrl);
          final Map<String, String> requestData = {
            "_id": id,
            "name": name,
            "photo": photoUrl,
            "email": email,
          };

          try {
            print('sending HTTP request');
            final http.Response response = await http.post(
              apiUrl,
              headers: {"Content-Type": "application/json"},
              body: jsonEncode(requestData),
            );

            if (response.statusCode == 201) {
              print('User data stored successfully');
              _currentUser!.id = id;
              _currentUser!.name = name;
              _currentUser!.email = email;
              _currentUser!.photo = photoUrl;
              // _isLoggedIn = true;
            } else {
              print(
                  'Failed to store user data. Status code: ${response.statusCode} ${response.body}');
            }
          } catch (error) {
            print('Error while sending HTTP request: $error');
          }
        } else {
          print('An Error Occured');
        }
        notifyListeners();
      } else {
        print('Sign in canceled by user');
      }
    } catch (error) {
      print('Error signing in with Google: $error');
    }

    notifyListeners();
  }
}
