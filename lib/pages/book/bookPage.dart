import 'package:bounchan_hotel_member_app/constants/colors.dart';
import 'package:bounchan_hotel_member_app/constants/fonts.dart';
import 'package:bounchan_hotel_member_app/constants/styles.dart';
import 'package:flutter/material.dart';
import 'package:intl/intl.dart';

class BookPage extends StatefulWidget {
  const BookPage({super.key});

  @override
  State<BookPage> createState() => _BookPageState();
}

class _BookPageState extends State<BookPage> {
  final _checkInDateController = TextEditingController();
  final _checkOutDateController = TextEditingController();
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      backgroundColor: ColorConstants.black,
      appBar: AppBar(
        title: Text("ຈອງຫ້ອງ"),
      ),
      body: Container(
        width: double.infinity,
        height: double.infinity,
        color: ColorConstants.black,
        padding: EdgeInsets.only(bottom: 1),
        child: SingleChildScrollView(
          child: Column(
            crossAxisAlignment: CrossAxisAlignment.start,
            children: [
              SizedBox(height: 10),
              Padding(
                padding: const EdgeInsets.all(5),
                child: Row(
                  children: [
                    SizedBox(
                      width: MediaQuery.of(context).size.width / 2 - 15,
                      child: Column(
                        crossAxisAlignment: CrossAxisAlignment.start,
                        children: [
                          Padding(
                            padding: EdgeInsets.only(left: 2, bottom: 2),
                            child: Text(
                              "ວັນທີ່ແຈ້ງເຂົ້າ",
                              style:
                                  getRegularStyle(color: ColorConstants.white),
                            ),
                          ),
                          TextFormField(
                            controller: _checkInDateController,
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
                              hintText: "yyyy-MM-dd",
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
                                onTap: () {},
                                child: Icon(
                                  Icons.date_range,
                                  color: ColorConstants.primary,
                                ),
                              ),
                            ),
                            readOnly: true,
                            style: getRegularStyle(color: ColorConstants.white),
                            validator: (value) {
                              if (_checkInDateController.text.isEmpty ||
                                  _checkInDateController.text == "") {
                                return "ກະລຸນາເລືອກວັນທີ່ແຈ້ງເຂົ້າ";
                              }
                              return null;
                            },
                          ),
                        ],
                      ),
                    ),
                    SizedBox(width: 20),
                    SizedBox(
                      width: MediaQuery.of(context).size.width / 2 - 15,
                      child: Column(
                        crossAxisAlignment: CrossAxisAlignment.start,
                        children: [
                          Padding(
                            padding: EdgeInsets.only(left: 2, bottom: 2),
                            child: Text(
                              "ວັນທີ່ແຈ້ງອອກ",
                              style:
                                  getRegularStyle(color: ColorConstants.white),
                            ),
                          ),
                          TextFormField(
                            controller: _checkOutDateController,
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
                              hintText: "yyyy-MM-dd",
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
                                onTap: () {},
                                child: Icon(
                                  Icons.date_range,
                                  color: ColorConstants.primary,
                                ),
                              ),
                            ),
                            readOnly: true,
                            style: getRegularStyle(color: ColorConstants.white),
                            validator: (value) {
                              if (_checkOutDateController.text.isEmpty ||
                                  _checkOutDateController.text == "") {
                                return "ກະລຸນາເລືອກວັນທີ່ແຈ້ງອອກ";
                              }
                              return null;
                            },
                          ),
                        ],
                      ),
                    ),
                  ],
                ),
              ),
              SizedBox(height: 10),
              Padding(
                padding: EdgeInsets.symmetric(horizontal: 5, vertical: 5),
                child: Text(
                  "ຫ້ອງນອນຕຽງດ່ຽວ",
                  style: getRegularStyle(color: ColorConstants.white),
                ),
              ),
              Padding(
                padding: const EdgeInsets.symmetric(horizontal: 5, vertical: 0),
                child: SizedBox(
                  height: 245,
                  child: ListView.builder(
                    itemCount: 10,
                    shrinkWrap: true,
                    scrollDirection: Axis.horizontal,
                    itemBuilder: (context, index) {
                      return Padding(
                        padding: EdgeInsets.only(
                            left: index == 0 ? 0 : 3,
                            right: index == 9 ? 0 : 3),
                        child: Container(
                          decoration: BoxDecoration(
                              color: ColorConstants.primary,
                              borderRadius: BorderRadius.circular(6)),
                          child: Column(
                            crossAxisAlignment: CrossAxisAlignment.start,
                            children: [
                              Stack(
                                children: [
                                  Container(
                                    height: 180,
                                    width: 180,
                                    decoration: BoxDecoration(
                                      borderRadius: BorderRadius.only(
                                          topLeft: Radius.circular(6),
                                          topRight: Radius.circular(6)),
                                      image: DecorationImage(
                                        image: NetworkImage(
                                            "https://media.istockphoto.com/id/1365561421/photo/brown-wooden-bed-with-linens-isolated-on-white-background.jpg?s=612x612&w=0&k=20&c=PimPm6zp-jyIm0gj6sUGFitPxl3Upt1WQ5Ew_ztGHHY="),
                                        fit: BoxFit.cover,
                                      ),
                                    ),
                                  ),
                                  Positioned(
                                    top: 2,
                                    right: 2,
                                    child: Icon(
                                      Icons.circle_outlined,
                                      color: ColorConstants.black,
                                      size: 30,
                                    ),
                                  )
                                ],
                              ),
                              SizedBox(
                                width: 180,
                                child: Padding(
                                  padding: const EdgeInsets.symmetric(
                                      horizontal: 5, vertical: 5),
                                  child: Row(
                                    mainAxisAlignment:
                                        MainAxisAlignment.spaceBetween,
                                    children: [
                                      Text(
                                        "ຫ້ອງເບີ: ${index + 1}",
                                        style: getRegularStyle(
                                            color: ColorConstants.black),
                                      ),
                                      SizedBox(width: 20),
                                      Container(
                                        height: 25,
                                        width: 50,
                                        decoration: BoxDecoration(
                                            color: ColorConstants.success,
                                            borderRadius:
                                                BorderRadius.circular(12)),
                                        child: Center(
                                          child: Text(
                                            "ຫວ່າງ",
                                            style: getRegularStyle(),
                                          ),
                                        ),
                                      ),
                                    ],
                                  ),
                                ),
                              ),
                              Padding(
                                padding: const EdgeInsets.symmetric(
                                    horizontal: 5, vertical: 0),
                                child: Wrap(
                                  children: [
                                    Text(
                                      "ລາຄາ: ",
                                      style: getRegularStyle(
                                          color: ColorConstants.black,
                                          fontSize: FontSizes.s16),
                                    ),
                                    Text(
                                      "${NumberFormat("#,###.## ກີບ").format(100000)}",
                                      style: getBoldStyle(
                                          color: ColorConstants.error,
                                          fontSize: FontSizes.s16),
                                    ),
                                  ],
                                ),
                              ),
                            ],
                          ),
                        ),
                      );
                    },
                  ),
                ),
              ),
              SizedBox(height: 10),
              Padding(
                padding: EdgeInsets.symmetric(horizontal: 5, vertical: 5),
                child: Text(
                  "ຫ້ອງນອນຕຽງຄູ່",
                  style: getRegularStyle(color: ColorConstants.white),
                ),
              ),
              Padding(
                padding: const EdgeInsets.symmetric(horizontal: 5, vertical: 0),
                child: SizedBox(
                  height: 245,
                  child: ListView.builder(
                    itemCount: 10,
                    shrinkWrap: true,
                    scrollDirection: Axis.horizontal,
                    itemBuilder: (context, index) {
                      return Padding(
                        padding: EdgeInsets.only(
                            left: index == 0 ? 0 : 3,
                            right: index == 9 ? 0 : 3),
                        child: Container(
                          decoration: BoxDecoration(
                              color: ColorConstants.primary,
                              borderRadius: BorderRadius.circular(6)),
                          child: Column(
                            crossAxisAlignment: CrossAxisAlignment.start,
                            children: [
                              Stack(
                                children: [
                                  Container(
                                    height: 180,
                                    width: 180,
                                    decoration: BoxDecoration(
                                      borderRadius: BorderRadius.only(
                                          topLeft: Radius.circular(6),
                                          topRight: Radius.circular(6)),
                                      image: DecorationImage(
                                        image: NetworkImage(
                                            "https://media.istockphoto.com/id/1365561421/photo/brown-wooden-bed-with-linens-isolated-on-white-background.jpg?s=612x612&w=0&k=20&c=PimPm6zp-jyIm0gj6sUGFitPxl3Upt1WQ5Ew_ztGHHY="),
                                        fit: BoxFit.cover,
                                      ),
                                    ),
                                  ),
                                  Positioned(
                                    top: 2,
                                    right: 2,
                                    child: Icon(
                                      Icons.circle_outlined,
                                      color: ColorConstants.black,
                                      size: 30,
                                    ),
                                  )
                                ],
                              ),
                              SizedBox(
                                width: 180,
                                child: Padding(
                                  padding: const EdgeInsets.symmetric(
                                      horizontal: 5, vertical: 5),
                                  child: Row(
                                    mainAxisAlignment:
                                        MainAxisAlignment.spaceBetween,
                                    children: [
                                      Text(
                                        "ຫ້ອງເບີ: ${index + 11}",
                                        style: getRegularStyle(
                                            color: ColorConstants.black),
                                      ),
                                      SizedBox(width: 20),
                                      Container(
                                        height: 25,
                                        width: 50,
                                        decoration: BoxDecoration(
                                            color: ColorConstants.success,
                                            borderRadius:
                                                BorderRadius.circular(12)),
                                        child: Center(
                                          child: Text(
                                            "ຫວ່າງ",
                                            style: getRegularStyle(),
                                          ),
                                        ),
                                      ),
                                    ],
                                  ),
                                ),
                              ),
                              Padding(
                                padding: const EdgeInsets.symmetric(
                                    horizontal: 5, vertical: 0),
                                child: Wrap(
                                  children: [
                                    Text(
                                      "ລາຄາ: ",
                                      style: getRegularStyle(
                                          color: ColorConstants.black,
                                          fontSize: FontSizes.s16),
                                    ),
                                    Text(
                                      "${NumberFormat("#,###.## ກີບ").format(100000)}",
                                      style: getBoldStyle(
                                          color: ColorConstants.error,
                                          fontSize: FontSizes.s16),
                                    ),
                                  ],
                                ),
                              ),
                            ],
                          ),
                        ),
                      );
                    },
                  ),
                ),
              ),
              SizedBox(height: 10),
            ],
          ),
        ),
      ),
      bottomNavigationBar: Container(
        width: MediaQuery.of(context).size.width,
        height: 60,
        decoration: BoxDecoration(
          color: ColorConstants.primary,
          borderRadius: BorderRadius.only(
              topLeft: Radius.circular(10), topRight: Radius.circular(10)),
        ),
        child: Row(
          mainAxisAlignment: MainAxisAlignment.spaceAround,
          children: [
            Expanded(
              child: SizedBox(
                height: 60,
                width: MediaQuery.of(context).size.width / 2 - 1,
                child: InkWell(
                  onTap: () {
                    // Navigator.push(
                    //   context,
                    //   MaterialPageRoute(builder: (context) => RoomAddPage()),
                    // );
                  },
                  borderRadius: BorderRadius.only(topLeft: Radius.circular(10)),
                  child: Row(
                    mainAxisAlignment: MainAxisAlignment.center,
                    children: [
                      Icon(
                        Icons.check_circle_outline_rounded,
                        size: 25,
                      ),
                      SizedBox(width: 10),
                      Text(
                        "ບັນທຶກ",
                        style: getBoldStyle(
                          color: ColorConstants.black,
                          fontSize: FontSizes.s18,
                        ),
                      )
                    ],
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
