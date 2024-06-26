import 'dart:convert';
import 'package:flutter/cupertino.dart';
import 'package:http/http.dart' as http;
import '../../../api/homescreen/model/superhero_model.dart';

class HomeScreenController with ChangeNotifier{
  List<Superhero>? superherosList;
  SuperheroModel? responseModel;
  
  ///function to fetch the data from api 
  Future<void> fetchData() async {
    final url = Uri.parse("https://protocoderspoint.com/jsondata/superheros.json");
    var response = await http.get(url);
    if(response.statusCode==200){
      var decodeData = jsonDecode(response.body);
       responseModel = SuperheroModel.fromJson(decodeData);
       if(responseModel !=null){
         superherosList = responseModel?.superheros??[];
       }
      print(responseModel?.superheros?.first.name);
    }else{
      print("Api Failed");
    }
    notifyListeners();
  }
}