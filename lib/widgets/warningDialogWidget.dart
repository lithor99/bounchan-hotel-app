import 'package:bounchan_hotel_member_app/constants/colors.dart';
import 'package:bounchan_hotel_member_app/constants/styles.dart';
import 'package:flutter/material.dart';

class WarningDialogWidget extends StatelessWidget {
  final String detail;
  final Function onConfirm;
  WarningDialogWidget({
    super.key,
    required this.detail,
    required this.onConfirm,
  });

  @override
  Widget build(BuildContext context) {
    return AlertDialog(
      backgroundColor: ColorConstants.white,
      actionsPadding: EdgeInsets.all(5),
      icon: Icon(
        Icons.warning_amber_rounded,
        color: ColorConstants.danger,
        size: 60,
      ),
      shape: RoundedRectangleBorder(
        borderRadius: BorderRadius.circular(10.0),
      ),
      buttonPadding: EdgeInsets.zero,
      content: Text(
        detail,
        textAlign: TextAlign.center,
        style: getBoldStyle(color: ColorConstants.black),
      ),
      actionsAlignment: MainAxisAlignment.end,
      actions: [
        TextButton(
          onPressed: () {
            Navigator.pop(context);
          },
          child: Text(
            "ຍົກເລີກ",
            style: getBoldStyle(color: ColorConstants.black),
          ),
        ),
        TextButton(
          onPressed: () {
            onConfirm();
          },
          child: Text(
            "ຕົກລົງ",
            style: getBoldStyle(color: ColorConstants.info),
          ),
        ),
      ],
    );
  }
}
