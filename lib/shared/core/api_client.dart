import 'package:dio/dio.dart';
import 'package:logging/logging.dart';

class ApiClient {
  final _logger = Logger('ApiClient');
  final Dio _httpClient = Dio();
  final String _baseUrl = 'https://api.github.com';

  static final defaultHeader = {
    'Content-Type': 'application/json',
    'Accept': 'application/json',
  };

  Future<Response?> signIn(
      {required String email, required String password}) async {
    try {
      final response = await _httpClient.post('$_baseUrl/signin',
          options: Options(headers: defaultHeader),
          data: {
            'email': email,
            'password': password,
          });
      if (response.statusCode != 200) {
        _logger.severe('Error on signIn: ${response.statusCode}');
        return null;
      } else {
        _logger.fine('Successful signed in: ${response.data['message']}');
        return response.data;
      }
    } catch (e) {
      _logger.severe('Error on signIn: $e');
      return null;
    }
  }
}
