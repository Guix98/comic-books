import 'package:comic_book/controllers/user_controller.dart';
import 'package:comic_book/helpers/helpers.dart';
import 'package:firebase_auth/firebase_auth.dart';
import 'package:flutter/foundation.dart';
import 'package:get/get_core/src/get_main.dart';
import 'package:get/get_instance/get_instance.dart';
import 'package:google_sign_in/google_sign_in.dart';

String? userEmail;
String? displayName;
final GoogleSignIn googleSignIn = GoogleSignIn();
final FirebaseAuth _auth = FirebaseAuth.instance;
final UserController userController = Get.find();

Future<User?> signInWithGoogle() async {
  User? user;
  await googleSignIn.signOut();
  if (kIsWeb) {
    GoogleAuthProvider authProvider = GoogleAuthProvider();
    try {
      final userCredential = await _auth.signInWithPopup(authProvider);
      user = userCredential.user;
    } catch (e) {
      showWebSnackBar('Error on Google Sign in', e.toString(), isWarning: true);
    }
  } else {
    final GoogleSignInAccount? googleSignInAccount =
        await googleSignIn.signIn();
    if (googleSignInAccount != null) {
      final GoogleSignInAuthentication googleSignInAuthentication =
          await googleSignInAccount.authentication;

      final AuthCredential credential = GoogleAuthProvider.credential(
        accessToken: googleSignInAuthentication.accessToken,
        idToken: googleSignInAuthentication.idToken,
      );

      try {
        final UserCredential userCredential =
            await _auth.signInWithCredential(credential);
        user = userCredential.user;
      } on FirebaseAuthException catch (e) {
        if (e.code == 'account-exists-with-different-credential') {
          showWebSnackBar('Error on Google Sign in',
              'The account already exists with a different credential',
              isWarning: true);
        }
        if (e.code == 'invalid-credential') {
          showWebSnackBar('Error on Google Sign in',
              'Error occurred while accesing credentials. Please try again',
              isWarning: true);
        }
      } catch (e) {
        showWebSnackBar('Error on Google Sign in', e.toString(),
            isWarning: true);
      }
    }
  }
  userController.setUserParams(
      uid: user?.uid ?? '',
      displayName: user?.displayName ?? '',
      email: user?.email ?? '');
  return user;
}

void signOutGoogle() async {
  await googleSignIn.signOut();
  await _auth.signOut();
  userController.setUserParams(uid: '', displayName: '', email: '');

  showWebSnackBar('Log Out', 'User signed out');
}
