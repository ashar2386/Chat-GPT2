import 'package:chat_gpt/Services/authstate.dart';
import 'package:chat_gpt/Views/welcome_page.dart';
import 'package:chat_gpt/firebase_options.dart';
import 'package:firebase_core/firebase_core.dart';
import 'package:flutter/material.dart';
import 'package:provider/provider.dart';

void main() async {
  WidgetsFlutterBinding.ensureInitialized();
  await Firebase.initializeApp(
    options: DefaultFirebaseOptions.currentPlatform,
  );
  runApp(const MyApp());
}

class MyApp extends StatelessWidget {
  const MyApp({super.key});

  @override
  Widget build(BuildContext context) {
    return MultiProvider(
      providers: [
        ChangeNotifierProvider(create: (context) => AuthState()),
      ],
      child: Consumer<AuthState>(
        builder: (context, authState, child) {
          return MaterialApp(
            debugShowCheckedModeBanner: false,
            title: 'Flutter Chat GPT',
            theme: ThemeData(
              colorScheme: ColorScheme.fromSeed(seedColor: Colors.deepPurple),
              useMaterial3: true,
            ),
            home: const WelcomePage(),
          );
        },
      ),
    );
  }
}
