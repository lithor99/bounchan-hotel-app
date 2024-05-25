import 'package:bounchan_hotel_member_app/constants/colors.dart';
import 'package:bounchan_hotel_member_app/constants/fonts.dart';
import 'package:bounchan_hotel_member_app/constants/styles.dart';
import 'package:bounchan_hotel_member_app/models/roomsModel.dart';
import 'package:bounchan_hotel_member_app/pages/auth/loginPage.dart';
import 'package:bounchan_hotel_member_app/pages/book/bookPage.dart';
import 'package:bounchan_hotel_member_app/pages/history/historyBookPage.dart';
import 'package:bounchan_hotel_member_app/pages/profile/profilePage.dart';
import 'package:bounchan_hotel_member_app/pages/room/roomDetailPage.dart';
import 'package:bounchan_hotel_member_app/services/roomService.dart';
import 'package:bounchan_hotel_member_app/utils/storageManager.dart';
import 'package:bounchan_hotel_member_app/widgets/warningDialogWidget.dart';
import 'package:carousel_slider/carousel_slider.dart';
import 'package:flutter/material.dart';
import 'package:intl/intl.dart';

class HomePage extends StatefulWidget {
  const HomePage({super.key});

  @override
  State<HomePage> createState() => _HomePageState();
}

class _HomePageState extends State<HomePage> {
  final TextEditingController _searchController = TextEditingController();
  List<String> images = [
    "assets/images/banner1.jpg",
    "assets/images/banner2.jpg",
    "assets/images/banner3.png",
    "assets/images/banner4.png",
    "assets/images/banner5.jpg",
  ];

  String? _image;
  String? _name;
  String? _email;
  String? _phoneNumber;
  RoomsModel? _roomsModel;
  Future _readData() async {
    _name = await StorageManager.readData("name");
    _image = await StorageManager.readData("image");
    _email = await StorageManager.readData("email");
    _phoneNumber = await StorageManager.readData("phoneNumber");
    setState(() {});
  }

  Future getRooms({String? search}) async {
    _roomsModel = await getRoomsService(search: search);
    setState(() {});
  }

