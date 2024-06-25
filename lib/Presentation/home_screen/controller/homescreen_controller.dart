import 'dart:convert';
import 'package:flutter/cupertino.dart';
import 'package:http/http.dart' as http;

class HomeScreenController with ChangeNotifier{
  
  ///function to fetch the data from api 
  Future<void> fetchData() async {
    final url = Uri.parse("https://protocoderspoint.com/jsondata/superheros.json");
    var response = await http.get(url);
    if(response.statusCode==200){
      var decodeData = jsonDecode(response.body);
      print(decodeData);
    }else{
      print("Api Failed");
    }
  }
}