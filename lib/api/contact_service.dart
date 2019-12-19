import 'dart:convert';

import 'package:flutter_contact_list/model/model.dart';
import 'package:http/http.dart' as http;

class ContactService{

  static Future<ContactData> fetch() async{
    final response = await http.get('https://reqres.in/api/users');

    if (response.statusCode == 200) {
      return ContactData.fromJson(json.decode(response.body));
    }

    throw Exception('Failed to load post');
  }
}
