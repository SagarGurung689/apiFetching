// import 'package:flutter/material.dart';

import 'package:another_flushbar/flushbar.dart';
import 'package:another_flushbar/flushbar_route.dart';
import 'package:flutter/material.dart';
import 'package:fluttertoast/fluttertoast.dart';

class Utils {
  static void toastMessage(String msg) {
    Fluttertoast.showToast(msg: msg);
  }

  static void flushBarErrorMessage(String message, BuildContext context) {
    showFlushbar(
        context: context,
        flushbar: Flushbar(
          backgroundColor: Colors.red,
          flushbarPosition: FlushbarPosition.BOTTOM,
          flushbarStyle: FlushbarStyle.FLOATING,
          reverseAnimationCurve: Curves.decelerate,
          icon: const Icon(
            Icons.info_outline,
            size: 28.0,
            color: Colors.white,
          ),
          message: message,
          duration: Duration(seconds: 5),
          forwardAnimationCurve: Curves.decelerate,
          isDismissible: true,
          mainButton: TextButton(
            onPressed: () {},
            child: Text(
              "Retry",
              style: TextStyle(color: Colors.white),
            ),
          ),
        )..show(context));


  
  
  }

  static void fieldFocusChnage(BuildContext context, FocusNode current, FocusNode next){
    current.unfocus();
    FocusScope.of(context).requestFocus(next);

  }
}
