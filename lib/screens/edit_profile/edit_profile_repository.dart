import 'package:dio/dio.dart';
import 'package:shared_preferences/shared_preferences.dart';
import 'package:thunderapp/shared/constants/app_text_constants.dart';

class EditProfileRepository {
  late int userId;
  late String userToken;

  Future<bool> patchUser(name, email) async {
    Dio dio = Dio();

    final prefs = await SharedPreferences.getInstance();

    userId = prefs.getInt('id')!;
    userToken = prefs.getString('token')!;

    var response = await dio.patch(
      '$kBaseUrl/users/$userId',
      options: Options(
        headers: {
          "Content-Type": "application/json",
          "Accept": "application/json",
          "Authorization": "Bearer $userToken"
        },
      ),
      data: {
        "name": name.toString(),
        "email": email.toString(),
      },
    );
    print(response.statusCode);
    return response.statusCode == 200 || response.statusCode == 201
        ? true
        : false;
  }
}
