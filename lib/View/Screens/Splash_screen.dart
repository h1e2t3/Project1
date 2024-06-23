import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';
import 'package:font_awesome_flutter/font_awesome_flutter.dart';
import 'package:get/get.dart';
import 'package:get/get_core/src/get_main.dart';
import 'package:get/get_utils/get_utils.dart';
import 'package:google_fonts/google_fonts.dart';
import 'package:project1/Controller/signIn_methode.dart';
import 'package:project1/View/Screens/home.dart';

class SplashScreen extends StatefulWidget {
  const SplashScreen({super.key});

  @override
  State<SplashScreen> createState() => _SplashScreenState();
}

class _SplashScreenState extends State<SplashScreen> {
  final auth = Authservice();
  bool isloading = true;

  @override
  Widget build(BuildContext context) {
    return Scaffold(
        body: Container(
      height: Get.height,
      width: Get.width,
      padding: EdgeInsets.symmetric(horizontal: 40),
      color: Colors.green.withOpacity(0.40),
      child: Center(
        child: ElevatedButton(
            onPressed: () {
              Get.to(() => SignUpPage());
            },
            style: ButtonStyle(
                backgroundColor: WidgetStatePropertyAll(Color(0xff3B757F))),
            child: Row(
              mainAxisAlignment: MainAxisAlignment.center,
              crossAxisAlignment:CrossAxisAlignment.center,
              children: [
                Icon(
                  FontAwesomeIcons.google,
                  color: Colors.white,
                ),
                SizedBox(width: 20,),
                Text(
                  "SignIn",
                  style: GoogleFonts.openSans(
                    fontSize: 14,
                    fontWeight: FontWeight.w600,
                    color: Colors.white,
                  ),
                )
              ],
            )),
      ),
    ));
  }
}
