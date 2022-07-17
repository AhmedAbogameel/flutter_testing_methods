import 'dart:async';
import 'package:flutter/material.dart';
import '../constants.dart';
import '../core/router/router.dart';

showSnackBar(String message,{bool upperSnack = false ,bool errorMessage = false,bool popPage = false,duration = 5,Color color = Colors.blue}) {
  ScaffoldMessenger.of(RouteManager.currentContext).hideCurrentSnackBar();
  ScaffoldMessenger.of(RouteManager.currentContext).showSnackBar(
    SnackBar(
      backgroundColor: errorMessage ? Colors.red :  upperSnack ? Colors.orange : color,
      behavior: upperSnack ? SnackBarBehavior.floating : SnackBarBehavior.fixed,
      // shape: RoundedRectangleBorder(
      //     borderRadius: BorderRadius.circular(5)
      // ),
      margin: upperSnack ? EdgeInsets.only(bottom: sizeFromHeight(2)) : null,
      elevation: 0.0,
      content: Text(message,style: const TextStyle(color: Colors.white),),
      action: SnackBarAction(
        label: '',
        onPressed: () {},
      ),
      duration: Duration(seconds: duration),
    ),
  );
  if(popPage) {
    Timer(const Duration(seconds: 5),()=> RouteManager.pop());
  }
}