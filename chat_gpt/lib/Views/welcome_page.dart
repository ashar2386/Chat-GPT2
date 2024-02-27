import 'package:chat_gpt/Views/login_screen.dart';
import 'package:chat_gpt/Views/signup_screen.dart';
import 'package:chat_gpt/constant/color.dart';
import 'package:flutter/material.dart';

class WelcomePage extends StatelessWidget {
  const WelcomePage({super.key});

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      body: Row(
        children: [
          Expanded(
            child: Container(
              width: MediaQuery.of(context).size.width * 0.6,
              color: wlcmB,
              child: Column(
                // mainAxisAlignment: MainAxisAlignment.center,
                // crossAxisAlignment: CrossAxisAlignment.center,
                children: [
                  const Align(
                    alignment: Alignment.topLeft,
                    child: Padding(
                      padding: EdgeInsets.only(left: 25, top: 20),
                      child: Text(
                        "ChatGPT●",
                        style: TextStyle(
                          fontSize: 26,
                          fontWeight: FontWeight.bold,
                          color: wlcmtext,
                        ),
                      ),
                    ),
                  ),
                  SizedBox(height: MediaQuery.of(context).size.height * 0.4),
                  const Text.rich(
                    TextSpan(
                      children: [
                        TextSpan(
                          text: 'Improve my post.\n',
                          style: TextStyle(
                            fontSize: 34,
                            fontWeight: FontWeight.bold,
                            color: wlcmtext,
                          ),
                        ),
                        TextSpan(
                          text: 'for selling a used vacuum in good condition●●',
                          style: TextStyle(
                            fontSize: 30,
                            color: wlcmtext,
                          ),
                        ),
                      ],
                    ),
                  ),
                ],
              ),
            ),
          ),

          // 2nd Container
          Container(
            width: MediaQuery.of(context).size.width * 0.41,
            color: Colors.black,
            child: Column(
              children: [
                const Padding(
                  padding: EdgeInsets.only(top: 230),
                  child: Text(
                    "Get Started",
                    style: TextStyle(
                      fontSize: 30,
                      color: Colors.white,
                      fontWeight: FontWeight.bold,
                    ),
                  ),
                ),
                const SizedBox(
                  height: 20,
                ),
                Row(
                  mainAxisAlignment: MainAxisAlignment.center,
                  children: [
                    SizedBox(
                      height: MediaQuery.of(context).size.height * 0.08,
                      width: MediaQuery.of(context).size.width * 0.15,
                      child: ElevatedButton(
                        style: ElevatedButton.styleFrom(
                          backgroundColor: wlcmbtn,
                          shape: RoundedRectangleBorder(
                            borderRadius: BorderRadius.circular(5),
                          ),
                        ),
                        onPressed: () {
                          Navigator.push(context, MaterialPageRoute(builder: (context) => const LoginScreen()));
                        },
                        child: const Text(
                          "Log in",
                          style: TextStyle(
                            fontSize: 20,
                            fontWeight: FontWeight.bold,
                            color: Colors.white,
                          ),
                        ),
                      ),
                    ),
                    const SizedBox(
                      width: 10,
                    ),
                    SizedBox(
                      height: MediaQuery.of(context).size.height * 0.08,
                      width: MediaQuery.of(context).size.width * 0.15,
                      child: ElevatedButton(
                        style: ElevatedButton.styleFrom(
                          backgroundColor: wlcmbtn,
                          shape: RoundedRectangleBorder(
                            borderRadius: BorderRadius.circular(5),
                          ),
                        ),
                        onPressed: () {
                          Navigator.push(
                              context,
                              MaterialPageRoute(
                                builder: (context) => const SignupScreen(),
                              ));
                        },
                        child: const Text(
                          "Sign up",
                          style: TextStyle(
                            fontSize: 20,
                            fontWeight: FontWeight.bold,
                            color: Colors.white,
                          ),
                        ),
                      ),
                    ),
                  ],
                ),
                SizedBox(
                  height: MediaQuery.of(context).size.height * 0.3,
                ),
                const Text(
                  "OpenAI",
                  style: TextStyle(color: Colors.white, fontSize: 20),
                ),
              ],
            ),
          ),
        ],
      ),
    );
  }
}
// Help me debug
// why the linked list appears empty after I've reversed it●●
// Write a thank-you note
// to my interviewer●●
// Improve my post
// for selling a used vacuum in good condition●●
// Help me pick
// an outfit that will look good on camera●●
// Suggest fun activities
// for a team-building day with remote employees●●
// Recommend a dish
// to impress a date who's a picky eater●●
// Give me ideas
// for what to do with my kids' art●●
// Write a text
// asking a friend to be my plus-one at a wedding●●
// Plan a trip
// to see the northern lights in Norway●●
// Summarize this article