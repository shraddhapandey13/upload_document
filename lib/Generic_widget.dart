
import 'package:flutter/material.dart';
import 'package:get/get.dart';

class GenericWidget {
  GenericWidget._();

   static showSnackBar({
    String title = ' ',
    bool defaultError = false,
  }) {
    TextStyle textStyle =const TextStyle(
      color: Colors.grey,
      fontFamily: 'Poppins',
      fontSize: 18,
      fontWeight: FontWeight.w500,
    );
    if (defaultError) {
      title = 'Something went wrong please try again later!';
    }
    Get.showSnackbar(
      GetSnackBar(
        titleText: Text(
          title,
          style: textStyle,
        ),
        messageText: const SizedBox.shrink(),
        duration: const Duration(seconds: 3),
        backgroundColor: Colors.red,
        boxShadows: const [BoxShadow(blurRadius: 25.0)],
        borderWidth: 0.0,
      ),
    );
  }

}