  @override
  void initState() {
    super.initState();
    _readData();
    getRooms(search: _searchController.text);
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      backgroundColor: ColorConstants.black,
      appBar: AppBar(
        title: Text("ໜ້າຫຼັກ"),
        actions: [
          InkWell(
            borderRadius: BorderRadius.circular(18),
            onTap: () {
              Navigator.push(
                context,
                MaterialPageRoute(builder: (context) => ProfilePage()),
              ).then((value) => _readData());
            },
            child: CircleAvatar(
              radius: 21,
              backgroundColor: ColorConstants.black,
              child: CircleAvatar(
                radius: 20,
                backgroundColor: ColorConstants.primary,
                backgroundImage: _image != null && _image != ""
                    ? NetworkImage(_image!)
                    : null,
                child: _image == null || _image == ""
                    ? Icon(
                        Icons.person,
                        color: ColorConstants.black,
                        size: 35,
                      )
                    : null,
              ),
            ),
          ),
          SizedBox(width: 20)
        ],
      ),
      drawer: Container(
        width: MediaQuery.of(context).size.width * 3 / 4,
        height: double.infinity,
        color: ColorConstants.black,
        child: SingleChildScrollView(
          child: Column(
            children: [
              Padding(
                padding: const EdgeInsets.only(
                    top: 40, left: 10, right: 10, bottom: 10),
                child: Container(
                  height: 100,
                  child: Row(
                    crossAxisAlignment: CrossAxisAlignment.center,
                    children: [
                      InkWell(
                        onTap: () {
                          Navigator.push(
                            context,
                            MaterialPageRoute(
                                builder: (context) => ProfilePage()),
                          ).then((value) => _readData());
                        },
                        child: CircleAvatar(
                          radius: 36,
                          backgroundColor: ColorConstants.primary,
                          child: CircleAvatar(
                            radius: 35,
                            backgroundImage: _image != null && _image != ""
                                ? NetworkImage(_image!)
                                : null,
                            child: _image == null || _image == ""
                                ? Icon(
                                    Icons.person,
                                    color: ColorConstants.black,
                                    size: 50,
                                  )
                                : null,
                          ),
                        ),
                      ),
                      SizedBox(width: 20),
                      Text(
                        "$_name\n$_email\n$_phoneNumber",
                        style: getBoldStyle(
                            fontSize: FontSizes.s14,
                            color: ColorConstants.primary),
                      )
                    ],
                  ),
                ),
              ),
              Divider(
                color: ColorConstants.primary,
                height: 1,
              ),
              ListTile(
                leading: Icon(
                  Icons.person_outline_rounded,
                  color: ColorConstants.primary,
                  size: 30,
                ),
                title: Text(
                  "ຂໍ້ມຸນຜູ້ໃຊ້",
                  style: getRegularStyle(color: ColorConstants.primary),
                ),
                onTap: () {
                  Navigator.push(
                    context,
                    MaterialPageRoute(builder: (context) => ProfilePage()),
                  ).then((value) => _readData());
                },
              ),
              ListTile(
                leading: Icon(
                  Icons.work_history_outlined,
                  color: ColorConstants.primary,
                  size: 30,
                ),
                title: Text(
                  "ປະຫວັດການຈອງ",
                  style: getRegularStyle(color: ColorConstants.primary),
                ),
                onTap: () {
                  Navigator.push(
                    context,
                    MaterialPageRoute(builder: (context) => HistoryBookPage()),
                  );
                },
              ),
              ListTile(
                leading: Icon(
                  Icons.logout_rounded,
                  color: ColorConstants.danger,
                  size: 30,
                ),
                title: Text(
                  "ອອກຈາກລະບົບ",
                  style: getRegularStyle(color: ColorConstants.danger),
                ),
                onTap: () {
                  showDialog(
                    context: context,
                    builder: (context) {
                      return WarningDialogWidget(
                        detail: "ທ່ານຕ້ອງອອກຈາກລະບົບບໍ?",
                        onConfirm: () {
                          StorageManager.deleteData("id");
                          StorageManager.deleteData("name");
                          StorageManager.deleteData("image");
                          StorageManager.deleteData("email");
                          StorageManager.deleteData("phoneNumber");
                          StorageManager.deleteData("token");
                          StorageManager.deleteData("password");
                          Navigator.pushAndRemoveUntil(
                              context,
                              MaterialPageRoute(
                                  builder: (context) => LoginPage()),
                              (route) => false);
                        },
                      );
                    },
                  );
                },
              ),
            ],
          ),
        ),
      ),
      body: _roomsModel == null
          ? Center(
              child: CircularProgressIndicator(
                color: ColorConstants.white,
                backgroundColor: ColorConstants.primary,
              ),
            )
          : _roomsModel!.result!.isEmpty
              ? Center(
                  child: Text(
                    "ບໍ່ມີຂໍ້ມູນ",
                    style: getBoldStyle(fontSize: FontSizes.s20),
                  ),
                )
              : Container(
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
                              autoPlayAnimationDuration:
                                  Duration(milliseconds: 800),
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
                                            bottomLeft: Radius.circular(30),
                                            bottomRight: Radius.circular(30)),
                                        color: ColorConstants.primary,
                                        image: DecorationImage(
                                            image: AssetImage(url),
                                            fit: BoxFit.cover)),
                                  );
                                },
                              );
                            }).toList(),
                          ),
                        ),
                        Padding(
                          padding: const EdgeInsets.only(
                              top: 5, bottom: 0, right: 5, left: 5),
                          child: TextFormField(
                            onChanged: (value) {
                              if (value.isEmpty || value == "") {
                                _searchController.clear();
                                getRooms(search: _searchController.text);
                              }
                            },
                            controller: _searchController,
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
                              hintText: "ຄົ້ນຫາ",
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
                                  vertical: 0, horizontal: 20),
                              suffixIcon: IconButton(
                                onPressed: () {
                                  FocusScope.of(context).unfocus();
                                  getRooms(search: _searchController.text);
                                },
                                icon: Icon(
                                  Icons.search_rounded,
                                  color: ColorConstants.primary,
                                  size: 35,
                                ),
                              ),
                            ),
                            style: getRegularStyle(color: ColorConstants.white),
                          ),
                        ),
                        ListView.builder(
                          itemCount: _roomsModel!.result!.length,
                          shrinkWrap: true,
                          physics: NeverScrollableScrollPhysics(),
                          itemBuilder: (context, index) {
                            if (_roomsModel!.result![index].rooms!.isEmpty) {
                              return SizedBox();
                            }
                            return Column(
                              crossAxisAlignment: CrossAxisAlignment.start,
                              children: [
                                Padding(
                                  padding: EdgeInsets.only(
                                      top: 10, left: 5, right: 5, bottom: 5),
                                  child: Text(
                                    "${_roomsModel!.result![index].roomType!.name}",
                                    style: getBoldStyle(
                                        color: ColorConstants.white),
                                  ),
                                ),
                                Padding(
                                  padding: const EdgeInsets.symmetric(
                                      horizontal: 5, vertical: 0),
                                  child: SizedBox(
                                    height: 260,
                                    child: ListView.builder(
                                      itemCount: _roomsModel!
                                          .result![index].rooms!.length,
                                      shrinkWrap: true,
                                      scrollDirection: Axis.horizontal,
                                      itemBuilder: (context, i) {
                                        return Padding(
                                          padding: EdgeInsets.only(
                                              left: i == 0 ? 0 : 3,
                                              right: i == 9 ? 0 : 3),
                                          child: InkWell(
                                            onTap: () {
                                              Navigator.push(
                                                context,
                                                MaterialPageRoute(
                                                    builder: (context) =>
                                                        RoomDetailPage(
                                                          id: _roomsModel!
                                                              .result![index]
                                                              .rooms![i]
                                                              .id!,
                                                          roomTypeId:
                                                              _roomsModel!
                                                                  .result![
                                                                      index]
                                                                  .rooms![i]
                                                                  .roomType!
                                                                  .id!,
                                                          roomType: _roomsModel!
                                                              .result![index]
                                                              .rooms![i]
                                                              .roomType!
                                                              .name!,
                                                        )),
                                              );
                                            },
                                            child: Container(
                                              decoration: BoxDecoration(
                                                  color: ColorConstants.primary,
                                                  borderRadius:
                                                      BorderRadius.circular(6)),
                                              child: Column(
                                                crossAxisAlignment:
                                                    CrossAxisAlignment.start,
                                                children: [
                                                  Container(
                                                    height: 180,
                                                    width: 180,
                                                    decoration: BoxDecoration(
                                                      borderRadius:
                                                          BorderRadius.only(
                                                              topLeft: Radius
                                                                  .circular(6),
                                                              topRight: Radius
                                                                  .circular(6)),
                                                      image: DecorationImage(
                                                        image: NetworkImage(
                                                            "${_roomsModel!.result![index].rooms![i].roomImages![0].image}"),
                                                        fit: BoxFit.cover,
                                                      ),
                                                    ),
                                                  ),
                                                  SizedBox(
                                                    width: 180,
                                                    child: Padding(
                                                      padding: const EdgeInsets
                                                              .symmetric(
                                                          horizontal: 5,
                                                          vertical: 5),
                                                      child: Row(
                                                        mainAxisAlignment:
                                                            MainAxisAlignment
                                                                .spaceBetween,
                                                        children: [
                                                          Text(
                                                            "ຫ້ອງເບີ: ${_roomsModel!.result![index].rooms![i].roomNo}",
                                                            style: getBoldStyle(
                                                                color:
                                                                    ColorConstants
                                                                        .black),
                                                          ),
                                                          SizedBox(width: 20),
                                                          Container(
                                                            height: 25,
                                                            width: 50,
                                                            decoration: BoxDecoration(
                                                                color: _roomsModel!
                                                                            .result![
                                                                                index]
                                                                            .rooms![
                                                                                i]
                                                                            .status ==
                                                                        3
                                                                    ? ColorConstants
                                                                        .danger
                                                                    : ColorConstants
                                                                        .success,
                                                                borderRadius:
                                                                    BorderRadius
                                                                        .circular(
                                                                            12)),
                                                            child: Center(
                                                              child: Text(
                                                                _roomsModel!
                                                                            .result![index]
                                                                            .rooms![i]
                                                                            .status ==
                                                                        3
                                                                    ? "ບໍ່ຫວ່າງ"
                                                                    : "ຫວ່າງ",
                                                                style:
                                                                    getRegularStyle(),
                                                              ),
                                                            ),
                                                          ),
                                                        ],
                                                      ),
                                                    ),
                                                  ),
                                                  Padding(
                                                    padding: const EdgeInsets
                                                            .symmetric(
                                                        horizontal: 5,
                                                        vertical: 0),
                                                    child: Wrap(
                                                      children: [
                                                        Text(
                                                          "ລາຄາ: ",
                                                          style: getRegularStyle(
                                                              color:
                                                                  ColorConstants
                                                                      .black,
                                                              fontSize:
                                                                  FontSizes
                                                                      .s16),
                                                        ),
                                                        Text(
                                                          "${NumberFormat("#,###.## ກີບ").format(_roomsModel!.result![index].rooms![i].price ?? 0)}",
                                                          style: getBoldStyle(
                                                              color:
                                                                  ColorConstants
                                                                      .error,
                                                              fontSize:
                                                                  FontSizes
                                                                      .s16),
                                                        ),
                                                      ],
                                                    ),
                                                  ),
                                                  Padding(
                                                    padding: const EdgeInsets
                                                            .symmetric(
                                                        horizontal: 5,
                                                        vertical: 0),
                                                    child: Text(
                                                      "${_roomsModel!.result![index].rooms![i].description.toString().length > 20 ? _roomsModel!.result![index].rooms![i].description.toString().substring(0, 25) + '...' : _roomsModel!.result![index].rooms![i].description.toString()}",
                                                      style: getRegularStyle(
                                                          color: ColorConstants
                                                              .darkGrey,
                                                          fontSize:
                                                              FontSizes.s12),
                                                      maxLines: 1,
                                                    ),
                                                  ),
                                                ],
                                              ),
                                            ),
                                          ),
                                        );
                                      },
                                    ),
                                  ),
                                ),
                              ],
                            );
                          },
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
