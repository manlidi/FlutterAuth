import 'package:flutter/material.dart';

class CustomTextField {
  final String title;
  final String placeholder;
  final bool ispass;
  late String _value;
  String err;

  CustomTextField({required this.title, required this.placeholder, this.ispass = false, this.err = "Veuillez spécifier ce champs!"});

  TextFormField textFormField() {
    return TextFormField(
      onChanged: (e) {
        _value = e;
      },
      validator: (String? e) => e == null || e.isEmpty ? this.err : null,
      decoration: InputDecoration(
        labelText: title,
        labelStyle: TextStyle(color: Colors.redAccent),
        hintText: placeholder,
        border: const OutlineInputBorder(
          borderRadius: BorderRadius.all(Radius.circular(1)),
        ),
        focusedBorder: OutlineInputBorder(
          borderSide: BorderSide(color: Colors.redAccent)
        ),
      ),
      obscureText: ispass, 
    );
  }

  String get value{
    return _value;
  }
}
