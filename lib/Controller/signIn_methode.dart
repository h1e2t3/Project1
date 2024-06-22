import 'dart:developer';

import 'package:firebase_auth/firebase_auth.dart';
import 'package:flutter/cupertino.dart';
import 'package:google_sign_in/google_sign_in.dart';

class Authservice{

  final _auth=FirebaseAuth.instance;
  Future<UserCredential?> LoginwithGoogle()async{
    try{
     final googleUser=await GoogleSignIn().signIn();
     final googleAuth= await googleUser?.authentication;
     final cred =GoogleAuthProvider.credential(idToken:googleAuth?.idToken,accessToken: googleAuth?.accessToken);
     return await _auth.signInWithCredential(cred);
    }catch(e){
      print(e.toString());
      log(e.toString());
    }
    return null;
  }
}

void Validation(val){

}