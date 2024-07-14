import 'package:bounchan_hotel_member_app/constants/colors.dart';
import 'package:bounchan_hotel_member_app/constants/fonts.dart';
import 'package:bounchan_hotel_member_app/constants/styles.dart';
import 'package:bounchan_hotel_member_app/models/bookModel.dart';
import 'package:bounchan_hotel_member_app/services/bookService.dart';
import 'package:flutter/material.dart';
import 'package:intl/intl.dart';
import 'package:qr_flutter/qr_flutter.dart';

class HistoryBookDetailPage extends StatefulWidget {
  const HistoryBookDetailPage({super.key, required this.id});
  final String id;

  @override
  State<HistoryBookDetailPage> createState() => _HistoryBookDetailPageState();
}

class _HistoryBookDetailPageState extends State<HistoryBookDetailPage> {
  BookModel? _bookModel;
  Future getBookDetail() async {
    _bookModel = await getBookService(id: widget.id);
    setState(() {});
  }

  @override
  void initState() {
    super.initState();
    getBookDetail();
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      backgroundColor: ColorConstants.black,
      appBar: AppBar(
        title: Text("ໃບບິນ"),
      ),
      body: _bookModel == null
          ? Center(
              child: CircularProgressIndicator(
                color: ColorConstants.white,
                backgroundColor: ColorConstants.primary,
              ),
            )
          : Container(
              width: double.infinity,
              height: double.infinity,
              padding: EdgeInsets.only(bottom: 10),
              decoration: BoxDecoration(
                  image: DecorationImage(
                      image: AssetImage("assets/images/bg_success.png"),
                      fit: BoxFit.cover)),
              child: SingleChildScrollView(
                child: Column(
                  crossAxisAlignment: CrossAxisAlignment.center,
                  children: [
                    Container(
                      height: 80,
                      width: 80,
                      decoration: BoxDecoration(
                          image: DecorationImage(
                              image: AssetImage("assets/images/logo.png"),
                              fit: BoxFit.cover)),
                    ),
                    Wrap(
                      alignment: WrapAlignment.spaceBetween,
                      crossAxisAlignment: WrapCrossAlignment.center,
                      children: [
                        Text(
                            "${DateTime.parse(_bookModel!.result!.createdAt!).toLocal().toString().substring(0, 10)}",
                            style: getRegularStyle(
                                fontSize: FontSizes.s14,
                                color: ColorConstants.black)),
                        SizedBox(width: 10),
                        Container(
                          height: 50,
                          width: 120,
                          decoration: BoxDecoration(
                              border: Border.all(
                                  width: 2, color: ColorConstants.success),
                              borderRadius: BorderRadius.circular(25)),
                          child: Center(
                            child: Text("ຈອງສຳເລັດ",
                                style: getBoldStyle(
                                    fontSize: FontSizes.s18,
                                    color: ColorConstants.success)),
                          ),
                        ),
                        SizedBox(width: 10),
                        Padding(
                          padding: const EdgeInsets.only(right: 20),
                          child: Text(
                              "${DateTime.parse(_bookModel!.result!.createdAt!).toLocal().toString().substring(11, 19)}",
                              style: getRegularStyle(
                                  fontSize: FontSizes.s14,
                                  color: ColorConstants.black)),
                        ),
                      ],
                    ),
                    SizedBox(height: 10),
                    Text("ເລກບິນ: ${_bookModel!.result!.billNo}",
                        style: getRegularStyle(
                            fontSize: FontSizes.s16,
                            color: ColorConstants.black)),
                    SizedBox(height: 10),
                    Text(
                        _bookModel!.result!.status == 1
                            ? " ລໍຖ້າແຈ້ງເຂົ້າ"
                            : _bookModel!.result!.status == 2
                                ? " ລໍຖ້າແຈ້ງອອກ"
                                : _bookModel!.result!.status == 3
                                    ? " ແຈ້ງອອກແລ້ວ"
                                    : " ຍົກເລີກການຈອງ",
                        style: getBoldStyle(
                          fontSize: FontSizes.s18,
                          color: _bookModel!.result!.status == 1
                              ? ColorConstants.info
                              : _bookModel!.result!.status == 2
                                  ? ColorConstants.success
                                  : _bookModel!.result!.status == 3
                                      ? ColorConstants.primary
                                      : ColorConstants.error,
                        )),
                    SizedBox(height: 20),
                    Wrap(
                      alignment: WrapAlignment.spaceBetween,
                      crossAxisAlignment: WrapCrossAlignment.end,
                      children: [
                        Column(
                          children: [
                            Text("ວັນທີ່ແຈ້ງເຂົ້າ",
                                style: getRegularStyle(
                                    fontSize: FontSizes.s12,
                                    color: ColorConstants.darkGrey)),
                            Text(
                                "${_bookModel!.result!.checkInDate!.substring(0, 10)}",
                                style: getBoldStyle(
                                    fontSize: FontSizes.s18,
                                    color: ColorConstants.danger)),
                          ],
                        ),
                        SizedBox(width: 35),
                        Icon(
                          Icons.arrow_right_alt_rounded,
                          color: ColorConstants.black,
                          size: 40,
                        ),
                        SizedBox(width: 35),
                        Column(
                          children: [
                            Text("ວັນທີ່ແຈ້ງອອກ",
                                style: getRegularStyle(
                                    fontSize: FontSizes.s12,
                                    color: ColorConstants.darkGrey)),
                            Text(
                                "${_bookModel!.result!.checkOutDate!.substring(0, 10)}",
                                style: getBoldStyle(
                                    fontSize: FontSizes.s18,
                                    color: ColorConstants.danger)),
                          ],
                        ),
                      ],
                    ),
                    // SizedBox(height: 5),
                    Padding(
                      padding: const EdgeInsets.symmetric(
                          vertical: 0, horizontal: 20),
                      child: DataTable(
                        headingRowHeight: 40,
                        dataRowHeight: 40,
                        border: TableBorder.all(
                            width: 0.5, color: ColorConstants.darkGrey),
                        columnSpacing: 50,
                        columns: [
                          DataColumn(
                            label: Text('ລຳດັບ',
                                style:
                                    getBoldStyle(color: ColorConstants.black)),
                            numeric: true,
                          ),
                          DataColumn(
                            label: Text('ເບີຫ້ອງ',
                                style:
                                    getBoldStyle(color: ColorConstants.black)),
                          ),
                          DataColumn(
                            label: Text('ລາຄາ',
                                style:
                                    getBoldStyle(color: ColorConstants.black)),
                            numeric: true,
                          ),
                        ],
                        rows: [
                          for (int i = 0;
                              i < _bookModel!.result!.bookDetails!.length;
                              i++)
                            DataRow(
                              cells: [
                                DataCell(Text('${i + 1}',
                                    style: getRegularStyle(
                                        color: ColorConstants.black))),
                                DataCell(Text(
                                    'ຫ້ອງເບີ: ${_bookModel!.result!.bookDetails![i].roomNo!}',
                                    style: getRegularStyle(
                                      color: ColorConstants.black,
                                    ))),
                                DataCell(Text(
                                    '${NumberFormat("#,### ກີບ").format(_bookModel!.result!.bookDetails![i].price ?? 0)}',
                                    style: getRegularStyle(
                                        color: ColorConstants.black))),
                              ],
                            )
                        ],
                      ),
                    ),
                    SizedBox(height: 20),
                    Wrap(
                      alignment: WrapAlignment.center,
                      children: [
                        Text("ລວມທັງໝົດ:",
                            style: getBoldStyle(
                                fontSize: FontSizes.s18,
                                color: ColorConstants.black)),
                        SizedBox(width: 20),
                        Text(
                            "${NumberFormat("#,### ກີບ").format(_bookModel!.result!.amount ?? 0)}",
                            style: getBoldStyle(
                                fontSize: FontSizes.s18,
                                color: ColorConstants.danger)),
                      ],
                    ),
                    SizedBox(height: 40),
                    Container(
                      decoration: BoxDecoration(
                          border: Border.all(
                              width: 3, color: ColorConstants.success),
                          borderRadius: BorderRadius.circular(6)),
                      child: QrImageView(
                        data: "${_bookModel!.result!.id}",
                        version: QrVersions.auto,
                        size: 260.0,
                      ),
                    )
                  ],
                ),
              ),
            ),
    );
  }
}
