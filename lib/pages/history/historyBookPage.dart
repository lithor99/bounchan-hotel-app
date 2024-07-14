import 'package:bounchan_hotel_member_app/constants/colors.dart';
import 'package:bounchan_hotel_member_app/constants/fonts.dart';
import 'package:bounchan_hotel_member_app/constants/styles.dart';
import 'package:bounchan_hotel_member_app/models/booksModel.dart';
import 'package:bounchan_hotel_member_app/pages/history/historyBookDetailPage.dart';
import 'package:bounchan_hotel_member_app/services/bookService.dart';
import 'package:flutter/material.dart';

class HistoryBookPage extends StatefulWidget {
  const HistoryBookPage({super.key});

  @override
  State<HistoryBookPage> createState() => _HistoryBookPageState();
}

class _HistoryBookPageState extends State<HistoryBookPage> {
  BooksModel? _booksModel;
  Future getBooks() async {
    _booksModel = await getBooksService();
    setState(() {});
  }

  @override
  void initState() {
    super.initState();
    getBooks();
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      backgroundColor: ColorConstants.black,
      appBar: AppBar(
        title: Text("ປະຫວັດການຈອງ"),
      ),
      body: _booksModel == null
          ? Center(
              child: CircularProgressIndicator(
                color: ColorConstants.white,
                backgroundColor: ColorConstants.primary,
              ),
            )
          : _booksModel!.result!.rows!.isEmpty
              ? Center(
                  child: Text(
                    "ບໍ່ມີຂໍ້ມູນ",
                    style: getBoldStyle(fontSize: FontSizes.s20),
                  ),
                )
              : Padding(
                  padding: const EdgeInsets.symmetric(horizontal: 10),
                  child: ListView.builder(
                    itemCount: _booksModel!.result!.rows!.length,
                    itemBuilder: (context, index) {
                      return InkWell(
                        onTap: () {
                          Navigator.push(
                            context,
                            MaterialPageRoute(
                                builder: (context) => HistoryBookDetailPage(
                                    id: _booksModel!.result!.rows![index].id!)),
                          );
                        },
                        child: Container(
                          padding: EdgeInsets.symmetric(vertical: 10),
                          width: double.infinity,
                          decoration: BoxDecoration(
                              border: Border(
                                  top: index == 0
                                      ? BorderSide(
                                          color: ColorConstants.lightGrey,
                                          width: 0.3)
                                      : BorderSide.none,
                                  bottom: BorderSide(
                                      color: ColorConstants.lightGrey,
                                      width: 0.3))),
                          child: Row(
                            children: [
                              CircleAvatar(
                                radius: 21,
                                backgroundColor: ColorConstants.black,
                                child: CircleAvatar(
                                  radius: 20,
                                  backgroundColor: ColorConstants.primary,
                                  backgroundImage: _booksModel!.result!
                                                  .rows![index].member!.image !=
                                              null &&
                                          _booksModel!.result!.rows![index]
                                                  .member!.image !=
                                              ""
                                      ? NetworkImage(_booksModel!
                                          .result!.rows![index].member!.image!)
                                      : null,
                                  child: _booksModel!.result!.rows![index]
                                                  .member!.image ==
                                              null ||
                                          _booksModel!.result!.rows![index]
                                                  .member!.image ==
                                              ""
                                      ? Icon(
                                          Icons.person,
                                          color: ColorConstants.black,
                                          size: 35,
                                        )
                                      : null,
                                ),
                              ),
                              SizedBox(width: 10),
                              Column(
                                crossAxisAlignment: CrossAxisAlignment.start,
                                children: [
                                  Text(
                                    "${_booksModel!.result!.rows![index].member!.gender == "ຊາຍ" ? "ທ້າວ" : "ນາງ"} "
                                            "${_booksModel!.result!.rows![index].member!.name} "
                                            "${_booksModel!.result!.rows![index].member!.lastName}" +
                                        " | " +
                                        "${_booksModel!.result!.rows![index].createdAt!.substring(0, 10)}",
                                    style: getRegularStyle(
                                        color: ColorConstants.white),
                                  ),
                                  SizedBox(height: 5),
                                  Text(
                                    "ແຈ້ງເຂົ້າ: ${_booksModel!.result!.rows![index].checkInDate!.substring(0, 10)} | ແຈ້ງເຂົ້າ: ${_booksModel!.result!.rows![index].checkOutDate!.substring(0, 10)}",
                                    style: getRegularStyle(
                                        color: ColorConstants.lightGrey,
                                        fontSize: FontSizes.s14),
                                  ),
                                  SizedBox(height: 5),
                                  RichText(
                                    text: TextSpan(
                                        text: "ສະຖານະ: ",
                                        style: getRegularStyle(
                                          color: ColorConstants.lightGrey,
                                          fontSize: FontSizes.s16,
                                        ),
                                        children: [
                                          TextSpan(
                                              text: _booksModel!
                                                          .result!
                                                          .rows![index]
                                                          .status ==
                                                      1
                                                  ? "ລໍຖ້າແຈ້ງເຂົ້າ"
                                                  : _booksModel!
                                                              .result!
                                                              .rows![index]
                                                              .status ==
                                                          2
                                                      ? "ລໍຖ້າແຈ້ງອອກ"
                                                      : _booksModel!
                                                                  .result!
                                                                  .rows![index]
                                                                  .status ==
                                                              3
                                                          ? "ແຈ້ງອອກແລ້ວ"
                                                          : "ຍົກເລີກການຈອງ",
                                              style: getRegularStyle(
                                                color: _booksModel!
                                                            .result!
                                                            .rows![index]
                                                            .status ==
                                                        1
                                                    ? ColorConstants.info
                                                    : _booksModel!
                                                                .result!
                                                                .rows![index]
                                                                .status ==
                                                            2
                                                        ? ColorConstants.success
                                                        : _booksModel!
                                                                    .result!
                                                                    .rows![
                                                                        index]
                                                                    .status ==
                                                                3
                                                            ? ColorConstants
                                                                .black
                                                            : ColorConstants
                                                                .error,
                                                fontSize: FontSizes.s16,
                                              ))
                                        ]),
                                  ),
                                ],
                              ),
                              Spacer(),
                              Icon(
                                Icons.arrow_forward_ios_rounded,
                                color: ColorConstants.primary,
                              ),
                            ],
                          ),
                        ),
                      );
                    },
                  ),
                ),
    );
  }
}
