import 'package:flutter/material.dart';

InputDecoration getInputDecoration(String label) {
  return InputDecoration(
    hintText: label,
    fillColor: Colors.blueGrey.shade100,
    filled: true,
    contentPadding: const EdgeInsets.fromLTRB(16, 8, 16, 8),
    border: OutlineInputBorder(borderRadius: BorderRadius.circular(60)),
    focusedBorder: OutlineInputBorder(
      borderRadius: BorderRadius.circular(60),
      borderSide: const BorderSide(color: Colors.black, width: 2),
    ),
  );
}
