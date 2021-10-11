import 'package:flutter/material.dart';
import 'package:flutter_demo/src/theme/colors.dart';

/// This builds a widget with three buttons,
/// "Following", "My Interests", and "Trending"
Widget getTopButtonRow(BuildContext context) {
  return Container(
    padding: const EdgeInsets.only(bottom: 0, top: 15, left: 35, right: 35),
    child: Row(
      mainAxisAlignment: MainAxisAlignment.spaceBetween,
      children: <Widget>[
        _genTopMenuButton(
            context: context, text: "Following", isSolid: true, onPressed: null),
        _genTopMenuButton(
            context: context,
            text: "My Interests",
            isSolid: false,
            onPressed: null),
        _genTopMenuButton(
            context: context, text: "Trending", isSolid: false, onPressed: null),
      ],
    ),
  );
}

/// helper for getTopButtonRow to reduce redundant code
/// isSolid is true if the button will be filled in with the accent color
Widget _genTopMenuButton(
    {required BuildContext context,
    required String text,
    required bool isSolid,
    required void Function()? onPressed}) {
  MaterialStateProperty<Color>? backGroundColor;
  MaterialStateProperty<Color>? foregroundColor;
  if (isSolid) {
    backGroundColor = MaterialStateProperty.all<Color>(AppColors.accent);
    foregroundColor = MaterialStateProperty.all<Color>(Colors.white);
  } else if (Theme.of(context).brightness == Brightness.dark) {
    foregroundColor = MaterialStateProperty.all<Color>(Colors.white);
  } else {
    foregroundColor = MaterialStateProperty.all<Color>(AppColors.accent);
  }

  return SizedBox(
    width: 100,
    child: TextButton(
        child: Text(text, style: const TextStyle(fontSize: 14)),
        style: ButtonStyle(
            foregroundColor: foregroundColor,
            backgroundColor: backGroundColor,
            shape: MaterialStateProperty.all<RoundedRectangleBorder>(
                RoundedRectangleBorder(
                    borderRadius: BorderRadius.circular(30.0),
                    side: const BorderSide(
                        color: AppColors.accent, width: 2.0)))),
        onPressed: onPressed),
  );
}
