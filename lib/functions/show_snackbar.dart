import 'package:flutter/material.dart';

void showSnackbar(String content, BuildContext context) {
  ScaffoldMessenger.of(context).showSnackBar(SnackBar(content: Text(content)));
}
