import 'package:firebase_auth/firebase_auth.dart';

class AuthenticationServices {
  AuthenticationServices._privateConstructor();

  static final AuthenticationServices _intance =
      AuthenticationServices._privateConstructor();

  static AuthenticationServices get getAuthInstance => _intance;

  FirebaseAuth authInstance = FirebaseAuth.instance;

  // Create New Registeration
  Future<String> createNewRegister(String email, String password) async {
    try {
      await getAuthInstance.authInstance.createUserWithEmailAndPassword(
        email: email,
        password: password,
      );

      return "Registeration created Successfully";
    } on FirebaseAuthException catch (e) {
      if (e.code == 'weak-password') {
        throw "The password provided is too weak";
      } else if (e.code == 'email-already-in-use') {
        throw "The account already exists for that email";
      }

      throw e.message.toString();
    }
  }

  // Login the User
  Future<String> logInUser(String email, String password) async {
    print("$email, $password");
    try {
      await getAuthInstance.authInstance.signInWithEmailAndPassword(
        email: email,
        password: password,
      );

      return "Login SuccessFully";
    } on FirebaseAuthException catch (e) {
      if (e.code == 'user-not-found') {
        throw "No user found for that email";
      } else if (e.code == 'wrong-password') {
        throw "Wrong password provided for that user";
      }

      throw e.message.toString();
    }
  }
}
