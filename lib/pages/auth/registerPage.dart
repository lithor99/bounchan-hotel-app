import 'dart:io';
import 'package:bounchan_hotel_member_app/constants/colors.dart';
import 'package:bounchan_hotel_member_app/constants/fonts.dart';
import 'package:bounchan_hotel_member_app/constants/styles.dart';
import 'package:bounchan_hotel_member_app/models/uploadModel.dart';
import 'package:bounchan_hotel_member_app/pages/auth/loginPage.dart';
import 'package:bounchan_hotel_member_app/services/memberService.dart';
import 'package:bounchan_hotel_member_app/widgets/errorDialogWidget.dart';
import 'package:bounchan_hotel_member_app/widgets/loadingDialogWidget.dart';
import 'package:bounchan_hotel_member_app/widgets/succesDialogWidget.dart';
import 'package:flutter/material.dart';
import 'package:image_cropper/image_cropper.dart';
import 'package:image_picker/image_picker.dart';

class RegisterPage extends StatefulWidget {
  const RegisterPage({super.key, required this.email});
  final String email;

  @override
  State<RegisterPage> createState() => _RegisterPageState();
}

class _RegisterPageState extends State<RegisterPage> {
  final _formKey = GlobalKey<FormState>();
  final _loadingKey = GlobalKey<State>();
  final _nameController = TextEditingController();
  final _lastNameController = TextEditingController();
  final _phoneNumberController = TextEditingController();
  final _emailController = TextEditingController();
  final _passwordController = TextEditingController();
  final _confirmPasswordController = TextEditingController();
  bool _showPassword = false;
  String _gender = "";
  String? _image;
  CroppedFile? _croppedFile;

  Future<void> _onTakeImage() async {
    XFile? fileImage = await ImagePicker().pickImage(
        source: ImageSource.camera,
        preferredCameraDevice: CameraDevice.rear,
        imageQuality: 20);
    if (fileImage != null) {
      _croppedFile = await ImageCropper().cropImage(
        cropStyle: CropStyle.rectangle,
        sourcePath: fileImage.path,
        compressQuality: 20,
        aspectRatioPresets: [
          CropAspectRatioPreset.square,
        ],
        uiSettings: [
          AndroidUiSettings(
              toolbarTitle: '',
              toolbarColor: ColorConstants.primary,
              toolbarWidgetColor: ColorConstants.white,
              initAspectRatio: CropAspectRatioPreset.square,
              lockAspectRatio: false),
          IOSUiSettings(
              title: '',
              aspectRatioPickerButtonHidden: true,
              resetButtonHidden: true),
        ],
      );
      setState(() {});
    }
  }

  @override
  void initState() {
    super.initState();
    setState(() {
      _emailController.text = widget.email;
    });
  }

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
                            backgroundImage:
                                _croppedFile != null && _croppedFile != ""
                                    ? FileImage(File(_croppedFile!.path))
                                    : null,
                            child: _croppedFile == null || _croppedFile == ""
                                ? Icon(
                                    Icons.person,
                                    color: ColorConstants.black,
                                    size: 50,
                                  )
                                : null,
                          ),
                        ),
                      ),
                      Center(
                        child: IconButton(
                            onPressed: () {
                              _onTakeImage();
                            },
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
                      // SizedBox(height: 15),
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
                        readOnly: true,
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
                          } else if (_passwordController.text !=
                              _confirmPasswordController.text) {
                            return "ລະຫັດຜ່ານບໍ່ຄືກັນ";
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
                onTap: () async {
                  if (_formKey.currentState!.validate()) {
                    LoadingDialogWidget.showLoading(context, _loadingKey);
                    if (_croppedFile != null) {
                      UploadModel? uploadModel = await uploadFileService(
                          file: File(_croppedFile!.path));
                      if (uploadModel!.url != null) {
                        _image = uploadModel.url;
                      }
                      String result = await registerService(
                        name: _nameController.text,
                        lastName: _lastNameController.text,
                        phoneNumber: _phoneNumberController.text,
                        email: _emailController.text,
                        password: _passwordController.text,
                        gender: _gender,
                        image: _image!,
                      );
                      Navigator.of(_loadingKey.currentContext!,
                              rootNavigator: true)
                          .pop();
                      if (result == "success") {
                        await showDialog(
                          context: context,
                          builder: (context) {
                            return SuccessDialogWidget(
                              detail: "ລົງທະບຽນສຳເລັດ",
                            );
                          },
                        );

                        Navigator.pushAndRemoveUntil(
                            context,
                            MaterialPageRoute(
                                builder: (context) => LoginPage()),
                            (route) => false);
                      } else {
                        showDialog(
                          context: context,
                          builder: (context) {
                            return ErrorDialogWidget(
                              detail: "ເກີດຂໍ້ຜິດພາດ",
                            );
                          },
                        );
                      }
                    } else {
                      String result = await registerService(
                        name: _nameController.text,
                        lastName: _lastNameController.text,
                        phoneNumber: _phoneNumberController.text,
                        email: _emailController.text,
                        password: _passwordController.text,
                        gender: _gender,
                      );
                      Navigator.of(_loadingKey.currentContext!,
                              rootNavigator: true)
                          .pop();
                      if (result == "success") {
                        showDialog(
                          context: context,
                          builder: (context) {
                            return SuccessDialogWidget(
                              detail: "ລົງທະບຽນສຳເລັດ",
                            );
                          },
                        );
                        Navigator.pushAndRemoveUntil(
                            context,
                            MaterialPageRoute(
                                builder: (context) => LoginPage()),
                            (route) => false);
                      } else {
                        showDialog(
                          context: context,
                          builder: (context) {
                            return ErrorDialogWidget(
                              detail: "ເກີດຂໍ້ຜິດພາດ",
                            );
                          },
                        );
                      }
                    }
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
                          style: getRegularStyle(
                              color: ColorConstants.black,
                              fontSize: FontSizes.s16),
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
