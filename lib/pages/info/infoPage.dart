import 'package:bounchan_hotel_member_app/constants/colors.dart';
import 'package:bounchan_hotel_member_app/constants/fonts.dart';
import 'package:bounchan_hotel_member_app/constants/styles.dart';
import 'package:flutter/material.dart';
import 'package:font_awesome_flutter/font_awesome_flutter.dart';

class InfoPage extends StatelessWidget {
  const InfoPage({super.key});

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      backgroundColor: ColorConstants.black,
      appBar: AppBar(
        title: Text(
          "ຂໍ້ມູນຕິດຕໍ່",
        ),
      ),
      body: Padding(
        padding: EdgeInsets.all(10),
        child: Column(
          children: [
            SizedBox(height: 20),
            CircleAvatar(
              radius: 81,
              backgroundColor: ColorConstants.primary,
              child: CircleAvatar(
                radius: 80,
                backgroundImage: AssetImage("assets/images/logo.png"),
              ),
            ),
            SizedBox(height: 20),
            Text("ໂຮງແຮມ ບຸນຈັນ", style: getBoldStyle(fontSize: FontSizes.s20)),
            SizedBox(height: 30),
            Divider(color: ColorConstants.lightGrey),
            Row(
              children: [
                CircleAvatar(
                  radius: 21,
                  backgroundColor: ColorConstants.primary,
                  child: CircleAvatar(
                    radius: 20,
                    backgroundColor: ColorConstants.black,
                    child: Icon(
                      Icons.phone,
                      color: ColorConstants.primary,
                      size: 25,
                    ),
                  ),
                ),
                SizedBox(width: 10),
                Column(
                  crossAxisAlignment: CrossAxisAlignment.start,
                  children: [
                    SizedBox(height: 5),
                    Text(
                      "ເບີໂທຕິດຕໍ່",
                      style: getRegularStyle(
                          color: ColorConstants.lightGrey,
                          fontSize: FontSizes.s14),
                    ),
                    SizedBox(height: 5),
                    Text(
                      "20223334455",
                      style: getBoldStyle(
                          color: ColorConstants.white, fontSize: FontSizes.s16),
                    ),
                  ],
                ),
              ],
            ),
            Divider(color: ColorConstants.lightGrey),
            Row(
              children: [
                CircleAvatar(
                  radius: 21,
                  backgroundColor: ColorConstants.primary,
                  child: CircleAvatar(
                    radius: 20,
                    backgroundColor: ColorConstants.black,
                    child: Icon(
                      FontAwesomeIcons.whatsapp,
                      color: ColorConstants.primary,
                      size: 25,
                    ),
                  ),
                ),
                SizedBox(width: 10),
                Column(
                  crossAxisAlignment: CrossAxisAlignment.start,
                  children: [
                    SizedBox(height: 5),
                    Text(
                      "Whatsapp",
                      style: getRegularStyle(
                          color: ColorConstants.lightGrey,
                          fontSize: FontSizes.s14),
                    ),
                    SizedBox(height: 5),
                    Text(
                      "2055443322",
                      style: getBoldStyle(
                          color: ColorConstants.white, fontSize: FontSizes.s16),
                    ),
                  ],
                ),
              ],
            ),
            Divider(color: ColorConstants.lightGrey),
            Row(
              children: [
                CircleAvatar(
                  radius: 21,
                  backgroundColor: ColorConstants.primary,
                  child: CircleAvatar(
                    radius: 20,
                    backgroundColor: ColorConstants.black,
                    child: Icon(
                      Icons.facebook_rounded,
                      color: ColorConstants.primary,
                      size: 25,
                    ),
                  ),
                ),
                SizedBox(width: 10),
                Column(
                  crossAxisAlignment: CrossAxisAlignment.start,
                  children: [
                    SizedBox(height: 5),
                    Text(
                      "Facebook",
                      style: getRegularStyle(
                          color: ColorConstants.lightGrey,
                          fontSize: FontSizes.s14),
                    ),
                    SizedBox(height: 5),
                    Text(
                      "Bounchan Hotel",
                      style: getBoldStyle(
                          color: ColorConstants.white, fontSize: FontSizes.s16),
                    ),
                  ],
                ),
              ],
            ),
            Divider(color: ColorConstants.lightGrey),
            Row(
              children: [
                CircleAvatar(
                  radius: 21,
                  backgroundColor: ColorConstants.primary,
                  child: CircleAvatar(
                    radius: 20,
                    backgroundColor: ColorConstants.black,
                    child: Icon(
                      Icons.email_outlined,
                      color: ColorConstants.primary,
                      size: 25,
                    ),
                  ),
                ),
                SizedBox(width: 10),
                Column(
                  crossAxisAlignment: CrossAxisAlignment.start,
                  children: [
                    SizedBox(height: 5),
                    Text(
                      "ອີເມລ",
                      style: getRegularStyle(
                          color: ColorConstants.lightGrey,
                          fontSize: FontSizes.s14),
                    ),
                    SizedBox(height: 5),
                    Text(
                      "bounchan@gmail.com",
                      style: getBoldStyle(
                          color: ColorConstants.white, fontSize: FontSizes.s16),
                    ),
                  ],
                ),
              ],
            ),
            Divider(color: ColorConstants.lightGrey),
          ],
        ),
      ),
    );
  }
}
