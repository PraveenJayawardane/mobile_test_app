import 'package:flutter/material.dart';

SnackBar toastMessage({required String message}) => SnackBar(
      content: Text(message, style: const TextStyle(color: Colors.redAccent)),
      backgroundColor: Colors.black12,
      elevation: 0,
      behavior: SnackBarBehavior.floating,
      margin: const EdgeInsets.all(5),
    );
