import 'package:flutter/material.dart';
import 'package:flutter/src/foundation/key.dart';
import 'package:flutter/src/widgets/framework.dart';
import 'package:mkh_sign_in/pages/home.dart';
import 'package:mkh_sign_in/pages/register.dart';
import 'package:mkh_sign_in/services/firebase_services.dart';
import 'package:mkh_sign_in/utils/colors_util.dart';

class Login extends StatefulWidget {
  const Login({Key? key}) : super(key: key);

  @override
  State<Login> createState() => _LoginState();
}

class _LoginState extends State<Login> {
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
                      'Login With Google',
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
            context, MaterialPageRoute(builder: (context) => const Register())),
        label: const Text('Register'),
        icon: const Icon(Icons.arrow_forward),
        backgroundColor: Colors.black,
      ),
    );
  }
}
