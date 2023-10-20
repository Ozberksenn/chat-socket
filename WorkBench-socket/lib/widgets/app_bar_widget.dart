import 'package:flutter/material.dart';

AppBar appBarWidget({String? title}) {
  return AppBar(
    backgroundColor: Colors.black87,
    elevation: 0,
    title: Text(title ?? ''),
  );
}
