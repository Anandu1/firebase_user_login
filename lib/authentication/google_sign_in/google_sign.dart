//import 'package:firebase_core/firebase_core.dart';
import 'package:firebase_auth/firebase_auth.dart';
import 'package:google_sign_in/google_sign_in.dart';
import 'package:flutter/material.dart';
import 'package:firebase_user_login/authentication/ExpertDetails.dart';
import 'package:firebase_user_login/authentication/expertDetailsNew.dart';



class SignIn {
  final FirebaseAuth auth = FirebaseAuth.instance;
  final GoogleSignIn googleSignIn = GoogleSignIn();
  Future<User> handleSignin(BuildContext context) async {
    User user;
    bool isSignedin = await googleSignIn.isSignedIn();
    try {
      if (isSignedin) {
       final User user =  await auth.currentUser;

        Navigator.push(
            context, MaterialPageRoute(builder: (context) => ExpertDetailsScreenNew()));
      } else {
        GoogleSignInAccount googleUser = await googleSignIn.signIn();

        final GoogleSignInAuthentication googleAuth =
            await googleUser.authentication;
        // get the credentials to (access / id token)
        // to sign in via Firebase Authentication
        final AuthCredential credential = GoogleAuthProvider.credential(
            idToken: googleAuth.idToken, accessToken: googleAuth.accessToken);

        user = (await auth.signInWithCredential(credential)).user;
      }
    } catch (e) {
      print(e);
    }
    return user;
  }

  void onGoogleSignIn(BuildContext context) async {
    // await Firebase.initializeApp();
    await handleSignin(context).whenComplete(() {});
    User usr = await auth.currentUser;
    print('signin $usr');
    Navigator.pushAndRemoveUntil(
        context,
        MaterialPageRoute(builder: (context) => ExpertDetailsScreenNew()),
        (route) => false);
  }
}
