import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';
import 'package:font_awesome_flutter/font_awesome_flutter.dart';
import 'package:project1/Controller/signIn_methode.dart';
import 'package:project1/View/Screens/home.dart';
class SplashScreen extends StatefulWidget {
  const SplashScreen({super.key});

  @override
  State<SplashScreen> createState() => _SplashScreenState();
}

class _SplashScreenState extends State<SplashScreen> {
  final auth=Authservice();
  bool isloading=true;
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      body: Center(child: IconButton(onPressed:()async{
        setState(() {
          isloading=true;
        });
        // Navigator.push(context, MaterialPageRoute(builder: (context)=>SignUpPage()));
         await auth.LoginwithGoogle();
         setState(() {
           isloading=false;
         });
      }, icon:Icon(FontAwesomeIcons.google))),
    );
  }
}
