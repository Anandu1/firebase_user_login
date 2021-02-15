import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';

Widget customTextField(
    String label, bool isObscure, TextEditingController textcontroller) {
  return TextFormField(
    controller: textcontroller,
    decoration: InputDecoration(
      border: OutlineInputBorder(
        borderRadius: BorderRadius.circular(10),
      ),
      labelText: label,
    ),
    validator: (value){
      if(value.isEmpty){
        return "Required";
      }
      else {
        return null;
      }
    },
    obscureText: isObscure,
  );
}
