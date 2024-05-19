import 'package:bounchan_hotel_member_app/constants/string.dart';
import 'package:bounchan_hotel_member_app/models/bookBodyModel.dart';
import 'package:bounchan_hotel_member_app/models/bookModel.dart';
import 'package:bounchan_hotel_member_app/models/bookResponseModel.dart';
import 'package:bounchan_hotel_member_app/models/booksModel.dart';
import 'package:bounchan_hotel_member_app/utils/storageManager.dart';
import 'package:http/http.dart' as http;
import 'dart:convert';

//create book
Future<BookResponseModel?> bookService({
  required BookBodyModel bookBodyModel,
  String? image,
}) async {
  String url = "${BASE_URL}/book";
  List<Map<String, dynamic>> rooms = [];
  for (int i = 0; i < bookBodyModel.item!.rooms!.length; i++) {
    rooms.add({
      "roomId": bookBodyModel.item!.rooms![i].roomId,
      "price": bookBodyModel.item!.rooms![i].price,
    });
  }
  Map body = {
    "item": {
      "checkInDate": bookBodyModel.item!.checkInDate,
      "checkOutDate": bookBodyModel.item!.checkOutDate,
      "amount": bookBodyModel.item!.amount,
      "rooms": rooms
    }
  };
  print(body);
  try {
    String token = await StorageManager.readData("token");
    var response = await http.post(
      Uri.parse(url),
      headers: {
        'Content-Type': 'application/json',
        'Authorization': 'Bearer $token'
      },
      body: jsonEncode(body),
    );
    print(response.statusCode);
    if (response.statusCode == 200) {
      return BookResponseModel.fromJson(jsonDecode(response.body));
    } else {
      print("Error: ${response.statusCode}");
      return null;
    }
  } catch (e) {
    rethrow;
  }
}

//get books
Future<BooksModel?> getBooksService() async {
  try {
    String id = await StorageManager.readData("id");
    String url = "${BASE_URL}/book/member/$id";
    var response = await http.get(
      Uri.parse(url),
      headers: {
        'Content-Type': 'application/json',
      },
    );
    if (response.statusCode == 200) {
      return BooksModel.fromJson(jsonDecode(response.body));
    } else {
      print("Error: ${response.statusCode}");
      return null;
    }
  } catch (e) {
    rethrow;
  }
}

//get book
Future<BookModel?> getBookService({required String id}) async {
  String url = "${BASE_URL}/book/$id";
  try {
    var response = await http.get(
      Uri.parse(url),
      headers: {
        'Content-Type': 'application/json',
      },
    );
    if (response.statusCode == 200) {
      return BookModel.fromJson(jsonDecode(response.body));
    } else {
      print("Error: ${response.statusCode}");
      return null;
    }
  } catch (e) {
    rethrow;
  }
}
