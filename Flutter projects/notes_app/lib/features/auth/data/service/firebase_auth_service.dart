import 'dart:async';

import 'package:firebase_auth/firebase_auth.dart';
import 'package:google_sign_in/google_sign_in.dart';

class FirebaseAuthService {
  final FirebaseAuth _firebaseAuth = FirebaseAuth.instance;

  Stream<User?> observeAuthState() {
    return _firebaseAuth.authStateChanges();
  }

  Future<UserCredential> signInWithCredential(OAuthCredential credential) async {
    return await _firebaseAuth.signInWithCredential(credential);
  }

  Future<UserCredential?> registerUser(String email, String password) async {
    try {
      UserCredential userCredential = await FirebaseAuth.instance.createUserWithEmailAndPassword(
        email: email,
        password: password,
      );
      return userCredential;
    } on FirebaseAuthException catch (e) {
      if (e.code == 'weak_password') {
        print('The password provider is too weak.');
      } else if (e.code == 'email-already-in-use') {
        print('The account already exists for that email');
      }
    } catch (e) {
      print(e);
      return null;
    }
    return null;
  }

  Future<UserCredential?> signInWith({required String email, required String password}) async {
    try {
      UserCredential userCredential = await FirebaseAuth.instance.signInWithEmailAndPassword(
        email: email,
        password: password,
      );
      return userCredential;
    } on FirebaseAuthException catch (e) {
      if (e.code == 'weak_password') {
        print('The password provider is too weak.');
      } else if (e.code == 'email-already-in-use') {
        print('The account already exists for that email');
      }
    } catch (e) {
      print(e);
      return null;
    }
    return null;
  }

  Future logout() async {
    await GoogleSignIn().signOut();
    return _firebaseAuth.signOut();
  }
}
