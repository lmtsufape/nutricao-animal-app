import 'package:dio/dio.dart';
import 'package:nutricaoanimal/shared/constants/app_text_constants.dart';

class SignUpRepository {
  static void signUp(name, email, password) async {
    final dio = Dio();
    var response = await dio.post('$kBaseUrl/users',
        options: Options(
          headers: {
            "Content-Type": "application/json",
            "Accept": "apllication/json"
          },
        ),
        data: {
          "name": name,
          "email": email,
          "password": password,
        });
    print(response.statusCode);
  }
}
