import 'package:bounchan_hotel_member_app/constants/colors.dart';
import 'package:bounchan_hotel_member_app/constants/fonts.dart';
import 'package:bounchan_hotel_member_app/constants/styles.dart';
import 'package:bounchan_hotel_member_app/pages/book/bookPage.dart';
import 'package:carousel_slider/carousel_slider.dart';
import 'package:flutter/material.dart';
import 'package:intl/intl.dart';

class RoomDetailPage extends StatefulWidget {
  const RoomDetailPage({super.key});

  @override
  State<RoomDetailPage> createState() => _RoomDetailPageState();
}

class _RoomDetailPageState extends State<RoomDetailPage> {
  List<String> images = [
    "https://media.istockphoto.com/id/1365561421/photo/brown-wooden-bed-with-linens-isolated-on-white-background.jpg?s=612x612&w=0&k=20&c=PimPm6zp-jyIm0gj6sUGFitPxl3Upt1WQ5Ew_ztGHHY=",
    "https://media.istockphoto.com/id/1365561421/photo/brown-wooden-bed-with-linens-isolated-on-white-background.jpg?s=612x612&w=0&k=20&c=PimPm6zp-jyIm0gj6sUGFitPxl3Upt1WQ5Ew_ztGHHY=",
    "https://media.istockphoto.com/id/1365561421/photo/brown-wooden-bed-with-linens-isolated-on-white-background.jpg?s=612x612&w=0&k=20&c=PimPm6zp-jyIm0gj6sUGFitPxl3Upt1WQ5Ew_ztGHHY=",
    "https://media.istockphoto.com/id/1365561421/photo/brown-wooden-bed-with-linens-isolated-on-white-background.jpg?s=612x612&w=0&k=20&c=PimPm6zp-jyIm0gj6sUGFitPxl3Upt1WQ5Ew_ztGHHY=",
    "https://media.istockphoto.com/id/1365561421/photo/brown-wooden-bed-with-linens-isolated-on-white-background.jpg?s=612x612&w=0&k=20&c=PimPm6zp-jyIm0gj6sUGFitPxl3Upt1WQ5Ew_ztGHHY=",
  ];
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      backgroundColor: ColorConstants.black,
      appBar: AppBar(
        title: Text("ລາຍລະອຽດຫ້ອງ"),
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
              Container(
                decoration: BoxDecoration(
                    borderRadius: BorderRadius.only(
                        bottomLeft: Radius.circular(10),
                        bottomRight: Radius.circular(10))),
                child: CarouselSlider(
                  options: CarouselOptions(
                    height: 200.0,
                    enlargeCenterPage: true,
                    autoPlay: true,
                    aspectRatio: 16 / 9,
                    autoPlayCurve: Curves.fastOutSlowIn,
                    enableInfiniteScroll: true,
                    autoPlayAnimationDuration: Duration(milliseconds: 800),
                    viewportFraction: 1,
                  ),
                  items: images.map((url) {
                    return Builder(
                      builder: (BuildContext context) {
                        return Container(
                          width: MediaQuery.of(context).size.width,
                          // margin: EdgeInsets.symmetric(horizontal: 0.0),
                          decoration: BoxDecoration(
                              borderRadius: BorderRadius.only(
                                  bottomLeft: Radius.circular(10),
                                  bottomRight: Radius.circular(10)),
                              color: ColorConstants.primary,
                              image: DecorationImage(
                                  image: NetworkImage(url), fit: BoxFit.cover)),
                        );
                      },
                    );
                  }).toList(),
                ),
              ),
              Padding(
                padding: EdgeInsets.only(left: 5, top: 10),
                child: Text(
                  "ຫ້ອງເບີ: 1",
                  style: getBoldStyle(color: ColorConstants.white),
                ),
              ),
              Padding(
                padding: EdgeInsets.only(left: 5, top: 5),
                child: Wrap(
                  children: [
                    Text(
                      "ລາຄາ: ",
                      style: getBoldStyle(fontSize: FontSizes.s16),
                    ),
                    Text(
                      "${NumberFormat("#,###.## ກີບ").format(100000)}",
                      style: getBoldStyle(
                          color: ColorConstants.error, fontSize: FontSizes.s16),
                    ),
                  ],
                ),
              ),
              Padding(
                padding: EdgeInsets.only(left: 5, top: 5),
                child: Wrap(
                  children: [
                    Text(
                      "ສະຖານະ: ",
                      style: getBoldStyle(fontSize: FontSizes.s16),
                    ),
                    Container(
                      height: 25,
                      width: 50,
                      decoration: BoxDecoration(
                          color: ColorConstants.success,
                          borderRadius: BorderRadius.circular(12)),
                      child: Center(
                        child: Text(
                          "ຫວ່າງ",
                          style: getBoldStyle(),
                        ),
                      ),
                    ),
                  ],
                ),
              ),
              Padding(
                padding: EdgeInsets.only(left: 5, top: 5),
                child: Wrap(
                  children: [
                    Text(
                      "ລາຍລະອຽດຫ້ອງ: ",
                      style: getRegularStyle(),
                    ),
                    Text(
                      "The best room is a haven of comfort and style, where natural light pours in through large windows, casting a warm glow across soft, inviting furnishings. It's a space that balances aesthetic appeal",
                      style: getRegularStyle(),
                    ),
                  ],
                ),
              ),
              SizedBox(height: 10),
              Divider(height: 0.2, color: ColorConstants.lightGrey),
              SizedBox(height: 5),
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
                    Navigator.push(
                      context,
                      MaterialPageRoute(builder: (context) => BookPage()),
                    );
                  },
                  borderRadius: BorderRadius.only(topLeft: Radius.circular(10)),
                  child: Row(
                    mainAxisAlignment: MainAxisAlignment.center,
                    children: [
                      Icon(
                        Icons.add_circle_outline,
                        size: 25,
                      ),
                      SizedBox(width: 10),
                      Text(
                        "ຈອງຫ້ອງ",
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
