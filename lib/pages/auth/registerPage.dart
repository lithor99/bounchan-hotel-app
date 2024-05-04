import 'package:bounchan_hotel_member_app/constants/colors.dart';
import 'package:bounchan_hotel_member_app/constants/styles.dart';
import 'package:bounchan_hotel_member_app/pages/home/homePage.dart';
import 'package:flutter/material.dart';

class RegisterPage extends StatefulWidget {
  const RegisterPage({super.key});

  @override
  State<RegisterPage> createState() => _RegisterPageState();
}

class _RegisterPageState extends State<RegisterPage> {
  final _formKey = GlobalKey<FormState>();
  final _nameController = TextEditingController(text: "lithor");
  final _lastNameController = TextEditingController(text: "xiaye");
  final _phoneNumberController = TextEditingController(text: "2078966646");
  final _emailController = TextEditingController(text: "example@gmail.com");
  final _passwordController = TextEditingController(text: "123456");
  final _confirmPasswordController = TextEditingController(text: "123456");
  bool _showPassword = false;
  String _gender = "";
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      backgroundColor: ColorConstants.black,
      appBar: AppBar(
        title: Text("ໜ້າລົງທະບຽນ"),
      ),
      body: Form(
        key: _formKey,
        child: Column(
          children: [
            Expanded(
              child: SingleChildScrollView(
                physics: BouncingScrollPhysics(),
                child: Padding(
                  padding: const EdgeInsets.all(10),
                  child: Column(
                    crossAxisAlignment: CrossAxisAlignment.start,
                    children: [
                      Center(
                        child: CircleAvatar(
                          radius: 81,
                          backgroundColor: ColorConstants.black,
                          child: CircleAvatar(
                            radius: 80,
                            backgroundColor: ColorConstants.primary,
                            backgroundImage: NetworkImage(
                                "https://cdn-icons-png.flaticon.com/512/3870/3870822.png"),
                          ),
                        ),
                      ),
                      Center(
                        child: IconButton(
                            onPressed: () {},
                            icon: Icon(
                              Icons.add_a_photo_rounded,
                              size: 30,
                              color: ColorConstants.primary,
                            )),
                      ),
                      SizedBox(height: 15),
                      Padding(
                        padding: EdgeInsets.only(left: 2, bottom: 2),
                        child: Text(
                          "ຊື່",
                          style: getRegularStyle(color: ColorConstants.white),
                        ),
                      ),
                      TextFormField(
                        controller: _nameController,
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
                          hintText: "ຊື່",
                          hintStyle:
                              getRegularStyle(color: ColorConstants.lightGrey),
                          errorBorder: OutlineInputBorder(
                            borderRadius: BorderRadius.circular(6),
                            borderSide: BorderSide(
                                width: 1, color: ColorConstants.danger),
                          ),
                          errorStyle:
                              getRegularStyle(color: ColorConstants.danger),
                          contentPadding:
                              EdgeInsets.symmetric(vertical: 0, horizontal: 10),
                        ),
                        style: getRegularStyle(color: ColorConstants.white),
                        validator: (value) {
                          if (_nameController.text.isEmpty ||
                              _nameController.text == "") {
                            return "ກະລຸນາປ້ອນຊື່";
                          }
                          return null;
                        },
                      ),
                      SizedBox(height: 15),
                      Padding(
                        padding: EdgeInsets.only(left: 2, bottom: 2),
                        child: Text(
                          "ນາມສະກຸນ",
                          style: getRegularStyle(color: ColorConstants.white),
                        ),
                      ),
                      TextFormField(
                        controller: _lastNameController,
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
                          hintText: "ນາມສະກຸນ",
                          hintStyle:
                              getRegularStyle(color: ColorConstants.lightGrey),
                          errorBorder: OutlineInputBorder(
                            borderRadius: BorderRadius.circular(6),
                            borderSide: BorderSide(
                                width: 1, color: ColorConstants.danger),
                          ),
                          errorStyle:
                              getRegularStyle(color: ColorConstants.danger),
                          contentPadding:
                              EdgeInsets.symmetric(vertical: 0, horizontal: 10),
                        ),
                        style: getRegularStyle(color: ColorConstants.white),
                      ),
                      SizedBox(height: 15),
                      Row(
                        children: [
                          Radio<String>(
                            value: "ຊາຍ",
                            groupValue: _gender,
                            activeColor: ColorConstants.white,
                            fillColor:
                                MaterialStatePropertyAll(ColorConstants.white),
                            onChanged: (value) {
                              setState(() {
                                _gender = value!;
                              });
                            },
                          ),
                          Text(
                            "ຊາຍ",
                            style: getRegularStyle(color: ColorConstants.white),
                          ),
                          SizedBox(width: 100),
                          Radio<String>(
                            value: "ຍິງ",
                            groupValue: _gender,
                            activeColor: ColorConstants.white,
                            fillColor:
                                MaterialStatePropertyAll(ColorConstants.white),
                            onChanged: (value) {
                              setState(() {
                                _gender = value!;
                              });
                            },
                          ),
                          Text(
                            "ຍິງ",
                            style: getRegularStyle(color: ColorConstants.white),
                          ),
                        ],
                      ),
                      SizedBox(height: 15),
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
                          hintStyle:
                              getRegularStyle(color: ColorConstants.lightGrey),
                          errorBorder: OutlineInputBorder(
                            borderRadius: BorderRadius.circular(6),
                            borderSide: BorderSide(
                                width: 1, color: ColorConstants.danger),
                          ),
                          errorStyle:
                              getRegularStyle(color: ColorConstants.danger),
                          contentPadding:
                              EdgeInsets.symmetric(vertical: 0, horizontal: 10),
                        ),
                        readOnly: true,
                        style: getRegularStyle(color: ColorConstants.white),
                        validator: (value) {
                          if (_phoneNumberController.text.isEmpty ||
                              _phoneNumberController.text == "") {
                            return "ກະລຸນາປ້ອນເບີໂທລະສັບ";
                          }
                          return null;
                        },
                      ),
                      SizedBox(height: 15),
                      Padding(
                        padding: EdgeInsets.only(left: 2, bottom: 2),
                        child: Text(
                          "ອີເມລ",
                          style: getRegularStyle(color: ColorConstants.white),
                        ),
                      ),
                      TextFormField(
                        controller: _emailController,
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
                          hintText: "ອີເມລ",
                          hintStyle:
                              getRegularStyle(color: ColorConstants.lightGrey),
                          errorBorder: OutlineInputBorder(
                            borderRadius: BorderRadius.circular(6),
                            borderSide: BorderSide(
                                width: 1, color: ColorConstants.danger),
                          ),
                          errorStyle:
                              getRegularStyle(color: ColorConstants.danger),
                          contentPadding:
                              EdgeInsets.symmetric(vertical: 0, horizontal: 10),
                        ),
                        style: getRegularStyle(color: ColorConstants.white),
                      ),
                      SizedBox(height: 15),
                      Padding(
                        padding: EdgeInsets.only(left: 2, bottom: 2),
                        child: Text(
                          "ລະຫັດຜ່ານ",
                          style: getRegularStyle(color: ColorConstants.white),
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
                            errorStyle:
                                getRegularStyle(color: ColorConstants.danger),
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
                      SizedBox(height: 15),
                      Padding(
                        padding: EdgeInsets.only(left: 2, bottom: 2),
                        child: Text(
                          "ຢືນຢັນລະຫັດຜ່ານ",
                          style: getRegularStyle(color: ColorConstants.white),
                        ),
                      ),
                      TextFormField(
                        controller: _confirmPasswordController,
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
                            hintText: "ຢືນຢັນລະຫັດຜ່ານ",
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
                          if (_confirmPasswordController.text.isEmpty ||
                              _confirmPasswordController.text == "") {
                            return "ກະລຸນາປ້ອນລະຫັດຢືນຢັນ";
                          }
                          return null;
                        },
                      ),
                      SizedBox(height: 15),
                    ],
                  ),
                ),
              ),
            ),
            SafeArea(
              child: InkWell(
                onTap: () {
                  if (_formKey.currentState!.validate()) {
                    Navigator.push(context,
                        MaterialPageRoute(builder: (context) => HomePage()));
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
                        Icon(
                          Icons.check_circle_outline_rounded,
                          color: ColorConstants.black,
                          size: 25,
                        ),
                        SizedBox(width: 10),
                        Text(
                          "ບັນທຶກ",
                          style: getBoldStyle(color: ColorConstants.black),
                        ),
                      ],
                    ),
                  ),
                ),
              ),
            ),
          ],
        ),
      ),
    );
  }
}
