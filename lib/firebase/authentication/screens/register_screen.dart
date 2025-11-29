// ignore_for_file: use_build_context_synchronously, invalid_return_type_for_catch_error

import 'package:flutter/material.dart';
import 'package:learnapp/firebase/authentication/screens/login_screen.dart';
import 'package:learnapp/firebase/authentication/services/authentication_methods.dart';
import 'package:learnapp/firebase/authentication/widgets/auth_button.dart';

class RegisterAuthFBScreen extends StatefulWidget {
  const RegisterAuthFBScreen({super.key});

  @override
  State<RegisterAuthFBScreen> createState() => _RegisterAuthFBScreenState();
}

class _RegisterAuthFBScreenState extends State<RegisterAuthFBScreen> {
  final TextEditingController _emailController = TextEditingController();
  final TextEditingController _pwdController = TextEditingController();

  @override
  void dispose() {
    super.dispose();
    _emailController.dispose();
    _pwdController.dispose();
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      body: Padding(
        padding: const EdgeInsets.all(30),
        child: Column(
          mainAxisAlignment: MainAxisAlignment.center,
          crossAxisAlignment: CrossAxisAlignment.center,
          children: [
            textField(_emailController, "Email"),
            SizedBox(height: 20),

            textField(_pwdController, "Password"),
            SizedBox(height: 30),

            AuthButton(
              btnTxt: "SignIn",
              submitBtn: () {
                if (_emailController.text.isEmpty ||
                    _pwdController.text.isEmpty) {
                  showSnackBar(
                    context,
                    "Fields are manditory",
                    const Color(0xFFF44336),
                  );
                } else {
                  AuthenticationServices.getAuthInstance
                      .createNewRegister(
                        _emailController.text,
                        _pwdController.text,
                      )
                      .then((val) {
                        showSnackBar(context, val, const Color(0xFF4CAF50));
                        Navigator.of(context).pushReplacement(
                          MaterialPageRoute(
                            builder: (context) => LoginAuthFBScreen(),
                          ),
                        );
                      })
                      .catchError(
                        (e) =>
                            showSnackBar(context, e, const Color(0xFFF44336)),
                      );
                }
              },
            ),
          ],
        ),
      ),
    );
  }
}
