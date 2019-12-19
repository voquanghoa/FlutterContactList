import 'dart:convert';

import 'package:contacts/model/model.dart';
import 'package:http/http.dart' as http;

class ContactService{

  static Future<ContactData> fetch([page = 1]) async{
    final response = await http.get('https://reqres.in/api/users?per_page=3&page=$page');

    if (response.statusCode == 200) {
      return ContactData.fromJson(json.decode(response.body));
    }

    throw Exception('Failed to load post');
  }
}
