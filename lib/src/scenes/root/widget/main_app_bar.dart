import 'package:flutter/material.dart';
import 'package:research/src/constants/app_text_style.dart';

class MainAppBar {
  static AppBar main(
    BuildContext context,
    String title,
  ) {
    return AppBar(
      backgroundColor: Colors.white,
      leadingWidth: MediaQuery.of(context).size.width - 100,
      elevation: 0.5,
      leading: Padding(
        padding: const EdgeInsets.only(left: 16.0),
        child: Column(
          crossAxisAlignment: CrossAxisAlignment.start,
          mainAxisAlignment: MainAxisAlignment.center,
          children: [
            Text(
              'Morning',
              style:
                  AppTextStyle.customStyle(14, Colors.black, FontWeight.w700),
            ),
            Text(
              title,
              style:
                  AppTextStyle.customStyle(18, Colors.black, FontWeight.w800),
            ),
          ],
        ),
      ),
    );
  }
}
