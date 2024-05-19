import 'package:bounchan_hotel_member_app/constants/string.dart';
import 'package:bounchan_hotel_member_app/models/roomAsTypeModel.dart';
import 'package:bounchan_hotel_member_app/models/roomModel.dart';
import 'package:bounchan_hotel_member_app/models/roomsModel.dart';
import 'package:http/http.dart' as http;
import 'dart:convert';

//get rooms
Future<RoomsModel?> getRoomsService() async {
  String url = "${BASE_URL}/room/member";
  try {
    var response = await http.get(
      Uri.parse(url),
      headers: {
        'Content-Type': 'application/json',
      },
    );
    print("------------------ ${response.statusCode}");
    if (response.statusCode == 200) {
      return RoomsModel.fromJson(jsonDecode(response.body));
    } else {
      print("Error: ${response.statusCode}");
      return null;
    }
  } catch (e) {
    rethrow;
  }
}

//get room
Future<RoomModel?> getRoomService({required String id}) async {
  String url = "${BASE_URL}/room/$id";
  try {
    var response = await http.get(
      Uri.parse(url),
      headers: {
        'Content-Type': 'application/json',
      },
    );
    if (response.statusCode == 200) {
      return RoomModel.fromJson(jsonDecode(response.body));
    } else {
      print("Error: ${response.statusCode}");
      return null;
    }
  } catch (e) {
    rethrow;
  }
}

//get room by type
Future<RoomAsTypeModel?> getRoomsByTypeService({required String id}) async {
  String url = "${BASE_URL}/room/room-type/$id";
  try {
    var response = await http.get(
      Uri.parse(url),
      headers: {
        'Content-Type': 'application/json',
      },
    );
    if (response.statusCode == 200) {
      return RoomAsTypeModel.fromJson(jsonDecode(response.body));
    } else {
      print("Error: ${response.statusCode}");
      return null;
    }
  } catch (e) {
    rethrow;
  }
}
