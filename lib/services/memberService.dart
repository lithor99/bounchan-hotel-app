import 'dart:io';
import 'package:bounchan_hotel_member_app/constants/string.dart';
import 'package:bounchan_hotel_member_app/models/loginModel.dart';
import 'package:bounchan_hotel_member_app/models/memberModel.dart';
import 'package:bounchan_hotel_member_app/models/uploadModel.dart';
import 'package:http/http.dart' as http;
import 'dart:convert';
import '../utils/storageManager.dart';

//create staff
Future<String> registerService({
  required String name,
  required String lastName,
  required String gender,
  required String phoneNumber,
  required String email,
  required String password,
  String? image,
}) async {
  String url = "${BASE_URL}/member";
  Map body = {
    "name": name,
    "lastName": lastName,
    "gender": gender,
    "phoneNumber": phoneNumber,
    "email": email,
    "password": password,
    "image": image,
  };
  try {
    var response = await http.post(
      Uri.parse(url),
      headers: {
        'Content-Type': 'application/json',
      },
      body: jsonEncode(body),
    );
    if (response.statusCode == 200) {
      return "success";
    } else {
      print("Error: ${response.statusCode}");
      return "failed";
    }
  } catch (e) {
    rethrow;
  }
}

//login
Future<LoginModel?> loginService(
    {required String email, required String password}) async {
  String url = "${BASE_URL}/member/login";
  try {
    Map body = {"email": email, "password": password};
    print(body);
    var response = await http.post(
      Uri.parse(url),
      headers: {
        'Content-Type': 'application/json',
      },
      body: jsonEncode(body),
    );
    if (response.statusCode == 200) {
      LoginModel loginModel = LoginModel.fromJson(jsonDecode(response.body));

      //delete data from local storage
      StorageManager.deleteData("id");
      StorageManager.deleteData("name");
      StorageManager.deleteData("image");
      StorageManager.deleteData("email");
      StorageManager.deleteData("phoneNumber");
      StorageManager.deleteData("token");
      StorageManager.deleteData("password");
      //save data to local storage
      StorageManager.saveData("id", loginModel.result!.data!.id);
      StorageManager.saveData(
          "name",
          loginModel.result!.data!.name! +
              " " +
              loginModel.result!.data!.lastName!);
      StorageManager.saveData("image", loginModel.result!.data!.image);
      StorageManager.saveData("email", loginModel.result!.data!.email);
      StorageManager.saveData(
          "phoneNumber", loginModel.result!.data!.phoneNumber);
      StorageManager.saveData("token", loginModel.result!.token);
      return loginModel;
    } else {
      print("Error: ${response.statusCode}");
      return null;
    }
  } catch (e) {
    rethrow;
  }
}

//upload image
Future<UploadModel?> uploadFileService({required File file}) async {
  try {
    var request = http.MultipartRequest(
      'POST',
      Uri.parse("$BASE_URL/upload"),
    );
    request.files.add(await http.MultipartFile.fromPath('file', file.path));
    var response = await request.send();
    var responseString = await response.stream.bytesToString();
    if (response.statusCode == 200) {
      return UploadModel.fromJson(jsonDecode(responseString));
    }
    return null;
  } catch (e) {
    rethrow;
  }
}

//get profile
Future<MemberModel?> getProfileService({required String id}) async {
  String url = "${BASE_URL}/member/$id";
  try {
    var response = await http.get(
      Uri.parse(url),
      headers: {
        'Content-Type': 'application/json',
      },
    );
    if (response.statusCode == 200) {
      return MemberModel.fromJson(jsonDecode(response.body));
    } else {
      print("Error: ${response.statusCode}");
      return null;
    }
  } catch (e) {
    rethrow;
  }
}

//check email
Future<String> checkEmailService({required String email}) async {
  String url = "${BASE_URL}/member/check/email/$email";
  try {
    var response = await http.get(
      Uri.parse(url),
      headers: {
        'Content-Type': 'application/json',
      },
    );
    if (response.statusCode == 200) {
      return "no";
    } else {
      return "yes";
    }
  } catch (e) {
    rethrow;
  }
}

//update profile
Future<String> updateProfileService({
  required String id,
  required String name,
  required String lastName,
  required String gender,
  required String phoneNumber,
  required String email,
  String? image,
}) async {
  String url = "${BASE_URL}/member/$id";
  Map body = {
    "name": name,
    "lastName": lastName,
    "gender": gender,
    "phoneNumber": phoneNumber,
    "email": email,
    "image": image,
  };
  try {
    String token = await StorageManager.readData("token");
    var response = await http.put(
      Uri.parse(url),
      headers: {
        'Content-Type': 'application/json',
        'Authorization': 'Bearer $token'
      },
      body: jsonEncode(body),
    );
    if (response.statusCode == 200) {
      return "success";
    } else {
      print("Error: ${response.statusCode}");
      return "failed";
    }
  } catch (e) {
    rethrow;
  }
}

//change password
Future<String> changePasswordService({
  required String id,
  required String oldPassword,
  required String newPassword,
}) async {
  String url = "${BASE_URL}/member/update/password/$id";
  Map body = {
    "oldPassword": oldPassword,
    "newPassword": newPassword,
  };
  try {
    String token = await StorageManager.readData("token");
    var response = await http.put(
      Uri.parse(url),
      headers: {
        'Content-Type': 'application/json',
        'Authorization': 'Bearer $token'
      },
      body: jsonEncode(body),
    );
    if (response.statusCode == 200) {
      return "success";
    } else if (response.statusCode == 202) {
      return "incorrect";
    } else {
      print("Error: ${response.statusCode}");
      return "failed";
    }
  } catch (e) {
    rethrow;
  }
}

//reset password
Future<String> resetPasswordService({
  required String email,
  required String newPassword,
}) async {
  String url = "${BASE_URL}/member/reset/password";
  Map body = {
    "email": email,
    "newPassword": newPassword,
  };
  try {
    var response = await http.put(
      Uri.parse(url),
      headers: {
        'Content-Type': 'application/json',
      },
      body: jsonEncode(body),
    );
    if (response.statusCode == 200) {
      return "success";
    } else {
      print("Error: ${response.statusCode}");
      return "failed";
    }
  } catch (e) {
    rethrow;
  }
}
