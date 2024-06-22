import 'dart:convert';

import 'package:get/get.dart';
import 'package:http/http.dart'as http;
import 'package:project1/Model/Api_method/App_urls.dart';

class ShowUserDetails extends GetxController{

  var islodaing=false.obs;
  var data;
  Future dataFunction(String email,String name,String PhoneNumber,String address,String city,String state,String Birthdate)async{
    try{
      islodaing.value=true;
      final response= await http.post(Uri.parse(appUrl.showuser),
          headers:<String,String>{
            "AuthToken":"2ec26ad9-e039-445e-915e-zACl56sr2q"
          },
          body:jsonEncode(<String,String>{
            "name":name,
            "email":email,
          })
      );
      if(response.statusCode==200 ){
        var data = jsonDecode(response.body);
        print('Login successful: $data');
      }
      else{
        print('Failed to login: ${response.statusCode}');
        throw Exception('Failed to login');
      }
    }
    finally{
      islodaing.value=false;
    }



  }

}
Future<void> loginUser(String email, String password) async {
  final url = Uri.parse('https://example.com/api/login'); // Replace with your API URL

  final response = await http.post(
    url,
    headers: <String, String>{
      'Content-Type': 'application/json; charset=UTF-8',
    },
    body: jsonEncode(<String, String>{
      'email': email,
      'password': password,
    }),
  );

  if (response.statusCode == 200) {
    // If the server returns a 200 OK response, parse the JSON
    var data = jsonDecode(response.body);
    print('Login successful: $data');
  } else {
    // If the server did not return a 200 OK response, throw an exception
    print('Failed to login: ${response.statusCode}');
    throw Exception('Failed to login');
  }
}