import 'dart:convert';

import 'package:flutter/material.dart';
import 'package:http/http.dart' as http;
import 'package:thunderapp/shared/constants/app_text_constants.dart';
import 'package:thunderapp/shared/core/models/breed_model.dart';

class AddAnimalRepository {
  Future<bool> getBreed() async {
    var response = await http.get(Uri.parse('$kBaseUrl/users/breed/specie'));

    print(response.statusCode);

    return true;
  }
}
