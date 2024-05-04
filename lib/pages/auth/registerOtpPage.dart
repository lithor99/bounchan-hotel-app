import 'package:bounchan_hotel_member_app/constants/colors.dart';
import 'package:bounchan_hotel_member_app/constants/fonts.dart';
import 'package:bounchan_hotel_member_app/constants/styles.dart';
import 'package:bounchan_hotel_member_app/pages/auth/registerPage.dart';
import 'package:flutter/material.dart';

class RegisterOtpPage extends StatelessWidget {
  const RegisterOtpPage({super.key});

  @override
  Widget build(BuildContext context) {
    final _formKey = GlobalKey<FormState>();
    final _otpController = TextEditingController(text: "123456");
    return Scaffold(
      backgroundColor: ColorConstants.black,
      appBar: AppBar(
        title: Text("ຢືນຢັນລະຫັດ OTP"),
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
                        Center(
                          child: Text(
                            "ກະລຸນາປ້ອນລະຫັດ OTP ທີ່ສົ່ງໄປຫາເບີ",
                            style: getRegularStyle(
                                color: ColorConstants.white,
                                fontSize: FontSizes.s16),
                          ),
                        ),
                        Center(
                          child: Text(
                            "20xxxx6646",
                            style: getRegularStyle(
                                color: ColorConstants.white,
                                fontSize: FontSizes.s16),
                          ),
                        ),
                        SizedBox(height: 50),
                        Padding(
                          padding: EdgeInsets.only(left: 2, bottom: 2),
                          child: Text(
                            "ລະຫັດ OTP",
                            style: getRegularStyle(color: ColorConstants.white),
                          ),
                        ),
                        TextFormField(
                          controller: _otpController,
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
                            hintText: "xxxxxx",
                            hintStyle: getRegularStyle(
                                color: ColorConstants.lightGrey,
                                fontSize: FontSizes.s16),
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
                          textAlign: TextAlign.center,
                          maxLength: 6,
                          keyboardType: TextInputType.number,
                          style: getRegularStyle(
                              color: ColorConstants.white,
                              fontSize: FontSizes.s16),
                          validator: (value) {
                            if (_otpController.text.isEmpty ||
                                _otpController.text == "") {
                              return "ກະລຸນາປ້ອນລະຫັດ OTP";
                            } else if (_otpController.text.length < 6) {
                              return "ກະລຸນາປ້ອນລະຫັດ OTP ໃຫ້ຄົບ 6 ໂຕ";
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
                                builder: (context) => RegisterPage()))
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
