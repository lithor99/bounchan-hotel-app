import 'package:bounchan_hotel_member_app/constants/colors.dart';
import 'package:bounchan_hotel_member_app/constants/styles.dart';
import 'package:bounchan_hotel_member_app/pages/auth/registerOtpPage.dart';
import 'package:flutter/material.dart';

class RegisterPhoneNumberPage extends StatelessWidget {
  const RegisterPhoneNumberPage({super.key});

  @override
  Widget build(BuildContext context) {
    final _formKey = GlobalKey<FormState>();
    final _phoneNumberController = TextEditingController(text: "2078966646");
    return Scaffold(
      backgroundColor: ColorConstants.black,
      appBar: AppBar(
        title: Text("ເບີໂທລະສັບ"),
      ),
      body: Form(
        key: _formKey,
        child: Column(
          children: [
            Expanded(
              child: Center(
                child: Padding(
                  padding: EdgeInsets.all(10),
                  child: SingleChildScrollView(
                    physics: BouncingScrollPhysics(),
                    child: Column(
                      crossAxisAlignment: CrossAxisAlignment.start,
                      children: [
                        Padding(
                          padding: EdgeInsets.only(left: 2, bottom: 2),
                          child: Text(
                            "ເບີໂທລະສັບ",
                            style: getRegularStyle(color: ColorConstants.white),
                          ),
                        ),
                        TextFormField(
                          controller: _phoneNumberController,
                          decoration: InputDecoration(
                            border: OutlineInputBorder(
                              borderRadius: BorderRadius.circular(6),
                              borderSide: BorderSide(
                                  width: 0.5, color: ColorConstants.white),
                            ),
                            focusedBorder: OutlineInputBorder(
                              borderRadius: BorderRadius.circular(6),
                              borderSide: BorderSide(
                                  width: 1, color: ColorConstants.white),
                            ),
                            enabledBorder: OutlineInputBorder(
                              borderRadius: BorderRadius.circular(6),
                              borderSide: BorderSide(
                                  width: 0.5, color: ColorConstants.white),
                            ),
                            hintText: "20xxxxxxxx",
                            hintStyle: getRegularStyle(
                                color: ColorConstants.lightGrey),
                            errorBorder: OutlineInputBorder(
                              borderRadius: BorderRadius.circular(6),
                              borderSide: BorderSide(
                                  width: 1, color: ColorConstants.danger),
                            ),
                            errorStyle:
                                getRegularStyle(color: ColorConstants.danger),
                            contentPadding: EdgeInsets.symmetric(
                                vertical: 0, horizontal: 10),
                          ),
                          maxLength: 10,
                          style: getRegularStyle(color: ColorConstants.white),
                          validator: (value) {
                            if (_phoneNumberController.text.isEmpty ||
                                _phoneNumberController.text == "") {
                              return "ກະລຸນາປ້ອນເບີໂທລະສັບ";
                            }
                            return null;
                          },
                        ),
                      ],
                    ),
                  ),
                ),
              ),
            ),
            SafeArea(
              child: InkWell(
                onTap: () {
                  if (_formKey.currentState!.validate()) {
                    Navigator.push(
                            context,
                            MaterialPageRoute(
                                builder: (context) => RegisterOtpPage()))
                        .then((value) => Navigator.pop(context));
                  }
                },
                borderRadius: BorderRadius.only(
                    topLeft: Radius.circular(6), topRight: Radius.circular(6)),
                child: Container(
                  height: 55,
                  width: double.infinity,
                  decoration: BoxDecoration(
                      color: ColorConstants.primary,
                      borderRadius: BorderRadius.only(
                          topLeft: Radius.circular(6),
                          topRight: Radius.circular(6))),
                  child: Center(
                    child: Row(
                      mainAxisAlignment: MainAxisAlignment.center,
                      children: [
                        Text(
                          "ຖັດໄປ",
                          style: getRegularStyle(color: ColorConstants.black),
                        ),
                        SizedBox(width: 10),
                        Icon(
                          Icons.arrow_forward_ios_rounded,
                          color: ColorConstants.black,
                          size: 20,
                        )
                      ],
                    ),
                  ),
                ),
              ),
            )
          ],
        ),
      ),
    );
  }
}
