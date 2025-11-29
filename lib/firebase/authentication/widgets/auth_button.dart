import 'package:flutter/material.dart';

class AuthButton extends StatelessWidget {
  final String btnTxt;
  final Function submitBtn;

  const AuthButton({super.key, required this.btnTxt, required this.submitBtn});

  @override
  Widget build(BuildContext context) {
    return GestureDetector(
      onTap: () => submitBtn(),
      child: Container(
        width: double.infinity,
        padding: EdgeInsets.all(10),
        decoration: BoxDecoration(
          color: Colors.pink,
          borderRadius: BorderRadius.all(Radius.circular(10)),
        ),
        child: Text(
          btnTxt,
          textAlign: TextAlign.center,
          style: TextStyle(
            fontSize: 20,
            color: Colors.white,
            fontWeight: FontWeight.bold,
          ),
        ),
      ),
    );
  }
}

Widget textField(TextEditingController controller, String labelTxt) {
  return TextFormField(
    controller: controller,
    decoration: InputDecoration(
      labelText: labelTxt,
      border: OutlineInputBorder(
        borderRadius: BorderRadius.all(Radius.circular(10)),
      ),
    ),
  );
}

void showSnackBar(BuildContext context, String msg, Color bgColor) {
  ScaffoldMessenger.of(context).showSnackBar(
    SnackBar(
      content: Text(msg, style: TextStyle(color: Colors.white)),
      backgroundColor: bgColor,
      behavior: SnackBarBehavior.floating,
    ),
  );
}
