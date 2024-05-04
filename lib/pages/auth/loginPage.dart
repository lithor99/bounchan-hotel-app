import 'package:bounchan_hotel_member_app/constants/colors.dart';
import 'package:bounchan_hotel_member_app/constants/fonts.dart';
import 'package:bounchan_hotel_member_app/constants/styles.dart';
import 'package:bounchan_hotel_member_app/pages/auth/registerPhoneNumberPage.dart';
import 'package:bounchan_hotel_member_app/pages/home/homePage.dart';
import 'package:flutter/material.dart';

class LoginPage extends StatefulWidget {
  const LoginPage({super.key});

  @override
  State<LoginPage> createState() => _LoginPageState();
}

class _LoginPageState extends State<LoginPage> {
  final _formKey = GlobalKey<FormState>();
  final _phoneNumberController = TextEditingController(text: "2078966646");
  final _passwordController = TextEditingController(text: "123456");
  bool _isRemember = false;
  bool _showPassword = false;

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      body: Container(
        width: double.infinity,
        height: double.infinity,
        decoration: BoxDecoration(
            image: DecorationImage(
                image: AssetImage("assets/images/login.jpg"),
                fit: BoxFit.cover)),
        child: Column(
          children: [
            Expanded(
              child: Container(
                width: double.infinity,
                height: double.infinity,
                color: Colors.black45,
                child: Form(
                  key: _formKey,
                  child: SingleChildScrollView(
                    physics: BouncingScrollPhysics(),
                    child: Padding(
                      padding: const EdgeInsets.symmetric(
                          horizontal: 30, vertical: 10),
                      child: Column(
                        crossAxisAlignment: CrossAxisAlignment.start,
                        children: [
                          SizedBox(height: 80),
                          Center(
                            child: Container(
                              height: 150,
                              width: 150,
                              decoration: BoxDecoration(
                                  border: Border.all(
                                      color: ColorConstants.primary, width: 3),
                                  borderRadius: BorderRadius.circular(6),
                                  image: DecorationImage(
                                      image: AssetImage(
                                          "assets/images/logo.jpg"))),
                            ),
                          ),
                          SizedBox(height: 30),
                          Center(
                            child: Text(
                              "ຍິນດີຕ້ອນຮັບເຂົ້າສູ່ລະບົບ",
                              style: getBoldStyle(
                                  fontSize: FontSizes.s18,
                                  color: ColorConstants.white),
                            ),
                          ),
                          SizedBox(height: 40),
                          Padding(
                            padding: EdgeInsets.only(left: 2, bottom: 2),
                            child: Text(
                              "ເບີໂທລະສັບ",
                              style:
                                  getRegularStyle(color: ColorConstants.white),
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
                          // SizedBox(height: 10),
                          Padding(
                            padding: EdgeInsets.only(left: 2, bottom: 2),
                            child: Text(
                              "ລະຫັດຜ່ານ",
                              style:
                                  getRegularStyle(color: ColorConstants.white),
                            ),
                          ),
                          TextFormField(
                            controller: _passwordController,
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
                                hintText: "ລະຫັດຜ່ານ",
                                hintStyle: getRegularStyle(
                                    color: ColorConstants.lightGrey),
                                errorBorder: OutlineInputBorder(
                                  borderRadius: BorderRadius.circular(6),
                                  borderSide: BorderSide(
                                      width: 1, color: ColorConstants.danger),
                                ),
                                errorStyle: getRegularStyle(
                                    color: ColorConstants.danger),
                                contentPadding: EdgeInsets.symmetric(
                                    vertical: 0, horizontal: 10),
                                suffixIcon: InkWell(
                                  onTap: () {
                                    setState(() {
                                      _showPassword = !_showPassword;
                                    });
                                  },
                                  child: Icon(
                                    _showPassword
                                        ? Icons.visibility_off
                                        : Icons.visibility,
                                    color: ColorConstants.lightGrey,
                                  ),
                                )),
                            obscureText: !_showPassword,
                            style: getRegularStyle(color: ColorConstants.white),
                            validator: (value) {
                              if (_passwordController.text.isEmpty ||
                                  _passwordController.text == "") {
                                return "ກະລຸນາປ້ອນລະຫັດຜ່ານ";
                              }
                              return null;
                            },
                          ),
                          SizedBox(height: 10),
                          Row(
                            children: [
                              Checkbox(
                                  value: _isRemember,
                                  fillColor: MaterialStateProperty.resolveWith(
                                      (states) {
                                    if (!states
                                        .contains(MaterialState.selected)) {
                                      return ColorConstants.white;
                                    }
                                    return null;
                                  }),
                                  activeColor: ColorConstants.white,
                                  checkColor: ColorConstants.black,
                                  onChanged: (_) {
                                    setState(() {
                                      _isRemember = !_isRemember;
                                    });
                                  }),
                              Padding(
                                padding: EdgeInsets.only(left: 5),
                                child: Text(
                                  "ຈື່ຊື່ຜູ້ໃຊ້ໄວ້",
                                  style: getRegularStyle(
                                      color: ColorConstants.white),
                                ),
                              ),
                            ],
                          ),
                          SizedBox(height: 10),
                          SizedBox(
                            width: double.infinity,
                            height: 50,
                            child: ElevatedButton(
                              onPressed: () {
                                if (_formKey.currentState!.validate()) {
                                  Navigator.pushAndRemoveUntil(
                                      context,
                                      MaterialPageRoute(
                                          builder: (context) => HomePage()),
                                      (route) => false);
                                }
                              },
                              style: ButtonStyle(
                                backgroundColor: MaterialStatePropertyAll(
                                    ColorConstants.primary),
                              ),
                              child: Text(
                                "ເຂົ້າສູ່ລະບົບ",
                                style: getBoldStyle(
                                    color: ColorConstants.white,
                                    fontSize: FontSizes.s16),
                              ),
                            ),
                          ),
                          // SizedBox(height: 20),
                          Row(
                            mainAxisAlignment: MainAxisAlignment.end,
                            children: [
                              TextButton(
                                  onPressed: () {},
                                  child: Text(
                                    "ລືມລະຫັດຜ່ານ",
                                    style: TextStyle(
                                        decoration: TextDecoration.underline,
                                        decorationColor: ColorConstants.primary,
                                        decorationThickness: 2.0,
                                        color: ColorConstants.primary,
                                        fontSize: FontSizes.s14,
                                        fontFamily: FontConstants.fontFamilay),
                                  )),
                            ],
                          ),
                          // SizedBox(height: 20),
                          SizedBox(
                            width: double.infinity,
                            height: 50,
                            child: OutlinedButton(
                              onPressed: () {
                                if (_formKey.currentState!.validate()) {
                                  Navigator.push(
                                      context,
                                      MaterialPageRoute(
                                          builder: (context) =>
                                              RegisterPhoneNumberPage()));
                                }
                              },
                              style: OutlinedButton.styleFrom(
                                side: BorderSide(
                                    color: ColorConstants.primary,
                                    width: 1.0), // Set border color and width
                              ),
                              child: Text(
                                "ລົງທະບຽນ",
                                style: getBoldStyle(
                                    color: ColorConstants.white,
                                    fontSize: FontSizes.s16),
                              ),
                            ),
                          ),
                        ],
                      ),
                    ),
                  ),
                ),
              ),
            ),
            Padding(
              padding: EdgeInsets.only(bottom: 20),
              child: SafeArea(
                  child: Center(
                child: Text(
                  "Version 1.0",
                  style: getRegularStyle(
                      fontSize: FontSizes.s12, color: ColorConstants.lightGrey),
                ),
              )),
            )
          ],
        ),
      ),
    );
  }
}
