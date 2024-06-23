import 'dart:convert';
import 'package:firebase_auth/firebase_auth.dart';
import 'package:http/http.dart' as http;

Future<User?> createUser(
  String name,
  String email,
  String phoneNumber,
  String gender,
  String address,
  String city,
  String state,
    String date_of_birth,
) async {
  final response = await http.post(
    Uri.parse('https://api.baii.me/api/createglobaluser'),
    headers: <String, String>{
      'Content-Type': 'application/json; charset=UTF-8',
      'AuthToken' : '2ec26ad9-e039-445e-915e-zACl56sr2q',
    },
    body: jsonEncode({
      'name': name,
      'email': email,
      'phone_number': phoneNumber,
      'gender': gender,
      'address': address,
      'city': city,
      'state': state,
      'date_of_birth': date_of_birth,
    }),
  );
  print(response.statusCode);
  if (response.statusCode == 200) {
    print(response.body);
    return jsonDecode(response.body);
  } else {
    throw Exception('Failed to create user');
  }
}
