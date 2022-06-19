import 'package:flutter/material.dart';
import 'package:mkh_sign_in/pages/home.dart';
import 'package:mkh_sign_in/pages/login.dart';
import 'package:mkh_sign_in/services/firebase_services.dart';
import 'package:mkh_sign_in/utils/colors_util.dart';

class Register extends StatefulWidget {
  const Register({Key? key}) : super(key: key);

  @override
  State<Register> createState() => _RegisterState();
}

class _RegisterState extends State<Register> {
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      body: Container(
        decoration: BoxDecoration(
            gradient: LinearGradient(colors: [
          hexStringToColor("CB2B93"),
          hexStringToColor("9546C4"),
          hexStringToColor("5E61F4")
        ], begin: Alignment.topCenter, end: Alignment.bottomCenter)),
        child: Center(
          child: Container(
            margin: const EdgeInsets.fromLTRB(20.0, 0.0, 20.0, 0.0),
            child: ElevatedButton(
              style: ButtonStyle(
                shape: MaterialStateProperty.all<RoundedRectangleBorder>(
                    RoundedRectangleBorder(
                        borderRadius: BorderRadius.circular(18.0),
                        side: const BorderSide(color: Colors.blue))),
                backgroundColor: MaterialStateProperty.all<Color>(Colors.black),
              ),
              onPressed: () async {
                await FirebaseServices().signInWithGoogle();

                Navigator.pushReplacement(context,
                    MaterialPageRoute(builder: (context) => const Home()));
              },
              child: IntrinsicHeight(
                child: Row(
                  mainAxisAlignment: MainAxisAlignment.center,
                  children: const <Widget>[
                    CircleAvatar(
                      backgroundImage: AssetImage('assets/googleLogo.jpg'),
                      radius: 28.0,
                      backgroundColor: Colors.white,
                    ),
                    SizedBox(width: 10),
                    VerticalDivider(
                      color: Colors.white,
                      thickness: 2,
                    ),
                    SizedBox(width: 10),
                    Text(
                      'Register With Google',
                      style: TextStyle(
                        fontSize: 20,
                        color: Colors.white,
                        fontWeight: FontWeight.bold,
                      ),
                    )
                  ],
                ),
              ),
            ),
          ),
        ),
      ),
      floatingActionButton: FloatingActionButton.extended(
        onPressed: () => Navigator.pushReplacement(
            context, MaterialPageRoute(builder: (context) => const Login())),
        label: const Text('Login'),
        icon: const Icon(Icons.arrow_forward),
        backgroundColor: Colors.black,
      ),
    );
  }
}
